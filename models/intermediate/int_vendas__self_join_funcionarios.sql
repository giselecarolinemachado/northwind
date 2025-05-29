with 
    /* Chamada dos modelos necessários. */
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , self_joined as (
        select 
            funcionarios.pk_funcionario
            , funcionarios.nome_funcionario
            , funcionarios.cargo_funcionario
            , gerentes.nome_funcionario as nome_gerente
            , funcionarios.dtnascimento_funcionario
            , funcionarios.dt_contratacao
            , funcionarios.cidade_funcionario
            , funcionarios.regiao_funcionario
            , funcionarios.pais_funcionario
        from funcionarios
        left join funcionarios as gerentes 
            on funcionarios.fk_gerente = gerentes.pk_funcionario
    )

    select *
    from self_joined