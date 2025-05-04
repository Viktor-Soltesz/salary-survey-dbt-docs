select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select factor_to_2024
from `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`
where factor_to_2024 is null



      
    ) dbt_internal_test