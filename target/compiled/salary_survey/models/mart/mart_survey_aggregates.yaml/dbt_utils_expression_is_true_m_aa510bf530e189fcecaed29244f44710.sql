



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`

where not(p25_salary_norm >= 0)

