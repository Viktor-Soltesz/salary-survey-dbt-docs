

with meet_condition as(
  select *
  from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`
),

validation_errors as (
  select *
  from meet_condition
  where
    -- never true, defaults to an empty result set. Exists to ensure any combo of the `or` clauses below succeeds
    1 = 2
    -- records with a value >= min_value are permitted. The `not` flips this to find records that don't meet the rule.
    or not year >= 2000
    -- records with a value <= max_value are permitted. The `not` flips this to find records that don't meet the rule.
    or not year <= 2030
)

select *
from validation_errors

