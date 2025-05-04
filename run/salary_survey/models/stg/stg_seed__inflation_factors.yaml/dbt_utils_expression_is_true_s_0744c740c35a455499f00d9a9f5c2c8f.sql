select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `software-developer-salaries`.`surveys`.`stg_seed__inflation_factors`

where not(factor_to_2024 >= 0)


      
    ) dbt_internal_test