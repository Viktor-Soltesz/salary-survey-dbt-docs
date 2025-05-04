select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select job_category
from `software-developer-salaries`.`surveys`.`int_survey_data__cleaned`
where job_category is null



      
    ) dbt_internal_test