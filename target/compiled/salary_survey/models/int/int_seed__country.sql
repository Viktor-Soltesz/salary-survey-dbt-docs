-- int_seed__country.sql


SELECT
    cs.country_code,
    cm.country_name,
    cs.gdp_ppp
FROM `software-developer-salaries`.`surveys`.`stg_seed__country_economic_factors` cs
LEFT JOIN `software-developer-salaries`.`surveys`.`stg_seed__country_mapping` cm
    ON cs.country_code = cm.country_code
WHERE cs.gdp_ppp IS NOT NULL