select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select entry_number
from `software-developer-salaries`.`surveys`.`mart_survey`
where entry_number is null



      
    ) dbt_internal_test