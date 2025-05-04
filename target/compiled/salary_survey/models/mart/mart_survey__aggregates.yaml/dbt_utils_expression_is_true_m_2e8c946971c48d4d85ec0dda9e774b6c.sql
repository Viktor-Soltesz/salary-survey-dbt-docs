



select
    1
from `software-developer-salaries`.`surveys`.`mart_survey__aggregates`

where not(iqr_salary_norm >= 0)

