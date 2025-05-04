



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`

where not(p75_salary_norm >= p25_salary_norm)

