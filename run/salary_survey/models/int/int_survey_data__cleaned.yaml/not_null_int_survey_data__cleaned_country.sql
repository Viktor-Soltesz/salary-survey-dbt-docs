select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country
from `software-developer-salaries`.`surveys`.`int_survey_data__cleaned`
where country is null



      
    ) dbt_internal_test