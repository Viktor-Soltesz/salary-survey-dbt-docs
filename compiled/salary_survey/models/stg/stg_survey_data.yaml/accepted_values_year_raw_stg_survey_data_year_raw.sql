
SELECT *
FROM `software-developer-salaries`.`surveys`.`stg_survey_data`
WHERE CAST(year_raw AS INT) NOT IN (2018, 2019, 2020, 2021, 2022, 2023, 2024) --'2018', '2019', '2020', '2021', '2022', '2023', '2024'
