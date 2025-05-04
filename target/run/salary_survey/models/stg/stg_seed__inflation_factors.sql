

  create or replace view `software-developer-salaries`.`surveys`.`stg_seed__inflation_factors`
  OPTIONS(
      description="""Staging model for inflation factors used to normalize salaries to 2024 values. This seed contains one global inflation factor per year from 2018 to 2024.\n"""
    )
  as -- stg_seed_inflation_factors.sql


WITH source AS (
    SELECT *
    FROM `software-developer-salaries`.`surveys_seeds`.`seed__inflation_factors`
)

SELECT
    CAST(year AS NUMERIC) AS year,
    CAST(factor_to_2024 AS NUMERIC) AS factor_to_2024
FROM source;

