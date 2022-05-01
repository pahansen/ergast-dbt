-- Only drivers that have at least 1 race are within the stats.
select 
    count_races
from {{ ref('int_driver_stats') }}
where count_races <= 0