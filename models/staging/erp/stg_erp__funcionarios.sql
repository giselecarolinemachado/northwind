with fonte_funcionarios as (
    select *
    from {{ source('erp', 'employees') }}
    )

    , renomeado as (
    select 
        cast (ID as int) as pk_funcionario
        , cast (reportsto as int) as fk_gerente
        , firstname || ' ' || lastname as nome_funcionario
        , cast (title as varchar) as cargo_funcionario
        , cast (birthdate as date) as dtnascimento_funcionario
        , cast (hiredate as date) as dt_contratacao
        , cast (city as varchar) as cidade_funcionario
        , cast (region as varchar) as regiao_funcionario
        , cast (country as varchar) as pais_funcionario 
        --, cast (titleofcourtesy as varchar)
        --, cast (address as varchar)
        --, cast (postalcode as varchar)
        --, cast (homephone as varchar)
        --, cast (extension as varchar)
        --, cast (photo as varchar)
        --, cast (notes as varchar)
        --, cast (photopath as varchar)
    from fonte_funcionarios
)

select *
from renomeado