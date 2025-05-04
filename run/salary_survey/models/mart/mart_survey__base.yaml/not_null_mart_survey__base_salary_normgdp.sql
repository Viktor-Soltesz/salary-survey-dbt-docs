select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select salary_normgdp
from `software-developer-salaries`.`surveys`.`mart_survey__base`
where salary_normgdp is null



      
    ) dbt_internal_test