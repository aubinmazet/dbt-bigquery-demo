select date_trunc('month', date) as month, sum(deces), sum(gueris)
from {{ ref('covid_france') }}
group by month