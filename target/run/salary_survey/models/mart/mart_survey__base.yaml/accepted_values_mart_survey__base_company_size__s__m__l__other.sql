select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        company_size as value_field,
        count(*) as n_records

    from `software-developer-salaries`.`surveys`.`mart_survey__base`
    group by company_size

)

select *
from all_values
where value_field not in (
    's','m','l','other'
)



      
    ) dbt_internal_test