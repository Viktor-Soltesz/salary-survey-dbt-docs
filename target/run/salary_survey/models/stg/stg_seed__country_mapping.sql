

  create or replace view `software-developer-salaries`.`surveys`.`stg_seed__country_mapping`
  OPTIONS(
      description="""Staging model for the country mapping seed. Maps 2-letter ISO country codes to their corresponding full country names.\n"""
    )
  as -- stg_seed__country_mapping.sql


WITH source AS (
    SELECT *
    FROM `software-developer-salaries`.`surveys_seeds`.`seed__country_mapping`
)

SELECT
    country_name,
    country_code
FROM source;

