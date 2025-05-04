
  
    

    create or replace table `software-developer-salaries`.`surveys`.`mart_survey`
        
  (
    survey_entry_id STRING,
    entry_number INT64,
    year INT64,
    country STRING,
    country_name STRING,
    job_category STRING,
    seniority_level STRING,
    employment_status STRING,
    company_size STRING,
    salary NUMERIC,
    salary_norm2024 NUMERIC,
    salary_normgdp NUMERIC,
    salary_norm NUMERIC,
    gdp_ppp FLOAT64,
    factor_to_2024 NUMERIC,
    z_score_modif NUMERIC
    
    )

      
    
    

    OPTIONS(
      description="""Final curated dataset of developer salary survey responses. This mart excludes statistical outliers and includes enriched salary information normalized for inflation and GDP per capita. Designed for dashboarding, reporting, and downstream analysis.\n"""
    )
    as (
      
    select survey_entry_id, entry_number, year, country, country_name, job_category, seniority_level, employment_status, company_size, salary, salary_norm2024, salary_normgdp, salary_norm, gdp_ppp, factor_to_2024, z_score_modif
    from (
        -- mart_survey.sql



-- This model provides the final cleaned and normalized dataset of global developer salaries,
-- ready for consumption by dashboards, reporting, or analysis.
-- It excludes statistical outliers and selects only meaningful fields.

WITH source AS (
    SELECT *
    FROM `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`
    WHERE is_outlier = FALSE
)

SELECT
    -- IDs
    CAST(survey_entry_id AS STRING) AS survey_entry_id,
    CAST(entry_number AS INT64) AS entry_number,

    -- Time
    CAST(year AS INT64) AS year,

    -- Key dimensions
    CAST(country AS STRING) AS country,
    CAST(country_name AS STRING) AS country_name,
    CAST(job_category AS STRING) AS job_category,
    CAST(seniority_level AS STRING) AS seniority_level,
    CAST(employment_status AS STRING) AS employment_status,
    CAST(company_size AS STRING) AS company_size,

    -- Raw and normalized values
    CAST(salary AS NUMERIC) AS salary,
    CAST(salary_norm2024 AS NUMERIC) AS salary_norm2024,
    CAST(salary_normgdp AS NUMERIC) AS salary_normgdp,
    CAST(salary_norm AS NUMERIC) AS salary_norm,

    -- Enrichment fields
    CAST(gdp_ppp AS FLOAT64) AS gdp_ppp,
    CAST(factor_to_2024 AS NUMERIC) AS factor_to_2024,

    -- Outlier score (for reference only)
    CAST(z_score_modif AS NUMERIC) AS z_score_modif

FROM source
    ) as model_subq
    );
  