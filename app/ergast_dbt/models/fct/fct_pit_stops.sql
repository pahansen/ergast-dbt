with
    
pitstops as (
    select * from {{ source("ergast", "pitstops") }}
),

dim_races as (
    select * from {{ ref("dim_races") }}
),

final as (
    select 
        r.race_sk, 
        p.stop, 
        p.lap, 
        p.time, 
        p.duration, 
        p.milliseconds

    from pitstops p
    left join dim_races r 
        on p."raceId" = r.race_id
)

select * from final



