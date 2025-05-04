



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`

where not(iqr_salary_norm >= 0)

