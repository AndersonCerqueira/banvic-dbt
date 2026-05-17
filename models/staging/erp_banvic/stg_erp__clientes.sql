with 
    fonte_clientes as (
        select * 
        from {{ source('erp', 'clientes') }}
    )

    , renomeado as (
        select
            cast(cod_cliente as int) as pk_cliente
            , cast(cod_localidade as int) as fk_localidade
            , primeiro_nome || ' ' || ultimo_nome as nome_cliente -- As || signifiam concatenação
            , email as email_cliente
            , tipo_cliente 
            , cast(data_inclusao as timestamp) as ts_inclusao
            , regexp_replace(cpfcnpj, '[^a-zA-z0-9]', '') as cpfcnpj_cliente --regex_replace troca o que não for letra e número por nada
            , cast(data_nascimento as date) as data_nascimento_cliente
            , endereco as endereco_cliente
            , regexp_replace(cep, '[^a-zA-z0-9]', '') as cep_cliente
        from fonte_clientes
    )

select * 
from renomeado