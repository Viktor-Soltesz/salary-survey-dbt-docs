



select
    1
from `software-developer-salaries`.`surveys`.`stg_seed__inflation_factors`

where not(factor_to_2024 >= 0)

