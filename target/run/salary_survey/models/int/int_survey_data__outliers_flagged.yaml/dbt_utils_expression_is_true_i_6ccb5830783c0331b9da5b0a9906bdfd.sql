select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`

where not(is_outlier IN (TRUE, FALSE))


      
    ) dbt_internal_test