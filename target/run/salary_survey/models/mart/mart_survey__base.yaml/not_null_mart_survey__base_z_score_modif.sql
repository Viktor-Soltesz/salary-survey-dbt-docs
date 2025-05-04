select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select z_score_modif
from `software-developer-salaries`.`surveys`.`mart_survey__base`
where z_score_modif is null



      
    ) dbt_internal_test