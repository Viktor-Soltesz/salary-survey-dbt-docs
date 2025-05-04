select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select avg_salary_gdp
from `software-developer-salaries`.`surveys`.`mart_survey__aggregates`
where avg_salary_gdp is null



      
    ) dbt_internal_test