select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_name
from `software-developer-salaries`.`surveys`.`int_seed__country`
where country_name is null



      
    ) dbt_internal_test