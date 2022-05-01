with

drivers as (
    select * from {{ ref('dim_drivers') }}
),

results as (
    select * from {{ ref('fct_results') }}
),

race_wins as (
    select
        driver_sk,
        count(r.final_position) as count_race_wins

    from results r
    where r.final_position = 1
    group by driver_sk
),

fastest_laps as (
    select
        r.driver_sk,
        count(r.driver_sk) as count_fastest_laps
    from results r
    join (
        select 
            race_sk,
            min(fastest_lap_time) as driver_fastest_lap_time
        from results
        group by race_sk
    ) r2
        on r.race_sk = r2.race_sk
        and r.fastest_lap_time = r2.driver_fastest_lap_time
    group by driver_sk
),

final as (
    select
        d.firstname,
        d.lastname,
        rw.count_race_wins,
        fl.count_fastest_laps

    from drivers d
    left join race_wins rw
        on d.driver_sk = rw.driver_sk
    left join fastest_laps fl
        on d.driver_sk = fl.driver_sk
)

select * from final

