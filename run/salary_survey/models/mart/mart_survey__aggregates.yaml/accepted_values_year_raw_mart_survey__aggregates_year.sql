select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
SELECT *
FROM `software-developer-salaries`.`surveys`.`mart_survey__aggregates`
WHERE CAST(year AS INT) NOT IN (2018, 2019, 2020, 2021, 2022, 2023, 2024) --'2018', '2019', '2020', '2021', '2022', '2023', '2024'

      
    ) dbt_internal_test