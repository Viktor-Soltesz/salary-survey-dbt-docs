

  create or replace view `software-developer-salaries`.`surveys`.`stg_seed__country_economic_factors`
  OPTIONS(
      description="""Staging model for country-level economic indicators used in salary normalization. Includes GDP-PPP, median and mean income, and average Glassdoor-reported software engineer salary in USD.\n"""
    )
  as -- stg_seed__country_economic_factors.sql


WITH source AS (
    SELECT *
    FROM `software-developer-salaries`.`surveys_seeds`.`seed__country_economic_factors` -- For source freshness check
)

SELECT
    country_code,
    updated_at,
    median_income_2020_usd,
    mean_income_2020_usd,
    gdp_ppp_usd AS gdp_ppp,
    glassdoor_software_engineer_usd
FROM source;

