



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey_aggregates`

where not(avg_salary_gdp >= 0)

