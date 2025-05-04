select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select employment_status_raw
from `software-developer-salaries`.`surveys`.`stg_survey_data`
where employment_status_raw is null



      
    ) dbt_internal_test