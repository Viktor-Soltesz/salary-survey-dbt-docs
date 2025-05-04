select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select is_outlier
from `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`
where is_outlier is null



      
    ) dbt_internal_test