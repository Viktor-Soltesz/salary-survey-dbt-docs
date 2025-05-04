

  create or replace view `software-developer-salaries`.`surveys`.`stg_survey_data`
  OPTIONS(
      description="""Staging model for raw developer survey data.  Performs basic text cleaning, type casting, generates unique IDs,  and adds a processing timestamp. Raw values are kept in '_raw' columns for consistency before semantic cleaning in intermediate layers.\n"""
    )
  as -- stg_survey_data.sql


-- This model selects raw survey data, casts data types,
-- generates a unique ID, adds a processing timestamp,
-- and performs initial basic cleaning/standardization
-- on text fields.

SELECT
    to_hex(md5(cast(coalesce(cast(year as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(country as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(seniority_level as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(job_category as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(salary as string), '_dbt_utils_surrogate_key_null_') as string))) AS survey_entry_id, -- Generate a unique ID

    ROW_NUMBER() OVER (ORDER BY year, country, seniority_level, job_category, salary) AS entry_number, -- for human readability

    CAST(year AS INT) AS year_raw,
    
    TRIM(LOWER(seniority_level)) AS seniority_level_raw,

    TRIM(LOWER(employment_status)) AS employment_status_raw,

    CAST(salary AS NUMERIC) AS salary_raw,

    TRIM(LOWER(country)) AS country_raw, -- Store the cleaned raw string for joining

    TRIM(LOWER(company_size)) AS company_size_raw,

    TRIM(LOWER(job_category)) AS job_category_raw,

    timestamp(datetime(current_timestamp(), 'Europe/Berlin')) AS dbt_processed_at -- Timestamp when this record was processed by dbt

FROM
    `software-developer-salaries`.`surveys`.`developer_salaries`

WHERE
    -- Add basic filtering for clearly invalid records if necessary
    salary IS NOT NULL AND salary > 0
    AND year IS NOT NULL AND year BETWEEN 2000 AND EXTRACT(YEAR FROM timestamp(datetime(current_timestamp(), 'Europe/Berlin')))
ORDER BY entry_number

--LIMIT 1000 -- Limit for testing purposes, remove in production;

