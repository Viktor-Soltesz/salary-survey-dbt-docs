
    
    

with all_values as (

    select
        company_size as value_field,
        count(*) as n_records

    from `software-developer-salaries`.`surveys`.`int_survey_data__cleaned`
    group by company_size

)

select *
from all_values
where value_field not in (
    's','m','l','other'
)


