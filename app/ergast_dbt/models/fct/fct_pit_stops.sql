with
    
pitstops as (
    select * from {{ source("ergast", "pitstops") }}
),

dim_races as (
    select * from {{ ref("dim_races") }}
),

final as (
    select 
        r.race_sk::varchar, 
        p.stop::int as stop_number, 
        p.lap::int, 
        p.time::varchar, 
        p.milliseconds::int as duration_ms

    from pitstops p
    left join dim_races r 
        on p."raceId"::varchar = r.race_id
)

select * from final



