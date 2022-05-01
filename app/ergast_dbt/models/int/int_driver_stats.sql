with

drivers as (
    select * from {{ ref('dim_drivers') }}
),

results as (
    select 
        r.race_sk,
		r.driver_sk,
		r.constructor_sk,
		r.grid_position,
		r.final_position,
		r.fastest_lap_time,
		rs.race_year 
    from {{ ref('fct_results') }} r
    left join {{ ref('dim_races') }} rs
        on r.race_sk = rs.race_sk
),

race_wins as (
    select
        driver_sk,
        coalesce(race_year::varchar, 'overall') as race_year,
        count(r.final_position) as count_race_wins

    from results r
    where r.final_position = 1
    group by grouping sets
        (driver_sk, race_year),
        (driver_sk)
),

fastest_laps as (
    select
        r.driver_sk,
        coalesce(r.race_year::varchar, 'overall') as race_year,
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
    group by grouping sets 
        (driver_sk, race_year),
        (driver_sk)
),

driver_race_years as (
    select
        driver_sk,
        coalesce(race_year::varchar, 'overall') as race_year,
        count(race_sk) as count_races
    from results r
    group by grouping sets
        (driver_sk, race_year),
        (driver_sk)	
),

final as (
    select
        dr.firstname,
        dr.lastname,
        d.race_year,
        d.count_races,
        coalesce(rw.count_race_wins, 0) as count_race_wins,
        coalesce(fl.count_fastest_laps, 0) as count_race_fastest_laps

    from driver_race_years d
    left join drivers dr
        on d.driver_sk = dr.driver_sk
    left join race_wins rw
        on d.driver_sk = rw.driver_sk
        and d.race_year = rw.race_year
    left join fastest_laps fl
         on d.driver_sk = fl.driver_sk
         and d.race_year = fl.race_year
    order by firstname, lastname, race_year asc
)

select * from final

