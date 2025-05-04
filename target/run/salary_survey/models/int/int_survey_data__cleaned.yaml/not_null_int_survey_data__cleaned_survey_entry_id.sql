select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select survey_entry_id
from `software-developer-salaries`.`surveys`.`int_survey_data__cleaned`
where survey_entry_id is null



      
    ) dbt_internal_test