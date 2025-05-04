select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select employment_status
from `software-developer-salaries`.`surveys`.`mart_survey`
where employment_status is null



      
    ) dbt_internal_test