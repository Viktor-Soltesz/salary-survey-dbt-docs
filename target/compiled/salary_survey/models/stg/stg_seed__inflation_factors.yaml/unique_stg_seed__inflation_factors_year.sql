
    
    

with dbt_test__target as (

  select year as unique_field
  from `software-developer-salaries`.`surveys`.`stg_seed__inflation_factors`
  where year is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


