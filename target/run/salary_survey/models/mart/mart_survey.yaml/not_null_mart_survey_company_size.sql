select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select company_size
from `software-developer-salaries`.`surveys`.`mart_survey`
where company_size is null



      
    ) dbt_internal_test