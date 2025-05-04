



select
    1
from `software-developer-salaries`.`surveys`.`int_survey_data__outliers_flagged`

where not(is_outlier IN (TRUE, FALSE))

