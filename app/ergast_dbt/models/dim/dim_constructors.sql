with 

constructors as (
    select * from {{ source("ergast", "constructors") }}
),

final as (
    select
        md5("constructorId"::varchar) as constructor_sk,
        "constructorId"::varchar as constructor_id,
        name::varchar,
        nationality::varchar,
        "url"::varchar as wiki_url
    from constructors
)

select * from final
