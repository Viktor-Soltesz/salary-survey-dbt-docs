
  
    

    create or replace table `software-developer-salaries`.`surveys`.`mart_survey__aggregates`
        
  (
    country STRING,
    country_name STRING,
    year INT64,
    seniority_level STRING,
    job_category STRING,
    company_size STRING,
    entry_count INT64,
    median_salary_norm NUMERIC,
    median_salary_2024 NUMERIC,
    median_salary_gdp NUMERIC,
    avg_salary_norm NUMERIC,
    avg_salary_2024 NUMERIC,
    avg_salary_gdp NUMERIC,
    p25_salary_norm NUMERIC,
    p75_salary_norm NUMERIC,
    stddev_salary_norm FLOAT64,
    iqr_salary_norm NUMERIC,
    skewness_indicator NUMERIC
    
    )

      
    
    

    OPTIONS(
      description="""This model provides aggregated salary statistics derived from the cleaned, normalized, and outlier-flagged survey data.\nIt groups the data by key demographic and job-related attributes such as country, year, seniority level, job category, and company size.\nThe resulting aggregates, including median, average, percentiles, and standard deviation, are designed to support\nhigh-level dashboarding, trend analysis, and comparative studies of developer salaries across different segments.\nOutliers are excluded from these calculations to provide a more representative view of typical salary ranges.\n"""
    )
    as (
      
    select country, country_name, year, seniority_level, job_category, company_size, entry_count, median_salary_norm, median_salary_2024, median_salary_gdp, avg_salary_norm, avg_salary_2024, avg_salary_gdp, p25_salary_norm, p75_salary_norm, stddev_salary_norm, iqr_salary_norm, skewness_indicator
    from (
        -- mart_survey_aggregates.sql


-- This model aggregates survey data by key dimensions, providing summary statistics
-- for normalized salary values.

SELECT
    -- Dimensions
    CAST(country AS STRING) AS country,
    CAST(country_name AS STRING) AS country_name,
    CAST(year AS INT64) AS year,
    CAST(seniority_level AS STRING) AS seniority_level,
    CAST(job_category AS STRING) AS job_category,
    CAST(company_size AS STRING) AS company_size,

    CAST(COUNT(*) AS INT64) AS entry_count,

    -- Measures of center
    CAST(APPROX_QUANTILES(salary_norm, 100)[OFFSET(50)] AS NUMERIC) AS median_salary_norm,
    CAST(APPROX_QUANTILES(salary_norm2024, 100)[OFFSET(50)] AS NUMERIC) AS median_salary_2024,
    CAST(APPROX_QUANTILES(salary_normgdp, 100)[OFFSET(50)] AS NUMERIC) AS median_salary_gdp,

    CAST(AVG(salary_norm) AS NUMERIC) AS avg_salary_norm,
    CAST(AVG(salary_norm2024) AS NUMERIC) AS avg_salary_2024,
    CAST(AVG(salary_normgdp) AS NUMERIC) AS avg_salary_gdp,

    -- Measures of spread
    CAST(APPROX_QUANTILES(salary_norm, 100)[OFFSET(25)] AS NUMERIC) AS p25_salary_norm,
    CAST(APPROX_QUANTILES(salary_norm, 100)[OFFSET(75)] AS NUMERIC) AS p75_salary_norm,
    CAST(STDDEV(salary_norm) AS FLOAT64) AS stddev_salary_norm, -- STDDEV often returns FLOAT64

    -- Interquartile Range and Skewness approximation (Calculations involving NUMERICs result in NUMERIC)
    CAST(
        APPROX_QUANTILES(salary_norm, 100)[OFFSET(75)] -
        APPROX_QUANTILES(salary_norm, 100)[OFFSET(25)]
        AS NUMERIC
    ) AS iqr_salary_norm,

    CAST(
        AVG(salary_norm) - APPROX_QUANTILES(salary_norm, 100)[OFFSET(50)]
        AS NUMERIC
    ) AS skewness_indicator

FROM `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`
WHERE is_outlier IS FALSE -- Assuming is_outlier exists in the referenced model
GROUP BY
    country,
    country_name,
    year,
    seniority_level,
    job_category,
    company_size
    ) as model_subq
    );
  