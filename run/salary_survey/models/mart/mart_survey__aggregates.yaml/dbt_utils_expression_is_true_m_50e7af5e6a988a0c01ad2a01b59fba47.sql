select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey__aggregates`

where not(avg_salary_2024 >= 0)


      
    ) dbt_internal_test