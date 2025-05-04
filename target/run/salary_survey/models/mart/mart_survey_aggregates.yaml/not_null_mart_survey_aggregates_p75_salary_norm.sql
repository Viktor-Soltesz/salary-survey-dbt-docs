select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select p75_salary_norm
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`
where p75_salary_norm is null



      
    ) dbt_internal_test