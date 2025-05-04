select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select seniority_level_raw
from `software-developer-salaries`.`surveys`.`stg_survey_data`
where seniority_level_raw is null



      
    ) dbt_internal_test