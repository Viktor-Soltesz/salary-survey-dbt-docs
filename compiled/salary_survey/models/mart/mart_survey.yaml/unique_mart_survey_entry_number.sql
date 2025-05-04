
    
    

with dbt_test__target as (

  select entry_number as unique_field
  from `software-developer-salaries`.`surveys`.`mart_survey`
  where entry_number is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


