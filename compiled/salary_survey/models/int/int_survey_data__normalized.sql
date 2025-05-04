-- int_survey_data__normalized.sql


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
    ON sd.year = inf.year