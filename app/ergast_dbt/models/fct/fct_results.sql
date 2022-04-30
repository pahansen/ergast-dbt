with 

results as (
    select * from {{ source("ergast", "results") }}
),

dim_races as (
    select * from {{ ref("dim_races") }}
),

dim_drivers as (
    select * from {{ ref("dim_drivers") }}
),

dim_constructors as (
    select * from {{ ref("dim_constructors") }}
),

final as (
    select
        r.race_sk,
        d.driver_sk,
        c.constructor_sk,
        rs.grid::int as grid_position,
        (case 
                when rs.position = '\N'
                then null
                else rs.position::int
        end) as final_position,
        rs.points::decimal,
        rs.laps::int as number_of_laps_raced,
        rs.time::varchar as race_time,
        (case 
                when rs."fastestLap" = '\N'
                then null
                else rs."fastestLap"::int
        end) as fastest_lap_number,
        (case 
                when rs."fastestLapTime" = '\N'
                then null
                else rs."fastestLapTime"
        end) as fastest_lap_time,
        (case 
                when rs."fastestLapSpeed" = '\N'
                then null
                else rs."fastestLapSpeed"
        end) as fastest_lap_speed

    from results rs
    left join dim_races r 
        on rs."raceId"::varchar = r.race_id
    left join dim_drivers d
        on rs."driverId"::varchar = d.driver_id
    left join dim_constructors c
        on rs."constructorId"::varchar = c.constructor_id

)

select * from final