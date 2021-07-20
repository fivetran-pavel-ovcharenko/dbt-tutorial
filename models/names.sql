{{ config(materialized='table') }}

with names as (

    select * from {{ ref('stg_names') }}

),

roles as (

    select * from {{ ref('stg_roles') }}

),

final as (

    select
        names.id,
        names.name,

    from names

    left join roles using (id)

)

select * from final
