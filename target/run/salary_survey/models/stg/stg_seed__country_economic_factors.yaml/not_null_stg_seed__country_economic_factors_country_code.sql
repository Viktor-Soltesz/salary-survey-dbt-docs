select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_code
from `software-developer-salaries`.`surveys`.`stg_seed__country_economic_factors`
where country_code is null



      
    ) dbt_internal_test