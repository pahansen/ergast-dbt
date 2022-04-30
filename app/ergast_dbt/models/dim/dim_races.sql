with 

races as (
    select * from {{ source("ergast", "races") }}
),

final as (
    select
        md5("raceId"::varchar) as race_sk,
        "raceId"::varchar as race_id,
        "year"::int as race_year,
        "name"::varchar as race_name
    from races
)

select * from final
