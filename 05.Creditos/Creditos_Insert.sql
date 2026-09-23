-- Script gerado automaticamente por GerarSQLCreditos.py
-- Gerado em: 2026-09-01 09:40:54
-- Total de chamadas: 58 | Ignoradas: 0

-- Linha 2 | PG 158817 | IDLAN 3269372
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    696,
    '2021-07-13',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '158817'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '158817'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 3 | PG 95749 | IDLAN 3405927
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    4670,
    '2021-11-24',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '95749'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '95749'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 4 | PG 169864 | IDLAN 3529200
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    176,
    '2022-03-23',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '169864'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169864'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 5 | PG 92288 | IDLAN 3548927
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    351.3,
    '2022-04-07',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '92288'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '92288'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 6 | PG 176082 | IDLAN 3742824
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    1120,
    '2022-08-12',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '176082'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176082'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 7 | PG 176082 | IDLAN 3742834
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    444.8,
    '2022-08-12',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '176082'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176082'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 8 | PG 169384 | IDLAN 3808837
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    1033.6,
    '2022-10-11',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '169384'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169384'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 9 | PG 119141 | IDLAN 3831472
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    426.4,
    '2022-11-01',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '119141'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '119141'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 10 | PG 162379 | IDLAN 3836820
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    635,
    '2022-11-08',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '162379'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162379'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 11 | PG 265013 | IDLAN 3850563
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    56.63,
    '2022-11-23',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '265013'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265013'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 12 | PG 176821 | IDLAN 3899111
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    607.6,
    '2023-01-12',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '176821'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176821'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 13 | PG 145825 | IDLAN 3919456
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    60,
    '2023-01-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '145825'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145825'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 14 | PG 263259 | IDLAN 3932428
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    734.5,
    '2023-02-02',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '263259'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263259'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 15 | PG 250045 | IDLAN 3970465
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    1652,
    '2023-03-01',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '250045'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250045'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 16 | PG 145852 | IDLAN 3982204
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    989.13,
    '2023-03-08',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '145852'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145852'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 17 | PG 264901 | IDLAN 3991633
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    494.2,
    '2023-03-15',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '264901'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '264901'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 18 | PG 172355 | IDLAN 4004203
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    78.5,
    '2023-03-24',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '172355'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172355'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 19 | PG 176295 | IDLAN 4006384
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    8,
    '2023-03-27',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '176295'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176295'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 20 | PG 280479 | IDLAN 4055669
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    85,
    '2023-05-05',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '280479'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280479'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 21 | PG 178656 | IDLAN 4074241
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    45.32,
    '2023-05-23',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '178656'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178656'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 22 | PG 279455 | IDLAN 4078554
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    125,
    '2023-05-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '279455'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279455'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 23 | PG 156681 | IDLAN 4079099
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    15,
    '2023-05-26',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '156681'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156681'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 24 | PG 105727 | IDLAN 4121060
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    450,
    '2023-06-22',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '105727'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '105727'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 25 | PG 268472 | IDLAN 4130770
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    268.9,
    '2023-06-30',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '268472'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268472'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 26 | PG 263292 | IDLAN 4169250
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    40.02,
    '2023-07-20',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '263292'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263292'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 27 | PG 96642 | IDLAN 4173912
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    124.76,
    '2023-07-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '96642'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96642'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 28 | PG 145825 | IDLAN 4176426
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    5,
    '2023-07-27',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '145825'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145825'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 29 | PG 172640 | IDLAN 4215560
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    1492.6,
    '2023-08-28',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '172640'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172640'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 30 | PG 172640 | IDLAN 4215704
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    382.92,
    '2023-08-28',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '172640'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172640'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 31 | PG 260353 | IDLAN 4221297
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    100,
    '2023-09-01',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '260353'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260353'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 32 | PG 177191 | IDLAN 4231498
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    118,
    '2023-09-13',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '177191'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177191'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 33 | PG 181413 | IDLAN 4231336
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    307.85,
    '2023-09-13',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '181413'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181413'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 34 | PG 183980 | IDLAN 4252371
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    78.2,
    '2023-10-04',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '183980'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183980'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 35 | PG 96236 | IDLAN 4279845
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    462,
    '2023-10-30',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '96236'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96236'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 36 | PG 160991 | IDLAN 4279850
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    32,
    '2023-10-30',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '160991'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160991'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 37 | PG 274100 | IDLAN 4335636
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    562.8,
    '2023-12-15',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '274100'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274100'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 38 | PG 110514 | IDLAN 4533976
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    7,
    '2024-04-16',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '110514'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '110514'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 39 | PG 276740 | IDLAN 4621398
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    14.3,
    '2024-06-14',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '276740'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276740'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 40 | PG 305079 | IDLAN 4751905
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    239.4,
    '2024-09-09',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '305079'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305079'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 41 | PG 285879 | IDLAN 4839042
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    7,
    '2024-11-07',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '285879'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285879'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 42 | PG 303863 | IDLAN 5028683
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    146.3,
    '2025-02-27',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '303863'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303863'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 43 | PG 332540 | IDLAN 5355358
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    102,
    '2025-10-09',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '332540'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332540'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 44 | PG 260058 | IDLAN 5362396
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    8,
    '2025-10-14',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '260058'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260058'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 45 | PG 317013 | IDLAN 5392793
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    56.8,
    '2025-11-04',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '317013'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317013'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 46 | PG 329886 | IDLAN 5392328
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    394,
    '2025-11-04',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '329886'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '329886'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 47 | PG 327470 | IDLAN 5435503
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    243,
    '2025-12-03',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '327470'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '327470'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 48 | PG 162379 | IDLAN 5438975
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    476,
    '2025-12-04',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '162379'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162379'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 49 | PG 331631 | IDLAN 5453471
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    139,
    '2025-12-13',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '331631'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331631'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 50 | PG 265277 | IDLAN 5542000
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    318,
    '2026-02-02',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '265277'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265277'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 51 | PG 305070 | IDLAN 5541062
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    30,
    '2026-02-02',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '305070'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305070'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 52 | PG 137543 | IDLAN 5708069
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    10,
    '2026-04-24',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '137543'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137543'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 53 | PG 252449 | IDLAN 5729142
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    10,
    '2026-05-11',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '252449'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252449'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 54 | PG 341836 | IDLAN 5805225
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    53.4,
    '2026-06-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '341836'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '341836'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 55 | PG 333519 | IDLAN 5867074
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    210.9,
    '2026-07-30',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '333519'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '333519'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 56 | PG 290161 | IDLAN 5949019
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    100,
    '2026-08-20',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '290161'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290161'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 57 | PG 330690 | IDLAN 5968501
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    198,
    '2026-08-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '330690'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '330690'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 58 | PG 350439 | IDLAN 5968394
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    2144.76,
    '2026-08-25',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '350439'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '350439'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 59 | PG 340542 | IDLAN 5970907
call sp_criar_credito_paciente_faturamento_completo(
    14567,
    500,
    '2026-08-26',
    (
        SELECT p.codpessoa
        FROM PACIENTE p
        WHERE p.numerocontrole = '340542'
          AND p.tenant_id = 14567
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340542'
              AND p.tenant_id = 14567
            LIMIT 1
        )
        LIMIT 1
    ),
    25614,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);
