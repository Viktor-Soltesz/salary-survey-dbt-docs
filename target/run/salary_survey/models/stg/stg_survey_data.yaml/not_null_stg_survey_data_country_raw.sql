select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_raw
from `software-developer-salaries`.`surveys`.`stg_survey_data`
where country_raw is null



      
    ) dbt_internal_test