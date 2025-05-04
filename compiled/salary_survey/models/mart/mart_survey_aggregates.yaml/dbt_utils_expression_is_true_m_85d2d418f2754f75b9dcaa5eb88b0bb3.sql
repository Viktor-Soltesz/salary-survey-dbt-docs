



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`

where not(median_salary_2024 >= 0)

