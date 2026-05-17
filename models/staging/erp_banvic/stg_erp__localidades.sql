with 
    fonte_localidades as (
        select * 
        from {{ source('erp', 'localidades') }}
    )

    , renomeado as (
        select
            cod_localidade as pk_localidade
            , cast(cidade as string) as cidade -- Cast converte de um tipo para o outro
            , cast(uf as string) as uf
        from fonte_localidades
    )

select * 
from renomeado