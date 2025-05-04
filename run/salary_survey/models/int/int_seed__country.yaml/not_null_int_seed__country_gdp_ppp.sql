select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select gdp_ppp
from `software-developer-salaries`.`surveys`.`int_seed__country`
where gdp_ppp is null



      
    ) dbt_internal_test