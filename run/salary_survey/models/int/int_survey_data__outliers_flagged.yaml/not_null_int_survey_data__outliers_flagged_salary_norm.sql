select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select salary_norm
from `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`
where salary_norm is null



      
    ) dbt_internal_test