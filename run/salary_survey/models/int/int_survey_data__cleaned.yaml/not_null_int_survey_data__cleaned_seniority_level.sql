select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select seniority_level
from `software-developer-salaries`.`surveys`.`int_survey_data__cleaned`
where seniority_level is null



      
    ) dbt_internal_test