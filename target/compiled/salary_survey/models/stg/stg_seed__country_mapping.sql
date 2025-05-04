-- stg_seed__country_mapping.sql


WITH source AS (
    SELECT *
    FROM `software-developer-salaries`.`surveys_seeds`.`seed__country_mapping`
)

SELECT
    country_name,
    country_code
FROM source