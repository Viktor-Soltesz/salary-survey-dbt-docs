select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select job_category
from `software-developer-salaries`.`surveys`.`mart_survey`
where job_category is null



      
    ) dbt_internal_test