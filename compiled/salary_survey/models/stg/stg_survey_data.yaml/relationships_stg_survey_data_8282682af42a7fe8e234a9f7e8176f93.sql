
    
    

with child as (
    select salary_raw as from_field
    from `software-developer-salaries`.`surveys`.`stg_survey_data`
    where salary_raw is not null
),

parent as (
    select salary_raw as to_field
    from `software-developer-salaries`.`surveys`.`stg_survey_data`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


