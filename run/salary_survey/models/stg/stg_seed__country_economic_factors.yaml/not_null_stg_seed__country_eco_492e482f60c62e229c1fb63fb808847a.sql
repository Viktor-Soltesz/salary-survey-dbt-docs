select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select mean_income_2020_usd
from `software-developer-salaries`.`surveys`.`stg_seed__country_economic_factors`
where mean_income_2020_usd is null



      
    ) dbt_internal_test