{{ 
    config(
        materialized='table'
        ) 
    
}}

select 
    DATE_TRUNC(cast(date as date), MONTH) as month, 
    sum(deces) as sum_deces, 
    sum(gueris) as sum_gueris
from covid.covid_france
group by month
order by month desc