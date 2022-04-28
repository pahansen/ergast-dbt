with

pit_stops as (
    select race_sk, milliseconds from {{ ref("fct_pit_stops") }}
),

races as (
    select race_sk, race_name, race_year from {{ ref("dim_races") }}
),

final as (
    select
        r.race_name,
        r.race_year,
        percentile_cont(0.5) within group(
            order by milliseconds
        )::int / 1000 as median_pit_stop_duration_s,
        min(milliseconds) / 1000 as min_pit_stop_duration_s,
        max(milliseconds) / 1000 as max_pit_stop_duration_s

    from pit_stops p
    left join races r 
        on p.race_sk = r.race_sk

    group by race_name, race_year

    order by race_name, race_year asc
)

select * from final


