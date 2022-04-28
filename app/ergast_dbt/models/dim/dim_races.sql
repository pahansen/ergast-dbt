with 

races as (
    select * from {{ source("ergast", "races") }}
),

final as (
    select
        md5("raceId"::varchar) as race_sk,
        "raceId" as race_id,
        "year" as race_year,
        "name" as race_name
    from races
)

select * from final
