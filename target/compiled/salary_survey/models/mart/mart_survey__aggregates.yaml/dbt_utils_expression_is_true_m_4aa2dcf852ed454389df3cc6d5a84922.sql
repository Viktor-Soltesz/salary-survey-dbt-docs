



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey__aggregates`

where not(stddev_salary_norm >= 0)

