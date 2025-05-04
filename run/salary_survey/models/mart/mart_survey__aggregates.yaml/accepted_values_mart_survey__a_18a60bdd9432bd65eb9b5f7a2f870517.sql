select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        seniority_level as value_field,
        count(*) as n_records

    from `software-developer-salaries`.`surveys`.`mart_survey__aggregates`
    group by seniority_level

)

select *
from all_values
where value_field not in (
    'en','mi','se','ex','other'
)



      
    ) dbt_internal_test