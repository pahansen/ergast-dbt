with 

drivers as (
    select * from {{ source("ergast", "drivers") }}
),

final as (
    select
        md5("driverId"::varchar) as driver_sk,
        "driverId"::varchar as driver_id,
        code as driver_3l_code,
        forename as firstname,
        surname as lastname,
        dob::date as date_of_birth,
        "url"::varchar as wiki_url
    from drivers
)

select * from final
