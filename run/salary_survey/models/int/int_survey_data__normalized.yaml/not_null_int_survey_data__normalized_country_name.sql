select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_name
from `software-developer-salaries`.`surveys`.`int_survey_data__normalized`
where country_name is null



      
    ) dbt_internal_test