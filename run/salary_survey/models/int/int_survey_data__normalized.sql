

  create or replace view `software-developer-salaries`.`surveys`.`int_survey_data__normalized`
  OPTIONS(
      description="""Enriches the cleaned survey data with country-level economic indicators and inflation adjustments. Produces normalized salary values by converting to 2024 values and scaling by GDP per capita.\n"""
    )
  as -- int_survey_data__normalized.sql


SELECT
    sd.*,
    ce.country_name,
    ce.gdp_ppp,
    inf.factor_to_2024,
    sd.salary * inf.factor_to_2024 AS salary_norm2024,
    sd.salary / ce.gdp_ppp AS salary_normgdp,
    (sd.salary * inf.factor_to_2024) / ce.gdp_ppp AS salary_norm
FROM `software-developer-salaries`.`surveys`.`int_survey_data__cleaned` sd
LEFT JOIN `software-developer-salaries`.`surveys`.`int_seed__country` ce
    ON sd.country = ce.country_code
LEFT JOIN `software-developer-salaries`.`surveys`.`stg_seed__inflation_factors` inf
    ON sd.year = inf.year;

