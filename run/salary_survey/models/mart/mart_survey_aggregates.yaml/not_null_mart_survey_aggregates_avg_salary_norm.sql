select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select avg_salary_norm
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`
where avg_salary_norm is null



      
    ) dbt_internal_test