
    
    

with dbt_test__target as (

  select survey_entry_id as unique_field
  from `software-developer-salaries`.`surveys`.`stg_survey_data`
  where survey_entry_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


