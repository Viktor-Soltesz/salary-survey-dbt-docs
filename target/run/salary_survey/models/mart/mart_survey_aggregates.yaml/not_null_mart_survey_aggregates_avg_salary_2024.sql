select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select avg_salary_2024
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`
where avg_salary_2024 is null



      
    ) dbt_internal_test