-- Script gerado automaticamente por GerarSQLCreditos.py
-- Gerado em: 2026-11-07 11:40:15
-- Entrada: Creditos_Campinas_DVV_V1.xlsx | Tenant: 14572
-- Total de chamadas: 1310 | Ignoradas: 0

-- Linha 2 | PG 286509 | IDLAN 4508175
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    215.3,
    '2024-03-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286509'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286509'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 3 | PG 286509 | IDLAN 4595499
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    697.4,
    '2024-05-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286509'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286509'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 4 | PG 184743 | IDLAN 3629658
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2022-06-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184743'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184743'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 5 | PG 318769 | IDLAN 5383780
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    117,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318769'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318769'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 6 | PG 294083 | IDLAN 5069151
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    47.5,
    '2025-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294083'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294083'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 7 | PG 24395 | IDLAN 4797804
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74,
    '2024-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '24395'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '24395'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 8 | PG 100217 | IDLAN 5836772
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.7,
    '2026-07-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '100217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '100217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 9 | PG 128038 | IDLAN 3741461
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    232.8,
    '2022-08-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '128038'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '128038'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 10 | PG 151170 | IDLAN 4317616
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2640,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '151170'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '151170'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 11 | PG 136492 | IDLAN 3800131
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    36.48,
    '2022-10-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '136492'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '136492'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 12 | PG 141840 | IDLAN 4319702
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    589,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '141840'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '141840'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 13 | PG 140097 | IDLAN 3561801
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    175.1,
    '2022-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '140097'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '140097'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 14 | PG 68721 | IDLAN 4505639
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    278.4,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '68721'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '68721'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 15 | PG 21028 | IDLAN 3487694
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12.8,
    '2022-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '21028'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '21028'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 16 | PG 21028 | IDLAN 3487723
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    216,
    '2022-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '21028'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '21028'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 17 | PG 21028 | IDLAN 3487740
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    32,
    '2022-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '21028'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '21028'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 18 | PG 52407 | IDLAN 3975299
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    560,
    '2023-03-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '52407'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '52407'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 19 | PG 137573 | IDLAN 3630915
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    560,
    '2022-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137573'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137573'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 20 | PG 137573 | IDLAN 3775738
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    409.6,
    '2022-09-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137573'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137573'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 21 | PG 152577 | IDLAN 4689340
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16,
    '2024-07-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '152577'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '152577'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 22 | PG 18614 | IDLAN 4047437
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    500,
    '2023-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '18614'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '18614'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 23 | PG 18614 | IDLAN 4047475
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    500,
    '2023-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '18614'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '18614'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 24 | PG 152628 | IDLAN 4795071
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-10-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '152628'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '152628'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 25 | PG 136337 | IDLAN 3956023
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.6,
    '2023-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '136337'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '136337'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 26 | PG 30384 | IDLAN 4331207
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    285.6,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '30384'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '30384'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 27 | PG 152823 | IDLAN 3457138
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    230.4,
    '2022-01-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '152823'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '152823'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 28 | PG 110933 | IDLAN 3438347
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    188.8,
    '2022-01-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '110933'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '110933'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 29 | PG 138281 | IDLAN 4571955
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    58.5,
    '2024-05-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '138281'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '138281'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 30 | PG 114373 | IDLAN 3563890
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.64,
    '2022-04-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '114373'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '114373'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 31 | PG 31401 | IDLAN 3843432
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422,
    '2022-11-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '31401'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '31401'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 32 | PG 41838 | IDLAN 3826969
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    9,
    '2022-10-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '41838'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '41838'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 33 | PG 111621 | IDLAN 5169994
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    159,
    '2025-06-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '111621'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '111621'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 34 | PG 111621 | IDLAN 5737401
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    806.2,
    '2026-05-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '111621'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '111621'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 35 | PG 85263 | IDLAN 3556166
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    154.4,
    '2022-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '85263'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '85263'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 36 | PG 150114 | IDLAN 4198314
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    460.2,
    '2023-08-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '150114'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '150114'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 37 | PG 87307 | IDLAN 3558042
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80.8,
    '2022-04-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '87307'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '87307'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 38 | PG 48316 | IDLAN 4695007
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3.1,
    '2024-07-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '48316'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '48316'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 39 | PG 153509 | IDLAN 3994934
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    448,
    '2023-03-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '153509'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '153509'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 40 | PG 87441 | IDLAN 3604953
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    52,
    '2022-05-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '87441'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '87441'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 41 | PG 37313 | IDLAN 4501358
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    59,
    '2024-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37313'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37313'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 42 | PG 114023 | IDLAN 3850956
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74.8,
    '2022-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '114023'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '114023'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 43 | PG 52460 | IDLAN 3460394
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    178.2,
    '2022-01-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '52460'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '52460'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 44 | PG 52460 | IDLAN 4300964
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '52460'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '52460'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 45 | PG 69313 | IDLAN 4609034
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    266,
    '2024-06-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '69313'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '69313'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 46 | PG 69313 | IDLAN 4609165
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    615.6,
    '2024-06-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '69313'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '69313'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 47 | PG 37624 | IDLAN 3552784
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    190.4,
    '2022-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37624'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37624'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 48 | PG 37624 | IDLAN 3563465
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2022-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37624'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37624'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 49 | PG 37624 | IDLAN 4307390
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1886,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37624'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37624'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 50 | PG 43531 | IDLAN 4320063
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2160,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '43531'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '43531'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 51 | PG 76223 | IDLAN 4549143
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    9.2,
    '2024-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '76223'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '76223'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 52 | PG 78591 | IDLAN 4789851
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    68.4,
    '2024-10-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '78591'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '78591'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 53 | PG 71417 | IDLAN 4332928
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    175.1,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71417'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71417'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 54 | PG 71417 | IDLAN 4332907
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    6241.5,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71417'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71417'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 55 | PG 71417 | IDLAN 4332893
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71417'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71417'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 56 | PG 71417 | IDLAN 4312315
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71417'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71417'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 57 | PG 138521 | IDLAN 4307604
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5.33,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '138521'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '138521'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 58 | PG 19802 | IDLAN 4524833
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    767.2,
    '2024-04-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '19802'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '19802'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 59 | PG 153868 | IDLAN 4407997
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    72,
    '2022-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '153868'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '153868'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 60 | PG 153898 | IDLAN 4434731
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    69.8,
    '2024-02-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '153898'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '153898'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 61 | PG 1956 | IDLAN 4288604
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2,
    '2023-11-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '1956'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '1956'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 62 | PG 79407 | IDLAN 5999373
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1278,
    '2026-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79407'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79407'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 63 | PG 154239 | IDLAN 4705154
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    201,
    '2024-08-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '154239'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '154239'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 64 | PG 108699 | IDLAN 4326892
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.3,
    '2023-12-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '108699'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '108699'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 65 | PG 111694 | IDLAN 3870958
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    181,
    '2022-12-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '111694'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '111694'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 66 | PG 142528 | IDLAN 3564702
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13.1,
    '2022-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '142528'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '142528'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 67 | PG 80256 | IDLAN 5991242
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    10,
    '2026-09-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '80256'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '80256'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 68 | PG 26664 | IDLAN 4297942
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    46,
    '2023-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '26664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '26664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 69 | PG 154549 | IDLAN 3589508
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    101,
    '2022-05-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '154549'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '154549'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 70 | PG 127986 | IDLAN 3552876
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    122.88,
    '2022-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127986'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127986'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 71 | PG 139007 | IDLAN 3939624
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    48,
    '2023-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139007'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139007'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 72 | PG 11171 | IDLAN 3851474
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4842.6,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '11171'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '11171'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 73 | PG 317073 | IDLAN 5336094
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    94,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317073'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317073'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 74 | PG 62067 | IDLAN 4466518
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1069,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '62067'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '62067'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 75 | PG 62067 | IDLAN 4466528
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    165,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '62067'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '62067'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 76 | PG 139143 | IDLAN 4464774
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    273.6,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139143'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139143'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 77 | PG 139047 | IDLAN 4318969
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    756,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139047'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139047'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 78 | PG 139047 | IDLAN 4318972
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    147.2,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139047'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139047'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 79 | PG 71458 | IDLAN 4828794
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    15.73,
    '2024-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71458'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71458'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 80 | PG 83141 | IDLAN 3917493
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    48.2,
    '2023-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '83141'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '83141'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 81 | PG 139732 | IDLAN 3589593
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    129,
    '2022-05-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139732'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139732'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 82 | PG 106682 | IDLAN 3635393
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    276,
    '2022-07-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '106682'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '106682'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 83 | PG 86511 | IDLAN 4316507
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108.5,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '86511'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '86511'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 84 | PG 154802 | IDLAN 3453452
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    70,
    '2022-01-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '154802'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '154802'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 85 | PG 103580 | IDLAN 5336192
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    79.7,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '103580'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '103580'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 86 | PG 153977 | IDLAN 3522842
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    67.2,
    '2022-03-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '153977'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '153977'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 87 | PG 153977 | IDLAN 3572770
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    770,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '153977'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '153977'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 88 | PG 155459 | IDLAN 4466531
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '155459'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '155459'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 89 | PG 155459 | IDLAN 4466548
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.4,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '155459'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '155459'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 90 | PG 63712 | IDLAN 5405851
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2025-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63712'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63712'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 91 | PG 78622 | IDLAN 4464786
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    73,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '78622'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '78622'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 92 | PG 114188 | IDLAN 3917546
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.2,
    '2023-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '114188'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '114188'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 93 | PG 66020 | IDLAN 3538925
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    719.02,
    '2022-03-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '66020'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '66020'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 94 | PG 156085 | IDLAN 3578244
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31.6,
    '2022-05-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156085'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156085'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 95 | PG 156085 | IDLAN 3909835
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3,
    '2023-01-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156085'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156085'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 96 | PG 137229 | IDLAN 3851436
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1497.6,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137229'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137229'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 97 | PG 156306 | IDLAN 4319289
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 98 | PG 156306 | IDLAN 4319282
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1376,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 99 | PG 156306 | IDLAN 4319277
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95.2,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 100 | PG 156306 | IDLAN 4319276
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1838,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 101 | PG 156306 | IDLAN 4330780
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    142.8,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 102 | PG 156306 | IDLAN 4705404
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1148,
    '2024-08-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 103 | PG 156306 | IDLAN 4705409
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    225,
    '2024-08-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 104 | PG 156366 | IDLAN 4413824
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    173.65,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156366'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156366'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 105 | PG 156366 | IDLAN 5090120
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.23,
    '2025-04-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156366'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156366'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 106 | PG 80064 | IDLAN 4525379
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.01,
    '2024-04-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '80064'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '80064'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 107 | PG 137901 | IDLAN 4310307
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74.8,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137901'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137901'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 108 | PG 142532 | IDLAN 4467380
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1665,
    '2024-03-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '142532'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '142532'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 109 | PG 142532 | IDLAN 4467385
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    165,
    '2024-03-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '142532'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '142532'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 110 | PG 156521 | IDLAN 3630905
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2022-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '156521'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '156521'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 111 | PG 115205 | IDLAN 4011765
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    159,
    '2023-04-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '115205'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '115205'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 112 | PG 157317 | IDLAN 4276952
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2,
    '2023-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '157317'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '157317'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 113 | PG 25401 | IDLAN 4232820
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-09-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '25401'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '25401'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 114 | PG 110215 | IDLAN 4309208
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '110215'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '110215'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 115 | PG 113552 | IDLAN 4480985
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    178,
    '2024-03-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '113552'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '113552'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 116 | PG 44731 | IDLAN 3935393
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31.6,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '44731'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '44731'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 117 | PG 50664 | IDLAN 3601862
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.05,
    '2022-05-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '50664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '50664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 118 | PG 67431 | IDLAN 5888383
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    21.41,
    '2026-08-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '67431'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '67431'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 119 | PG 67569 | IDLAN 4857490
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    73,
    '2024-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '67569'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '67569'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 120 | PG 141674 | IDLAN 4461814
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1535.2,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '141674'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '141674'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 121 | PG 45894 | IDLAN 4312487
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    117.2,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '45894'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '45894'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 122 | PG 100341 | IDLAN 4319590
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    257.5,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '100341'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '100341'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 123 | PG 148018 | IDLAN 3568385
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45.52,
    '2022-04-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '148018'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '148018'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 124 | PG 148018 | IDLAN 3568387
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    99.52,
    '2022-04-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '148018'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '148018'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 125 | PG 68233 | IDLAN 4540637
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    980.7,
    '2024-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '68233'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '68233'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 126 | PG 68233 | IDLAN 4540645
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1567.8,
    '2024-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '68233'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '68233'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 127 | PG 78077 | IDLAN 3442373
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    217.6,
    '2022-01-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '78077'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '78077'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 128 | PG 115258 | IDLAN 5611975
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    58.37,
    '2026-02-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '115258'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '115258'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 129 | PG 157755 | IDLAN 4310455
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    40.8,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '157755'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '157755'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 130 | PG 92849 | IDLAN 3450851
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    376.5,
    '2022-01-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '92849'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '92849'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 131 | PG 126987 | IDLAN 5788195
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    508,
    '2026-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '126987'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '126987'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 132 | PG 46689 | IDLAN 4323730
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    448,
    '2023-12-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '46689'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '46689'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 133 | PG 28488 | IDLAN 3582004
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108,
    '2022-05-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '28488'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '28488'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 134 | PG 158448 | IDLAN 3611663
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2273.9,
    '2022-06-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '158448'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '158448'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 135 | PG 137528 | IDLAN 3917459
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.7,
    '2023-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137528'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137528'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 136 | PG 137528 | IDLAN 4413656
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    177.6,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137528'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137528'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 137 | PG 76856 | IDLAN 4319923
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    873,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '76856'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '76856'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 138 | PG 128982 | IDLAN 4145826
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    91.2,
    '2023-07-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '128982'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '128982'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 139 | PG 127249 | IDLAN 3555959
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127249'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127249'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 140 | PG 148570 | IDLAN 5383826
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1456,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '148570'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '148570'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 141 | PG 149168 | IDLAN 5524719
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    536,
    '2026-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '149168'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '149168'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 142 | PG 159080 | IDLAN 3569718
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2022-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '159080'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '159080'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 143 | PG 159103 | IDLAN 3928182
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11.3,
    '2023-02-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '159103'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '159103'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 144 | PG 159777 | IDLAN 4413760
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '159777'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '159777'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 145 | PG 160019 | IDLAN 4307551
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.72,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160019'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160019'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 146 | PG 38924 | IDLAN 4610451
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2024-06-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '38924'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '38924'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 147 | PG 160071 | IDLAN 6045944
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2026-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160071'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160071'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 148 | PG 51742 | IDLAN 5163584
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11,
    '2025-05-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '51742'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '51742'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 149 | PG 50820 | IDLAN 5487730
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-01-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '50820'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '50820'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 150 | PG 30157 | IDLAN 3602855
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19,
    '2022-05-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '30157'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '30157'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 151 | PG 111412 | IDLAN 3851037
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    345.6,
    '2022-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '111412'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '111412'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 152 | PG 160109 | IDLAN 4413585
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    228.8,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160109'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160109'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 153 | PG 160109 | IDLAN 4413643
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160109'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160109'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 154 | PG 126809 | IDLAN 3765370
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    302,
    '2022-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '126809'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '126809'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 155 | PG 126809 | IDLAN 3765373
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    630,
    '2022-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '126809'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '126809'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 156 | PG 160319 | IDLAN 3408165
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.7,
    '2021-11-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160319'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160319'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 157 | PG 160581 | IDLAN 4313047
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    149,
    '2023-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160581'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160581'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 158 | PG 160666 | IDLAN 3934814
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    27.2,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160666'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160666'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 159 | PG 160828 | IDLAN 3532725
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.2,
    '2022-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160828'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160828'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 160 | PG 160828 | IDLAN 3532726
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    131.2,
    '2022-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160828'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160828'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 161 | PG 160828 | IDLAN 3631230
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473,
    '2022-06-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '160828'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160828'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 162 | PG 57687 | IDLAN 4467406
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    902.4,
    '2024-03-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '57687'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '57687'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 163 | PG 161060 | IDLAN 3458691
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    491.2,
    '2022-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '161060'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '161060'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 164 | PG 89768 | IDLAN 4312276
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    144,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '89768'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '89768'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 165 | PG 140096 | IDLAN 3558762
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    222.8,
    '2022-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '140096'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '140096'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 166 | PG 140096 | IDLAN 3663452
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    566.4,
    '2022-07-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '140096'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '140096'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 167 | PG 45662 | IDLAN 4312081
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    190.4,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '45662'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '45662'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 168 | PG 72373 | IDLAN 4317435
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '72373'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '72373'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 169 | PG 72373 | IDLAN 4543669
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    142,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '72373'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '72373'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 170 | PG 161549 | IDLAN 4458976
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    179.7,
    '2024-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '161549'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '161549'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 171 | PG 17551 | IDLAN 5807554
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16.5,
    '2026-06-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '17551'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '17551'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 172 | PG 17551 | IDLAN 5980487
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    91.09,
    '2026-08-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '17551'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '17551'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 173 | PG 137850 | IDLAN 5049037
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19,
    '2025-03-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137850'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137850'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 174 | PG 28414 | IDLAN 4127097
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    460.2,
    '2023-06-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '28414'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '28414'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 175 | PG 50205 | IDLAN 4464918
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '50205'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '50205'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 176 | PG 161807 | IDLAN 3488324
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98.01,
    '2022-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '161807'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '161807'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 177 | PG 161815 | IDLAN 3458772
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    312.3,
    '2022-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '161815'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '161815'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 178 | PG 162103 | IDLAN 4105467
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    667,
    '2023-06-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '162103'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162103'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 179 | PG 162103 | IDLAN 4105563
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1960,
    '2023-06-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '162103'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162103'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 180 | PG 57328 | IDLAN 4789807
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    81.6,
    '2024-10-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '57328'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '57328'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 181 | PG 61208 | IDLAN 3398435
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    81.6,
    '2021-11-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '61208'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '61208'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 182 | PG 61208 | IDLAN 4319648
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '61208'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '61208'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 183 | PG 83148 | IDLAN 5561166
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '83148'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '83148'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 184 | PG 162439 | IDLAN 4286822
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2023-11-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '162439'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162439'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 185 | PG 162439 | IDLAN 4402454
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1368,
    '2024-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '162439'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162439'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 186 | PG 121578 | IDLAN 3993882
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8,
    '2023-03-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '121578'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '121578'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 187 | PG 162665 | IDLAN 5695426
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    394,
    '2026-04-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '162665'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162665'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 188 | PG 80375 | IDLAN 5619357
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12.4,
    '2026-03-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '80375'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '80375'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 189 | PG 125653 | IDLAN 3407966
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22.5,
    '2021-11-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '125653'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '125653'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 190 | PG 163223 | IDLAN 4307047
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    291.2,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163223'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163223'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 191 | PG 163294 | IDLAN 4127747
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30.56,
    '2023-06-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163294'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163294'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 192 | PG 37990 | IDLAN 3799654
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.27,
    '2022-10-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37990'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37990'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 193 | PG 137496 | IDLAN 3854829
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    419.2,
    '2022-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137496'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137496'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 194 | PG 137496 | IDLAN 3854833
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473,
    '2022-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '137496'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '137496'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 195 | PG 163516 | IDLAN 5977280
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    87,
    '2026-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163516'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163516'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 196 | PG 163516 | IDLAN 5977294
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163516'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163516'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 197 | PG 163702 | IDLAN 5204952
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    152.6,
    '2025-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163702'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163702'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 198 | PG 141548 | IDLAN 4608853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.2,
    '2024-06-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '141548'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '141548'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 199 | PG 88043 | IDLAN 4857278
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2024-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '88043'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '88043'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 200 | PG 163871 | IDLAN 4530497
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    209.6,
    '2024-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163871'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163871'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 201 | PG 163951 | IDLAN 4184629
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.56,
    '2023-08-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '163951'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163951'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 202 | PG 164225 | IDLAN 4747324
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    498.75,
    '2024-09-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164225'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164225'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 203 | PG 164252 | IDLAN 3603512
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1349.6,
    '2022-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164252'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164252'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 204 | PG 164268 | IDLAN 4275375
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74,
    '2023-10-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164268'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164268'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 205 | PG 164276 | IDLAN 3851064
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3668.8,
    '2022-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164276'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164276'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 206 | PG 164276 | IDLAN 3851773
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    160,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164276'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164276'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 207 | PG 164276 | IDLAN 3851727
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    699.2,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164276'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164276'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 208 | PG 122828 | IDLAN 4302185
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    507,
    '2023-11-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '122828'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '122828'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 209 | PG 164307 | IDLAN 5739259
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    79,
    '2026-05-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164307'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164307'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 210 | PG 164382 | IDLAN 3558655
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    598.5,
    '2022-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 211 | PG 164382 | IDLAN 4303507
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    350,
    '2023-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 212 | PG 164382 | IDLAN 4316599
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    279,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 213 | PG 164490 | IDLAN 5720884
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-05-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164490'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164490'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 214 | PG 164544 | IDLAN 3754377
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    15.76,
    '2022-08-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164544'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164544'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 215 | PG 164544 | IDLAN 3760597
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    61.46,
    '2022-08-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164544'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164544'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 216 | PG 31177 | IDLAN 4324834
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    57.87,
    '2023-12-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '31177'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '31177'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 217 | PG 9448 | IDLAN 4761920
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    729,
    '2024-09-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9448'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9448'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 218 | PG 164811 | IDLAN 3563657
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.8,
    '2022-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '164811'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '164811'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 219 | PG 97389 | IDLAN 3627954
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    340,
    '2022-06-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97389'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97389'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 220 | PG 97389 | IDLAN 3654077
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1427.2,
    '2022-07-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97389'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97389'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 221 | PG 97389 | IDLAN 3654080
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1620,
    '2022-07-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97389'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97389'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 222 | PG 97389 | IDLAN 4543692
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    144,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97389'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97389'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 223 | PG 165087 | IDLAN 4633608
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473.6,
    '2024-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165087'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165087'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 224 | PG 165175 | IDLAN 3556569
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2022-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165175'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165175'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 225 | PG 165175 | IDLAN 4306874
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    545,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165175'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165175'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 226 | PG 165398 | IDLAN 4543790
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165398'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165398'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 227 | PG 165457 | IDLAN 3606882
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2022-06-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165457'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165457'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 228 | PG 165654 | IDLAN 3405375
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    49.3,
    '2021-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165654'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165654'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 229 | PG 165657 | IDLAN 3493001
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    42.1,
    '2022-02-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165657'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165657'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 230 | PG 165879 | IDLAN 3821248
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    65.52,
    '2022-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165879'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165879'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 231 | PG 165951 | IDLAN 3575502
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    378,
    '2022-05-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '165951'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '165951'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 232 | PG 166002 | IDLAN 3506217
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    229.52,
    '2022-03-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166002'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166002'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 233 | PG 166001 | IDLAN 3922206
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.6,
    '2023-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166001'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166001'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 234 | PG 93297 | IDLAN 4867818
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    174.84,
    '2024-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '93297'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '93297'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 235 | PG 166325 | IDLAN 3642745
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2022-07-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166325'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166325'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 236 | PG 166325 | IDLAN 3642747
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    425.6,
    '2022-07-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166325'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166325'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 237 | PG 166333 | IDLAN 4301807
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166333'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166333'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 238 | PG 166477 | IDLAN 3851731
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    264,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166477'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166477'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 239 | PG 166477 | IDLAN 3874163
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168,
    '2022-12-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166477'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166477'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 240 | PG 166668 | IDLAN 3858470
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    407,
    '2022-12-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166668'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166668'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 241 | PG 166669 | IDLAN 4505692
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    367.2,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166669'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166669'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 242 | PG 166711 | IDLAN 5377713
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    212.5,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166711'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166711'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 243 | PG 166846 | IDLAN 3803907
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.4,
    '2022-10-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '166846'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166846'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 244 | PG 128622 | IDLAN 3556753
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    231.2,
    '2022-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '128622'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '128622'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 245 | PG 167239 | IDLAN 3575318
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.59,
    '2022-05-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '167239'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '167239'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 246 | PG 31905 | IDLAN 5717140
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.5,
    '2026-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '31905'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '31905'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 247 | PG 129861 | IDLAN 5344635
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    695,
    '2025-10-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '129861'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '129861'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 248 | PG 91337 | IDLAN 3936069
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    278.8,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '91337'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '91337'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 249 | PG 167479 | IDLAN 4743316
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    576.83,
    '2024-09-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '167479'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '167479'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 250 | PG 69876 | IDLAN 4826180
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    146,
    '2024-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '69876'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '69876'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 251 | PG 129087 | IDLAN 4931556
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.3,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '129087'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '129087'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 252 | PG 129087 | IDLAN 5768067
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    147,
    '2026-06-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '129087'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '129087'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 253 | PG 167802 | IDLAN 5733934
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    266.98,
    '2026-05-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '167802'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '167802'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 254 | PG 9462 | IDLAN 3854809
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    354,
    '2022-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9462'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9462'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 255 | PG 9462 | IDLAN 3854812
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    448,
    '2022-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9462'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9462'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 256 | PG 184279 | IDLAN 4320443
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    775,
    '2023-12-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184279'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184279'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 257 | PG 168171 | IDLAN 4824929
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    428.3,
    '2024-10-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '168171'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '168171'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 258 | PG 168573 | IDLAN 5481147
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '168573'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '168573'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 259 | PG 47102 | IDLAN 5279319
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    15.5,
    '2025-08-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47102'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47102'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 260 | PG 168804 | IDLAN 5563088
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    133,
    '2026-02-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '168804'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '168804'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 261 | PG 45774 | IDLAN 4312526
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    190,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '45774'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '45774'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 262 | PG 168863 | IDLAN 5377620
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    162,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '168863'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '168863'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 263 | PG 87179 | IDLAN 4115809
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    147.44,
    '2023-06-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '87179'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '87179'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 264 | PG 87179 | IDLAN 4115946
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1335.7,
    '2023-06-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '87179'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '87179'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 265 | PG 169134 | IDLAN 4315988
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74.48,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '169134'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169134'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 266 | PG 79738 | IDLAN 5027207
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1183,
    '2025-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79738'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79738'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 267 | PG 79738 | IDLAN 5075662
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    18,
    '2025-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79738'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79738'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 268 | PG 79738 | IDLAN 5125859
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    333,
    '2025-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79738'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79738'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 269 | PG 169645 | IDLAN 3527666
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    84,
    '2022-03-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '169645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 270 | PG 40835 | IDLAN 4011459
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    434.2,
    '2023-04-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '40835'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '40835'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 271 | PG 170021 | IDLAN 4307095
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    236.29,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '170021'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170021'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 272 | PG 170021 | IDLAN 4318651
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    276.3,
    '2023-12-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '170021'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170021'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 273 | PG 10745 | IDLAN 4931627
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80.2,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '10745'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '10745'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 274 | PG 10745 | IDLAN 4931628
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    7.5,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '10745'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '10745'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 275 | PG 60796 | IDLAN 4319236
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.4,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '60796'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '60796'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 276 | PG 170629 | IDLAN 4231585
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    51,
    '2023-09-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '170629'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170629'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 277 | PG 39376 | IDLAN 5397253
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    73,
    '2025-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '39376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '39376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 278 | PG 170814 | IDLAN 4626528
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    275.5,
    '2024-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '170814'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170814'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 279 | PG 170802 | IDLAN 3633838
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    245,
    '2022-06-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '170802'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170802'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 280 | PG 171549 | IDLAN 3562618
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.5,
    '2022-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '171549'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '171549'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 281 | PG 171742 | IDLAN 3852819
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13.69,
    '2022-11-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '171742'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '171742'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 282 | PG 46999 | IDLAN 3603308
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '46999'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '46999'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 283 | PG 46999 | IDLAN 4504834
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    135,
    '2024-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '46999'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '46999'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 284 | PG 172297 | IDLAN 5149496
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    600,
    '2025-05-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172297'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172297'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 285 | PG 172370 | IDLAN 4312582
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    380,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172370'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172370'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 286 | PG 172391 | IDLAN 3399522
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    47.6,
    '2021-11-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172391'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172391'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 287 | PG 172558 | IDLAN 4784310
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2024-10-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172558'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172558'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 288 | PG 172699 | IDLAN 4301124
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2870,
    '2023-11-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172699'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172699'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 289 | PG 56354 | IDLAN 4246276
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    416.5,
    '2023-09-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '56354'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '56354'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 290 | PG 56354 | IDLAN 4246279
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    703.08,
    '2023-09-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '56354'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '56354'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 291 | PG 56354 | IDLAN 4050189
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    217,
    '2023-05-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '56354'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '56354'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 292 | PG 172914 | IDLAN 3600552
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    228,
    '2022-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172914'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172914'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 293 | PG 172942 | IDLAN 3922229
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    75.14,
    '2023-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '172942'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '172942'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 294 | PG 264726 | IDLAN 3631008
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19,
    '2022-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '264726'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '264726'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 295 | PG 265582 | IDLAN 3613557
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19,
    '2022-06-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265582'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265582'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 296 | PG 36135 | IDLAN 3921189
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    390.3,
    '2023-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36135'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36135'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 297 | PG 36135 | IDLAN 3957739
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2023-02-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36135'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36135'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 298 | PG 36135 | IDLAN 3957752
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    83.18,
    '2023-02-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36135'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36135'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 299 | PG 173724 | IDLAN 4048890
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    256.03,
    '2023-04-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '173724'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '173724'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 300 | PG 173731 | IDLAN 5481251
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    478.8,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '173731'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '173731'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 301 | PG 139810 | IDLAN 3991902
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    52.64,
    '2023-03-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139810'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139810'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 302 | PG 139810 | IDLAN 4332818
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1662.71,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '139810'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139810'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 303 | PG 174842 | IDLAN 3497688
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    85,
    '2022-02-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '174842'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174842'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 304 | PG 174167 | IDLAN 4267959
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    27.42,
    '2023-10-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '174167'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174167'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 305 | PG 174409 | IDLAN 3847181
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1776,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '174409'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174409'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 306 | PG 95974 | IDLAN 4939394
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    574,
    '2025-01-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '95974'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '95974'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 307 | PG 174784 | IDLAN 4306865
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    976.29,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '174784'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174784'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 308 | PG 174921 | IDLAN 5599445
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    148,
    '2026-02-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '174921'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174921'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 309 | PG 175173 | IDLAN 3666818
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19.9,
    '2022-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '175173'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175173'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 310 | PG 175173 | IDLAN 4649263
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    246.4,
    '2024-07-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '175173'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175173'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 311 | PG 176010 | IDLAN 3556751
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45,
    '2022-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176010'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176010'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 312 | PG 176215 | IDLAN 3967728
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1,
    '2023-02-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176215'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176215'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 313 | PG 176376 | IDLAN 3645016
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    758.48,
    '2022-07-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 314 | PG 176376 | IDLAN 3661868
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    37.85,
    '2022-07-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 315 | PG 176611 | IDLAN 4505853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98.8,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176611'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176611'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 316 | PG 141493 | IDLAN 4466746
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    465,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '141493'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '141493'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 317 | PG 176924 | IDLAN 5712772
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2190,
    '2026-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176924'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176924'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 318 | PG 176924 | IDLAN 5712777
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1234.8,
    '2026-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176924'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176924'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 319 | PG 176965 | IDLAN 3847270
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1049.6,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176965'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176965'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 320 | PG 176967 | IDLAN 4307310
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    85,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176967'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176967'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 321 | PG 5043 | IDLAN 3483665
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2499.96,
    '2022-01-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '5043'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '5043'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 322 | PG 177044 | IDLAN 4455986
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    65,
    '2024-02-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177044'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177044'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 323 | PG 127984 | IDLAN 4323865
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    131.8,
    '2023-12-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127984'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127984'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 324 | PG 127984 | IDLAN 4705910
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1453.75,
    '2024-08-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127984'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127984'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 325 | PG 177167 | IDLAN 4877689
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    285,
    '2024-12-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177167'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177167'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 326 | PG 47436 | IDLAN 4077068
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    675,
    '2023-05-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47436'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47436'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 327 | PG 177306 | IDLAN 3557973
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    283.31,
    '2022-04-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177306'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177306'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 328 | PG 177312 | IDLAN 4291377
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    134.3,
    '2023-11-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177312'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177312'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 329 | PG 51674 | IDLAN 4233460
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    876,
    '2023-09-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '51674'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '51674'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 330 | PG 51674 | IDLAN 4233461
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2410,
    '2023-09-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '51674'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '51674'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 331 | PG 177440 | IDLAN 4295322
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177440'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177440'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 332 | PG 177526 | IDLAN 3572731
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4.57,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177526'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177526'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 333 | PG 177541 | IDLAN 5594383
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    52.2,
    '2026-02-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177541'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177541'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 334 | PG 177552 | IDLAN 3563899
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-04-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177552'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177552'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 335 | PG 177880 | IDLAN 3444728
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200.6,
    '2022-01-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '177880'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177880'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 336 | PG 178199 | IDLAN 5383771
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    232.42,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178199'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178199'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 337 | PG 29532 | IDLAN 4030497
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    401.8,
    '2023-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '29532'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '29532'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 338 | PG 178316 | IDLAN 3567179
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    106.8,
    '2022-04-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178316'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178316'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 339 | PG 178316 | IDLAN 4312070
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178316'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178316'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 340 | PG 178323 | IDLAN 4286042
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178323'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178323'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 341 | PG 178361 | IDLAN 4583638
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    51.3,
    '2024-05-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178361'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178361'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 342 | PG 178529 | IDLAN 3934842
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    47.6,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178529'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178529'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 343 | PG 178737 | IDLAN 4449367
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    87.7,
    '2024-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178737'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178737'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 344 | PG 178804 | IDLAN 3743594
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    10.4,
    '2022-08-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178804'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178804'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 345 | PG 178804 | IDLAN 4367712
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45.68,
    '2024-01-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178804'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178804'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 346 | PG 47562 | IDLAN 3933394
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    427.52,
    '2023-02-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47562'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47562'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 347 | PG 47562 | IDLAN 3933441
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.89,
    '2023-02-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47562'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47562'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 348 | PG 178858 | IDLAN 4551043
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31.9,
    '2024-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178858'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178858'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 349 | PG 75693 | IDLAN 3428339
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.4,
    '2021-12-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '75693'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '75693'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 350 | PG 178922 | IDLAN 3766687
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2022-08-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178922'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178922'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 351 | PG 178929 | IDLAN 4027955
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78.4,
    '2023-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178929'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178929'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 352 | PG 178948 | IDLAN 4318078
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1286,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178948'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178948'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 353 | PG 178954 | IDLAN 4543683
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    136,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '178954'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '178954'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 354 | PG 11653 | IDLAN 5481254
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '11653'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '11653'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 355 | PG 179110 | IDLAN 3739240
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38,
    '2022-08-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179110'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179110'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 356 | PG 179150 | IDLAN 3601720
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    224.2,
    '2022-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179150'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179150'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 357 | PG 179252 | IDLAN 4317513
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179252'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179252'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 358 | PG 179291 | IDLAN 3494816
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8.6,
    '2022-02-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179291'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179291'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 359 | PG 179291 | IDLAN 4308881
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    140,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179291'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179291'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 360 | PG 179301 | IDLAN 4868059
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    336,
    '2024-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179301'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179301'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 361 | PG 179311 | IDLAN 5200777
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    798,
    '2025-06-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179311'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179311'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 362 | PG 179311 | IDLAN 5536645
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    180,
    '2026-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179311'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179311'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 363 | PG 179422 | IDLAN 4078354
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    181,
    '2023-05-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179422'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179422'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 364 | PG 179452 | IDLAN 4297930
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    238.46,
    '2023-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179452'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179452'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 365 | PG 179729 | IDLAN 4626970
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    37,
    '2024-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179729'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179729'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 366 | PG 179750 | IDLAN 4413523
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179750'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179750'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 367 | PG 179809 | IDLAN 3765358
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200.6,
    '2022-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179809'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179809'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 368 | PG 179809 | IDLAN 3765361
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    47.6,
    '2022-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179809'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179809'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 369 | PG 179809 | IDLAN 4283481
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-11-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179809'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179809'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 370 | PG 43954 | IDLAN 3935504
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '43954'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '43954'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 371 | PG 179922 | IDLAN 4319301
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    650,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179922'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179922'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 372 | PG 180083 | IDLAN 4596846
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2024-05-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180083'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180083'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 373 | PG 180100 | IDLAN 4206389
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    294.9,
    '2023-08-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180100'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180100'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 374 | PG 180100 | IDLAN 4633636
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    68.4,
    '2024-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180100'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180100'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 375 | PG 180130 | IDLAN 3606860
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    603.2,
    '2022-06-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180130'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180130'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 376 | PG 180178 | IDLAN 3446101
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5,
    '2022-01-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180178'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180178'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 377 | PG 180216 | IDLAN 3539266
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    135,
    '2022-03-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 378 | PG 180216 | IDLAN 3544286
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422.4,
    '2022-04-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 379 | PG 180216 | IDLAN 4077069
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422.4,
    '2023-05-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 380 | PG 180216 | IDLAN 4319833
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    356.5,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 381 | PG 180535 | IDLAN 3851198
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2022-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180535'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180535'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 382 | PG 180535 | IDLAN 3851201
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    279,
    '2022-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180535'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180535'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 383 | PG 180604 | IDLAN 3579806
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    29.66,
    '2022-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180604'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180604'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 384 | PG 43629 | IDLAN 5777100
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    107.54,
    '2026-06-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '43629'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '43629'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 385 | PG 180701 | IDLAN 4079311
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.25,
    '2023-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180701'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180701'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 386 | PG 180825 | IDLAN 4319048
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    783.2,
    '2023-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180825'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180825'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 387 | PG 102206 | IDLAN 4932369
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168.48,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '102206'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '102206'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 388 | PG 180996 | IDLAN 5807941
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    672,
    '2026-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '180996'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180996'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 389 | PG 181016 | IDLAN 4267124
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    86.85,
    '2023-10-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181016'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181016'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 390 | PG 181109 | IDLAN 4597947
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    630,
    '2024-05-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181109'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181109'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 391 | PG 121166 | IDLAN 3575343
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-05-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '121166'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '121166'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 392 | PG 82946 | IDLAN 4501366
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    72,
    '2024-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '82946'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '82946'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 393 | PG 181429 | IDLAN 3572717
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    40.8,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181429'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181429'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 394 | PG 181551 | IDLAN 4269058
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2023-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181551'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181551'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 395 | PG 181715 | IDLAN 3516479
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2022-03-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181715'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181715'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 396 | PG 179332 | IDLAN 3833921
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    87.19,
    '2022-11-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '179332'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '179332'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 397 | PG 181775 | IDLAN 5132548
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    247.3,
    '2025-05-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181775'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181775'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 398 | PG 181875 | IDLAN 3824721
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    182.4,
    '2022-10-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181875'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181875'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 399 | PG 181880 | IDLAN 3444759
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2022-01-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '181880'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '181880'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 400 | PG 183023 | IDLAN 5051113
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168,
    '2025-03-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183023'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183023'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 401 | PG 183165 | IDLAN 3781959
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    189.6,
    '2022-09-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183165'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183165'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 402 | PG 183383 | IDLAN 4317490
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183383'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183383'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 403 | PG 183433 | IDLAN 3410028
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200.6,
    '2021-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183433'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183433'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 404 | PG 183569 | IDLAN 4041626
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    190,
    '2023-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183569'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183569'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 405 | PG 183600 | IDLAN 4543678
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183600'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183600'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 406 | PG 183619 | IDLAN 4277749
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    7.92,
    '2023-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183619'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183619'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 407 | PG 183628 | IDLAN 3578060
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    379.04,
    '2022-02-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183628'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183628'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 408 | PG 183654 | IDLAN 5616255
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    147.15,
    '2026-03-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183654'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183654'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 409 | PG 183775 | IDLAN 4316173
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.62,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183775'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183775'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 410 | PG 183834 | IDLAN 3414718
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80,
    '2021-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183834'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183834'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 411 | PG 183886 | IDLAN 4738853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2024-08-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183886'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183886'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 412 | PG 184139 | IDLAN 3553166
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    677.5,
    '2022-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184139'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184139'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 413 | PG 184189 | IDLAN 4258535
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    142.5,
    '2023-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184189'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184189'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 414 | PG 293728 | IDLAN 4587532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    250.75,
    '2024-05-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293728'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293728'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 415 | PG 184217 | IDLAN 4272417
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-10-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 416 | PG 184236 | IDLAN 4508389
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    210.9,
    '2024-03-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184236'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184236'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 417 | PG 184236 | IDLAN 4899652
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    137.66,
    '2024-12-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184236'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184236'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 418 | PG 184236 | IDLAN 4899665
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    593.75,
    '2024-12-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184236'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184236'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 419 | PG 184242 | IDLAN 4307107
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.72,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184242'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184242'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 420 | PG 184356 | IDLAN 4214186
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    81.6,
    '2023-08-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184356'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184356'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 421 | PG 184431 | IDLAN 4721673
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    736.25,
    '2024-08-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184431'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184431'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 422 | PG 8373 | IDLAN 4983580
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2025-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '8373'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '8373'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 423 | PG 184583 | IDLAN 3956238
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    810,
    '2023-02-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184583'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184583'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 424 | PG 184693 | IDLAN 4182822
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-07-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '184693'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '184693'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 425 | PG 74407 | IDLAN 5327841
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422.56,
    '2025-09-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '74407'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '74407'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 426 | PG 66438 | IDLAN 5162328
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1756,
    '2025-05-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '66438'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '66438'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 427 | PG 185994 | IDLAN 3918834
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2023-01-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '185994'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '185994'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 428 | PG 185994 | IDLAN 4461679
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473.8,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '185994'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '185994'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 429 | PG 186013 | IDLAN 3467676
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    27.25,
    '2022-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186013'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186013'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 430 | PG 186081 | IDLAN 3493115
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13.6,
    '2022-02-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186081'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186081'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 431 | PG 186154 | IDLAN 4543700
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45.57,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186154'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186154'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 432 | PG 186162 | IDLAN 3562459
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2022-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186162'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186162'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 433 | PG 186183 | IDLAN 4316287
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.59,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186183'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186183'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 434 | PG 186443 | IDLAN 3572708
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.8,
    '2022-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186443'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186443'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 435 | PG 41841 | IDLAN 5725278
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2026-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '41841'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '41841'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 436 | PG 186535 | IDLAN 5383838
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    444.8,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186535'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186535'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 437 | PG 186791 | IDLAN 4919088
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    59,
    '2025-01-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '186791'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186791'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 438 | PG 97525 | IDLAN 4306986
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    216,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97525'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97525'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 439 | PG 187165 | IDLAN 3414820
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    347.44,
    '2021-12-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187165'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187165'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 440 | PG 187365 | IDLAN 4306708
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187365'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187365'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 441 | PG 187391 | IDLAN 5292694
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    350,
    '2025-08-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187391'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187391'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 442 | PG 15680 | IDLAN 6030820
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    437,
    '2026-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '15680'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '15680'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 443 | PG 187629 | IDLAN 3572761
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    165.31,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187629'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187629'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 444 | PG 187784 | IDLAN 3423424
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2021-12-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187784'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187784'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 445 | PG 187873 | IDLAN 4233475
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2591,
    '2023-09-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187873'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187873'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 446 | PG 187875 | IDLAN 5255659
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    112,
    '2025-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187875'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187875'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 447 | PG 187875 | IDLAN 5857976
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    121.6,
    '2026-07-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187875'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187875'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 448 | PG 187885 | IDLAN 3952971
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    153,
    '2023-02-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '187885'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '187885'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 449 | PG 188061 | IDLAN 3548565
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2022-04-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188061'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188061'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 450 | PG 188061 | IDLAN 3605935
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30.87,
    '2022-06-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188061'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188061'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 451 | PG 188061 | IDLAN 4932262
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168.48,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188061'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188061'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 452 | PG 188172 | IDLAN 3955140
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    84,
    '2023-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188172'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188172'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 453 | PG 188172 | IDLAN 4035481
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2023-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188172'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188172'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 454 | PG 188218 | IDLAN 4184580
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108,
    '2023-08-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188218'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188218'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 455 | PG 79336 | IDLAN 4543797
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    135,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79336'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79336'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 456 | PG 79336 | IDLAN 4633624
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22.8,
    '2024-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79336'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79336'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 457 | PG 188224 | IDLAN 3563161
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78.4,
    '2022-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188224'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188224'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 458 | PG 188241 | IDLAN 3821102
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    58,
    '2022-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188241'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188241'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 459 | PG 188286 | IDLAN 3836743
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.09,
    '2022-11-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188286'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188286'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 460 | PG 188286 | IDLAN 4418988
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    138,
    '2024-02-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188286'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188286'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 461 | PG 188418 | IDLAN 5281481
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26,
    '2025-08-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188418'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188418'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 462 | PG 188527 | IDLAN 3494792
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    18.91,
    '2022-02-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188527'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188527'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 463 | PG 188529 | IDLAN 4048411
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4,
    '2023-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188529'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188529'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 464 | PG 188537 | IDLAN 4307080
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    172.08,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188537'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188537'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 465 | PG 188543 | IDLAN 3739203
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2022-08-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188543'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188543'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 466 | PG 188553 | IDLAN 4314306
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2023-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188553'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188553'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 467 | PG 188579 | IDLAN 3934796
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45.5,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188579'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188579'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 468 | PG 188610 | IDLAN 4306891
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188610'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188610'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 469 | PG 188917 | IDLAN 4315394
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    149,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188917'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188917'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 470 | PG 188964 | IDLAN 5664619
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1351.2,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188964'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188964'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 471 | PG 189004 | IDLAN 5378154
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189004'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189004'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 472 | PG 189116 | IDLAN 4081877
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.9,
    '2023-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189116'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189116'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 473 | PG 189123 | IDLAN 3578532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    652.6,
    '2022-05-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189123'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189123'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 474 | PG 189123 | IDLAN 3578533
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    281.6,
    '2022-05-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189123'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189123'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 475 | PG 189153 | IDLAN 3428254
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    654.36,
    '2021-12-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189153'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189153'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 476 | PG 189191 | IDLAN 3651943
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.4,
    '2022-07-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '189191'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '189191'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 477 | PG 1348 | IDLAN 5594248
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95.95,
    '2026-02-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '1348'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '1348'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 478 | PG 3669 | IDLAN 3590411
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3504,
    '2022-05-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '3669'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '3669'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 479 | PG 7185 | IDLAN 3572798
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.6,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '7185'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '7185'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 480 | PG 27872 | IDLAN 5075671
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11.24,
    '2025-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '27872'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '27872'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 481 | PG 83424 | IDLAN 4120938
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126.45,
    '2023-06-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '83424'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '83424'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 482 | PG 83424 | IDLAN 4543793
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    130.5,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '83424'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '83424'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 483 | PG 9907 | IDLAN 5387572
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9907'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9907'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 484 | PG 9907 | IDLAN 5387573
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    75,
    '2025-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9907'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9907'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 485 | PG 9907 | IDLAN 5387574
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2025-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9907'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9907'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 486 | PG 12719 | IDLAN 4524502
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    85.12,
    '2024-04-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '12719'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '12719'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 487 | PG 18621 | IDLAN 4812627
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    505.4,
    '2024-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '18621'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '18621'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 488 | PG 19392 | IDLAN 5089924
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    47.88,
    '2025-04-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '19392'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '19392'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 489 | PG 20451 | IDLAN 4330032
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    431,
    '2023-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '20451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '20451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 490 | PG 20844 | IDLAN 5640238
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    6,
    '2026-03-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '20844'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '20844'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 491 | PG 22887 | IDLAN 4119831
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100.2,
    '2023-06-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '22887'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '22887'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 492 | PG 24486 | IDLAN 5977336
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    192,
    '2026-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '24486'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '24486'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 493 | PG 304011 | IDLAN 5139288
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    54,
    '2025-05-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304011'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304011'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 494 | PG 25317 | IDLAN 3579947
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.9,
    '2022-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '25317'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '25317'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 495 | PG 25317 | IDLAN 3773065
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80.75,
    '2022-09-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '25317'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '25317'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 496 | PG 252289 | IDLAN 3559321
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    250,
    '2022-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252289'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252289'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 497 | PG 25923 | IDLAN 5806680
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.28,
    '2026-06-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '25923'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '25923'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 498 | PG 26296 | IDLAN 5069113
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    309.7,
    '2025-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '26296'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '26296'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 499 | PG 26296 | IDLAN 5069141
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    121.6,
    '2025-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '26296'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '26296'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 500 | PG 26510 | IDLAN 5903776
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    282,
    '2026-08-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '26510'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '26510'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 501 | PG 27551 | IDLAN 5911124
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2026-08-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '27551'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '27551'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 502 | PG 27915 | IDLAN 5664636
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    352,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '27915'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '27915'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 503 | PG 29083 | IDLAN 4737490
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    10.84,
    '2024-08-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '29083'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '29083'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 504 | PG 29331 | IDLAN 4462700
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '29331'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '29331'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 505 | PG 30024 | IDLAN 5616151
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    763.8,
    '2026-03-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '30024'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '30024'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 506 | PG 302587 | IDLAN 5531843
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    119,
    '2026-01-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302587'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302587'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 507 | PG 275301 | IDLAN 4077070
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    730.74,
    '2023-05-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275301'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275301'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 508 | PG 31374 | IDLAN 3768843
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13.6,
    '2022-09-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '31374'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '31374'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 509 | PG 31907 | IDLAN 5390744
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    174,
    '2025-11-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '31907'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '31907'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 510 | PG 32220 | IDLAN 4793120
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    57.95,
    '2024-10-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '32220'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '32220'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 511 | PG 32388 | IDLAN 4381174
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.2,
    '2024-01-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '32388'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '32388'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 512 | PG 33537 | IDLAN 3572762
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    210.2,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '33537'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '33537'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 513 | PG 36175 | IDLAN 4471289
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.89,
    '2024-03-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36175'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36175'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 514 | PG 36286 | IDLAN 5377615
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    94,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36286'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36286'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 515 | PG 36903 | IDLAN 5709310
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    35,
    '2026-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '36903'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '36903'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 516 | PG 37138 | IDLAN 3971863
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.24,
    '2023-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '37138'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '37138'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 517 | PG 38337 | IDLAN 5400384
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    499,
    '2025-11-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '38337'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '38337'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 518 | PG 39269 | IDLAN 5426327
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2025-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '39269'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '39269'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 519 | PG 40057 | IDLAN 4233954
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    170.2,
    '2023-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '40057'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '40057'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 520 | PG 40217 | IDLAN 3546968
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    907.2,
    '2022-04-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '40217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '40217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 521 | PG 40217 | IDLAN 3552029
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2072,
    '2022-04-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '40217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '40217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 522 | PG 40532 | IDLAN 5350343
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    96.67,
    '2025-10-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '40532'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '40532'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 523 | PG 41918 | IDLAN 6032168
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    35,
    '2026-09-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '41918'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '41918'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 524 | PG 42734 | IDLAN 3521397
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50.1,
    '2022-03-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '42734'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '42734'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 525 | PG 43523 | IDLAN 4301125
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    782.79,
    '2023-11-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '43523'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '43523'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 526 | PG 43968 | IDLAN 4504726
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    444,
    '2024-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '43968'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '43968'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 527 | PG 46032 | IDLAN 4626106
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2,
    '2024-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '46032'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '46032'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 528 | PG 46376 | IDLAN 4826165
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2024-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '46376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '46376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 529 | PG 47236 | IDLAN 3483697
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    426.95,
    '2022-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47236'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47236'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 530 | PG 47580 | IDLAN 5865675
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    467,
    '2026-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '47580'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '47580'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 531 | PG 48022 | IDLAN 5624805
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    212.8,
    '2026-03-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '48022'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '48022'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 532 | PG 48022 | IDLAN 5736940
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66.5,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '48022'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '48022'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 533 | PG 51128 | IDLAN 5268554
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19.9,
    '2025-08-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '51128'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '51128'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 534 | PG 51672 | IDLAN 4613095
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    560,
    '2024-06-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '51672'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '51672'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 535 | PG 53127 | IDLAN 3564271
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    81.8,
    '2022-04-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '53127'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '53127'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 536 | PG 53127 | IDLAN 3766423
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    178.5,
    '2022-08-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '53127'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '53127'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 537 | PG 53715 | IDLAN 5670568
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-04-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '53715'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '53715'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 538 | PG 263961 | IDLAN 4062877
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    61.36,
    '2023-05-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263961'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263961'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 539 | PG 263961 | IDLAN 4624379
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    39.9,
    '2024-06-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263961'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263961'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 540 | PG 54423 | IDLAN 5741411
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1331,
    '2026-05-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '54423'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '54423'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 541 | PG 56810 | IDLAN 4140059
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    21.6,
    '2023-07-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '56810'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '56810'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 542 | PG 57844 | IDLAN 4781152
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    494,
    '2024-09-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '57844'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '57844'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 543 | PG 58835 | IDLAN 3972047
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    169.1,
    '2023-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '58835'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '58835'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 544 | PG 303567 | IDLAN 4800137
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    35,
    '2024-10-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303567'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303567'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 545 | PG 62393 | IDLAN 5938437
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2026-08-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '62393'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '62393'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 546 | PG 63148 | IDLAN 4312298
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63148'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63148'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 547 | PG 63309 | IDLAN 4329718
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    84.3,
    '2023-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63309'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63309'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 548 | PG 63751 | IDLAN 5396957
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    89.1,
    '2025-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63751'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63751'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 549 | PG 63761 | IDLAN 4413754
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.5,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63761'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63761'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 550 | PG 63928 | IDLAN 5383843
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    499.32,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63928'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63928'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 551 | PG 63928 | IDLAN 6066974
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    36,
    '2026-10-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '63928'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '63928'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 552 | PG 64382 | IDLAN 5606291
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '64382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '64382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 553 | PG 64664 | IDLAN 5134393
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    101,
    '2025-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '64664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '64664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 554 | PG 65735 | IDLAN 6035835
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95,
    '2026-10-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '65735'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '65735'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 555 | PG 67659 | IDLAN 3575477
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.2,
    '2022-05-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '67659'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '67659'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 556 | PG 68156 | IDLAN 4231681
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    215.6,
    '2023-09-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '68156'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '68156'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 557 | PG 69929 | IDLAN 5844067
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    128,
    '2026-07-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '69929'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '69929'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 558 | PG 69929 | IDLAN 5844069
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    421,
    '2026-07-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '69929'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '69929'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 559 | PG 70642 | IDLAN 5722098
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2026-05-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '70642'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '70642'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 560 | PG 71250 | IDLAN 3657798
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.97,
    '2022-07-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '71250'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '71250'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 561 | PG 72524 | IDLAN 3870296
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    241.6,
    '2022-12-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '72524'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '72524'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 562 | PG 75604 | IDLAN 4507490
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    179.2,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '75604'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '75604'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 563 | PG 77875 | IDLAN 5090497
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-04-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77875'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77875'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 564 | PG 77875 | IDLAN 5313380
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    91,
    '2025-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77875'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77875'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 565 | PG 77877 | IDLAN 4464444
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    908.6,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77877'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77877'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 566 | PG 77877 | IDLAN 4464744
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    51.2,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77877'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77877'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 567 | PG 77877 | IDLAN 3362599
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30.4,
    '2021-10-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77877'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77877'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 568 | PG 77877 | IDLAN 3387708
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    6.4,
    '2021-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '77877'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '77877'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 569 | PG 78530 | IDLAN 4028301
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120.8,
    '2023-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '78530'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '78530'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 570 | PG 325112 | IDLAN 5593158
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    381,
    '2026-02-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325112'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325112'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 571 | PG 79824 | IDLAN 4984233
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2069,
    '2025-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '79824'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '79824'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 572 | PG 80542 | IDLAN 5614529
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2026-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '80542'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '80542'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 573 | PG 80542 | IDLAN 5690656
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    142,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '80542'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '80542'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 574 | PG 82006 | IDLAN 3861830
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    800,
    '2022-12-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '82006'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '82006'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 575 | PG 82524 | IDLAN 3587117
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.46,
    '2022-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '82524'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '82524'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 576 | PG 83584 | IDLAN 5536627
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    84,
    '2026-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '83584'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '83584'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 577 | PG 84735 | IDLAN 4544352
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11.2,
    '2024-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '84735'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '84735'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 578 | PG 84735 | IDLAN 4548659
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    37,
    '2024-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '84735'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '84735'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 579 | PG 85635 | IDLAN 4575902
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    142.8,
    '2024-05-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '85635'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '85635'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 580 | PG 85709 | IDLAN 4367017
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    395,
    '2024-01-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '85709'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '85709'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 581 | PG 85709 | IDLAN 4765948
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    156.75,
    '2024-09-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '85709'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '85709'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 582 | PG 87806 | IDLAN 4751563
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    304,
    '2024-08-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '87806'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '87806'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 583 | PG 88607 | IDLAN 4461892
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    110.5,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '88607'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '88607'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 584 | PG 91338 | IDLAN 4306806
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '91338'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '91338'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 585 | PG 94290 | IDLAN 5445046
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    252,
    '2025-12-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '94290'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '94290'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 586 | PG 96133 | IDLAN 4034550
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    56.99,
    '2023-04-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '96133'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96133'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 587 | PG 96631 | IDLAN 3732469
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    28.9,
    '2022-08-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '96631'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96631'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 588 | PG 96631 | IDLAN 4402449
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2024-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '96631'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96631'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 589 | PG 97361 | IDLAN 4389874
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    769.47,
    '2024-01-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '97361'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '97361'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 590 | PG 100272 | IDLAN 4539806
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    115.6,
    '2024-04-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '100272'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '100272'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 591 | PG 105975 | IDLAN 4599499
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    216,
    '2024-05-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '105975'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '105975'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 592 | PG 113195 | IDLAN 3558684
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    231.2,
    '2022-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '113195'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '113195'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 593 | PG 113195 | IDLAN 3563900
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66,
    '2022-04-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '113195'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '113195'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 594 | PG 113195 | IDLAN 4285994
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '113195'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '113195'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 595 | PG 113195 | IDLAN 3377381
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2991.67,
    '2021-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '113195'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '113195'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 596 | PG 118134 | IDLAN 5366441
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    21,
    '2025-10-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '118134'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '118134'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 597 | PG 121266 | IDLAN 4321844
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    73.2,
    '2023-12-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '121266'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '121266'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 598 | PG 124100 | IDLAN 3767297
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1936,
    '2022-09-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '124100'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '124100'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 599 | PG 127645 | IDLAN 3791652
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    86.11,
    '2022-09-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 600 | PG 127645 | IDLAN 3855629
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.28,
    '2022-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 601 | PG 127645 | IDLAN 3855675
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    448.39,
    '2022-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 602 | PG 127645 | IDLAN 4501362
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    767.61,
    '2024-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '127645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '127645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 603 | PG 136880 | IDLAN 5277054
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    234,
    '2025-08-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '136880'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '136880'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 604 | PG 138145 | IDLAN 3397794
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    249.37,
    '2021-11-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '138145'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '138145'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 605 | PG 145469 | IDLAN 5353695
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8,
    '2025-10-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '145469'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145469'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 606 | PG 157633 | IDLAN 5612293
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    69,
    '2026-02-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '157633'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '157633'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 607 | PG 17835 | IDLAN 3575557
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    56.72,
    '2022-05-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '17835'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '17835'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 608 | PG 262769 | IDLAN 5372243
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95,
    '2025-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262769'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262769'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 609 | PG 183139 | IDLAN 5335401
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    37.71,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '183139'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '183139'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 610 | PG 237431 | IDLAN 5836636
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    340,
    '2026-07-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237431'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237431'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 611 | PG 237431 | IDLAN 5996900
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    350,
    '2026-09-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237431'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237431'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 612 | PG 237534 | IDLAN 3547263
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31.6,
    '2022-04-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237534'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237534'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 613 | PG 237534 | IDLAN 4285944
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2023-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237534'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237534'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 614 | PG 237534 | IDLAN 4318733
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    692.5,
    '2023-12-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237534'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237534'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 615 | PG 237587 | IDLAN 3661542
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.97,
    '2022-07-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237587'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237587'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 616 | PG 237635 | IDLAN 4332201
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    33.08,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237635'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237635'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 617 | PG 237637 | IDLAN 4312040
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237637'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237637'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 618 | PG 237645 | IDLAN 4332886
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1169,
    '2023-12-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 619 | PG 237670 | IDLAN 3794980
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13.37,
    '2022-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237670'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237670'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 620 | PG 237722 | IDLAN 4747248
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.2,
    '2024-09-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '237722'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237722'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 621 | PG 246955 | IDLAN 3661592
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    124,
    '2022-07-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '246955'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '246955'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 622 | PG 246964 | IDLAN 4722899
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    669,
    '2024-08-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '246964'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '246964'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 623 | PG 246964 | IDLAN 4722923
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    294,
    '2024-08-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '246964'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '246964'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 624 | PG 246987 | IDLAN 3936035
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2023-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '246987'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '246987'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 625 | PG 246989 | IDLAN 4207755
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    46.84,
    '2023-08-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '246989'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '246989'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 626 | PG 66750 | IDLAN 3933513
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    399,
    '2023-02-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '66750'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '66750'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 627 | PG 247197 | IDLAN 4164547
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    61.85,
    '2023-07-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247197'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247197'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 628 | PG 247228 | IDLAN 4310385
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    198,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247228'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247228'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 629 | PG 247243 | IDLAN 4304516
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24.7,
    '2023-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247243'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247243'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 630 | PG 247243 | IDLAN 3666871
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    128.25,
    '2022-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247243'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247243'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 631 | PG 247255 | IDLAN 3559335
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    170,
    '2022-04-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247255'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247255'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 632 | PG 247313 | IDLAN 4317652
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    95,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247313'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247313'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 633 | PG 247415 | IDLAN 3577020
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    389.6,
    '2022-05-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247415'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247415'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 634 | PG 247484 | IDLAN 3572804
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247484'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247484'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 635 | PG 247556 | IDLAN 4163494
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    428.68,
    '2023-07-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247556'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247556'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 636 | PG 247619 | IDLAN 4289554
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2023-11-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247619'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247619'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 637 | PG 247619 | IDLAN 4289556
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422.4,
    '2023-11-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247619'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247619'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 638 | PG 247747 | IDLAN 3603876
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66,
    '2022-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247747'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247747'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 639 | PG 247747 | IDLAN 3603877
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45.5,
    '2022-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247747'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247747'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 640 | PG 247747 | IDLAN 4303480
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.5,
    '2023-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247747'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247747'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 641 | PG 247757 | IDLAN 3760887
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    89.6,
    '2022-08-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247757'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247757'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 642 | PG 247991 | IDLAN 4581824
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2024-05-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '247991'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247991'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 643 | PG 248125 | IDLAN 4317821
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.52,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248125'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248125'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 644 | PG 248223 | IDLAN 3455831
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    366.8,
    '2022-01-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248223'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248223'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 645 | PG 248287 | IDLAN 3771532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12.8,
    '2022-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248287'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248287'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 646 | PG 248427 | IDLAN 4877666
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    352.8,
    '2024-12-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248427'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248427'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 647 | PG 248635 | IDLAN 4306887
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    185.07,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248635'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248635'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 648 | PG 248641 | IDLAN 4465231
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    278.4,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248641'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248641'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 649 | PG 248786 | IDLAN 3563786
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    109.19,
    '2022-04-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248786'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248786'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 650 | PG 248865 | IDLAN 4315857
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248865'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248865'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 651 | PG 248874 | IDLAN 3642909
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    288.19,
    '2022-07-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248874'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248874'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 652 | PG 248965 | IDLAN 5481170
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2856,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248965'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248965'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 653 | PG 248965 | IDLAN 5481176
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    405.65,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '248965'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248965'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 654 | PG 249092 | IDLAN 4553243
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    950.51,
    '2024-04-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '249092'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '249092'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 655 | PG 249092 | IDLAN 5339631
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1167.19,
    '2025-09-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '249092'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '249092'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 656 | PG 249143 | IDLAN 4698211
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    349.6,
    '2024-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '249143'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '249143'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 657 | PG 249167 | IDLAN 3795641
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    547.96,
    '2022-09-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '249167'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '249167'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 658 | PG 249367 | IDLAN 5383831
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    444.8,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '249367'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '249367'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 659 | PG 304180 | IDLAN 5689956
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    123.55,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304180'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304180'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 660 | PG 250140 | IDLAN 4307521
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    248,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250140'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250140'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 661 | PG 250219 | IDLAN 3624915
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    288.31,
    '2022-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 662 | PG 250271 | IDLAN 4507322
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    386.4,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250271'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250271'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 663 | PG 250464 | IDLAN 4749562
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    330,
    '2024-09-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250464'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250464'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 664 | PG 250490 | IDLAN 4255520
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    907.2,
    '2023-10-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250490'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250490'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 665 | PG 250497 | IDLAN 3625958
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12.6,
    '2022-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250497'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250497'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 666 | PG 250685 | IDLAN 4104366
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    264.58,
    '2023-06-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250685'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250685'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 667 | PG 250864 | IDLAN 3572701
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    124.42,
    '2022-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250864'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250864'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 668 | PG 250881 | IDLAN 3542284
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    9.6,
    '2022-04-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250881'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250881'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 669 | PG 250935 | IDLAN 3598245
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    441,
    '2022-05-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '250935'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250935'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 670 | PG 251214 | IDLAN 4667860
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    444.8,
    '2024-07-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251214'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251214'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 671 | PG 251220 | IDLAN 3847259
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1177.6,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251220'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251220'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 672 | PG 251220 | IDLAN 3847261
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473.6,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251220'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251220'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 673 | PG 251308 | IDLAN 4062256
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    251.3,
    '2023-05-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251308'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251308'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 674 | PG 251413 | IDLAN 3669105
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    312.8,
    '2022-07-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251413'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251413'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 675 | PG 251413 | IDLAN 3669106
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    40,
    '2022-07-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251413'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251413'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 676 | PG 251436 | IDLAN 4041535
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2023-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251436'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251436'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 677 | PG 251526 | IDLAN 3587080
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    520.25,
    '2022-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251526'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251526'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 678 | PG 251664 | IDLAN 4057004
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    334.7,
    '2023-05-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 679 | PG 251664 | IDLAN 4307653
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 680 | PG 251698 | IDLAN 3851489
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    149.85,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 681 | PG 251698 | IDLAN 3926925
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    444,
    '2023-01-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 682 | PG 251937 | IDLAN 3425696
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1433.04,
    '2021-12-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '251937'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '251937'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 683 | PG 252546 | IDLAN 4461778
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2024-03-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252546'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252546'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 684 | PG 252703 | IDLAN 3599106
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16,
    '2022-05-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252703'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252703'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 685 | PG 252713 | IDLAN 3453579
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.6,
    '2022-01-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252713'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252713'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 686 | PG 252774 | IDLAN 3415204
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1962.45,
    '2021-11-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252774'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252774'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 687 | PG 252841 | IDLAN 3847103
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    420,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252841'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252841'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 688 | PG 252841 | IDLAN 4303572
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    98,
    '2023-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252841'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252841'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 689 | PG 252982 | IDLAN 5752039
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    598.5,
    '2026-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252982'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252982'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 690 | PG 252982 | IDLAN 6066522
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78,
    '2026-10-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '252982'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252982'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 691 | PG 253005 | IDLAN 3486631
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    89.88,
    '2022-02-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253005'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253005'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 692 | PG 282297 | IDLAN 4449832
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108.1,
    '2024-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282297'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282297'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 693 | PG 253384 | IDLAN 3457167
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2022-01-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253384'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253384'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 694 | PG 253810 | IDLAN 3543690
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    743.4,
    '2022-04-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253810'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253810'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 695 | PG 57674 | IDLAN 4313010
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    618,
    '2023-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '57674'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '57674'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 696 | PG 253868 | IDLAN 3572751
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.2,
    '2022-05-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253868'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253868'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 697 | PG 253870 | IDLAN 3770998
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    177,
    '2022-09-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253870'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253870'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 698 | PG 253872 | IDLAN 3408197
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    500,
    '2021-11-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253872'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253872'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 699 | PG 253880 | IDLAN 4329427
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    270.75,
    '2023-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253880'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253880'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 700 | PG 253951 | IDLAN 3608755
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    256.3,
    '2022-06-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '253951'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253951'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 701 | PG 254028 | IDLAN 4503932
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    818.75,
    '2024-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254028'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254028'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 702 | PG 254040 | IDLAN 3727666
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    300,
    '2022-08-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254040'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254040'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 703 | PG 254095 | IDLAN 3834532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3.6,
    '2022-11-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254095'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254095'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 704 | PG 254270 | IDLAN 3847057
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    655.2,
    '2022-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254270'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254270'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 705 | PG 254270 | IDLAN 3847439
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1225,
    '2022-11-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254270'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254270'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 706 | PG 254317 | IDLAN 3427435
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2021-12-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254317'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254317'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 707 | PG 254337 | IDLAN 5217768
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    155,
    '2025-07-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254337'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254337'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 708 | PG 254382 | IDLAN 3467542
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    14.42,
    '2022-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 709 | PG 256920 | IDLAN 3589373
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-05-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '256920'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '256920'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 710 | PG 256952 | IDLAN 3511719
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2242.93,
    '2022-01-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '256952'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '256952'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 711 | PG 256965 | IDLAN 3588035
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    85.44,
    '2022-05-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '256965'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '256965'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 712 | PG 257029 | IDLAN 5996606
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    14.64,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257029'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257029'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 713 | PG 257035 | IDLAN 5655711
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    36,
    '2026-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257035'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257035'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 714 | PG 257049 | IDLAN 3788510
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    15,
    '2022-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257049'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257049'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 715 | PG 257068 | IDLAN 5481154
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1325,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 716 | PG 257094 | IDLAN 3554360
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2022-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257094'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257094'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 717 | PG 257095 | IDLAN 4721968
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16.6,
    '2024-08-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257095'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257095'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 718 | PG 257095 | IDLAN 4890375
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    378.85,
    '2024-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257095'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257095'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 719 | PG 257277 | IDLAN 3732228
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4416,
    '2022-08-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257277'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257277'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 720 | PG 257291 | IDLAN 3444551
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    336,
    '2022-01-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257291'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257291'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 721 | PG 257380 | IDLAN 3428244
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12.6,
    '2021-12-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257380'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257380'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 722 | PG 257505 | IDLAN 3640759
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    65,
    '2022-07-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257505'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257505'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 723 | PG 257508 | IDLAN 3616004
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    161,
    '2022-06-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257508'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257508'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 724 | PG 257781 | IDLAN 3440470
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    231.2,
    '2022-01-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257781'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257781'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 725 | PG 258211 | IDLAN 5204917
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    531.05,
    '2025-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '258211'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258211'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 726 | PG 258287 | IDLAN 3826262
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    286.7,
    '2022-10-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '258287'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258287'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 727 | PG 254365 | IDLAN 3459947
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26,
    '2022-01-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254365'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254365'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 728 | PG 254365 | IDLAN 5339513
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1024,
    '2025-09-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '254365'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254365'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 729 | PG 290450 | IDLAN 5664639
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    704,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290450'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290450'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 730 | PG 259281 | IDLAN 4235970
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    430,
    '2023-09-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '259281'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259281'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 731 | PG 259427 | IDLAN 3756237
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24,
    '2022-08-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '259427'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259427'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 732 | PG 259496 | IDLAN 4511845
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126.64,
    '2024-04-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '259496'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259496'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 733 | PG 259653 | IDLAN 5383822
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5413.2,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '259653'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259653'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 734 | PG 259888 | IDLAN 5665341
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1291.2,
    '2026-03-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '259888'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259888'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 735 | PG 260153 | IDLAN 3665675
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.96,
    '2022-07-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '260153'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260153'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 736 | PG 260176 | IDLAN 5170448
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    800,
    '2025-06-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '260176'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260176'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 737 | PG 260324 | IDLAN 4543794
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    110,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '260324'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260324'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 738 | PG 260702 | IDLAN 4176062
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    39.5,
    '2023-07-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '260702'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260702'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 739 | PG 261221 | IDLAN 4968637
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    58,
    '2025-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261221'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261221'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 740 | PG 261366 | IDLAN 4633654
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22.4,
    '2024-06-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261366'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261366'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 741 | PG 261553 | IDLAN 3874720
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168,
    '2022-12-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261553'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261553'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 742 | PG 261661 | IDLAN 4543697
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    156.98,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261661'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261661'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 743 | PG 261671 | IDLAN 4935961
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    693.69,
    '2025-01-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261671'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261671'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 744 | PG 261671 | IDLAN 4936003
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    292.6,
    '2025-01-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261671'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261671'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 745 | PG 261687 | IDLAN 5257390
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    188.1,
    '2025-07-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261687'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261687'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 746 | PG 261687 | IDLAN 5281244
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3,
    '2025-08-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261687'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261687'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 747 | PG 261696 | IDLAN 4178760
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    93.27,
    '2023-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261696'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261696'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 748 | PG 261701 | IDLAN 3543731
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    626.2,
    '2022-04-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261701'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261701'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 749 | PG 261719 | IDLAN 3595048
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    759.87,
    '2022-05-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261719'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261719'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 750 | PG 261730 | IDLAN 5383810
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1432.4,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261730'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261730'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 751 | PG 261736 | IDLAN 4655465
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    121.8,
    '2024-07-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261736'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261736'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 752 | PG 261736 | IDLAN 5625275
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126,
    '2026-03-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261736'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261736'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 753 | PG 261738 | IDLAN 4317658
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66.4,
    '2023-12-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261738'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261738'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 754 | PG 261862 | IDLAN 4307617
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    206,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261862'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261862'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 755 | PG 261929 | IDLAN 4129658
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    73.08,
    '2023-06-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '261929'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261929'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 756 | PG 262143 | IDLAN 3662374
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38.19,
    '2022-07-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262143'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262143'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 757 | PG 262150 | IDLAN 5244080
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    94,
    '2025-07-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262150'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262150'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 758 | PG 262417 | IDLAN 5335482
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    202.8,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262417'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262417'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 759 | PG 262428 | IDLAN 4846583
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31.35,
    '2024-11-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262428'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262428'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 760 | PG 262457 | IDLAN 3572706
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    85,
    '2022-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '262457'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262457'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 761 | PG 263361 | IDLAN 4079299
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    18.4,
    '2023-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263361'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263361'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 762 | PG 263479 | IDLAN 3661664
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.46,
    '2022-07-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263479'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263479'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 763 | PG 263516 | IDLAN 4505932
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    33.04,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263516'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263516'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 764 | PG 266771 | IDLAN 6037145
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76,
    '2026-10-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '266771'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266771'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 765 | PG 263686 | IDLAN 3942736
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    501.2,
    '2023-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263686'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263686'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 766 | PG 263749 | IDLAN 4078165
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78.67,
    '2023-05-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '263749'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263749'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 767 | PG 264289 | IDLAN 3616133
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22,
    '2022-06-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '264289'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '264289'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 768 | PG 176379 | IDLAN 3843905
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11.2,
    '2022-11-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '176379'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '176379'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 769 | PG 264876 | IDLAN 3851896
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    168,
    '2022-11-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '264876'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '264876'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 770 | PG 265067 | IDLAN 4127963
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    81,
    '2023-06-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265067'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265067'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 771 | PG 265067 | IDLAN 4127968
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2023-06-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265067'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265067'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 772 | PG 265134 | IDLAN 4505821
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    67.2,
    '2024-03-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265134'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265134'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 773 | PG 265165 | IDLAN 4543800
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    58,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265165'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265165'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 774 | PG 265165 | IDLAN 4543755
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    146.8,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265165'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265165'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 775 | PG 265226 | IDLAN 4543680
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    112.1,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265226'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265226'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 776 | PG 265235 | IDLAN 4543658
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    42.5,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265235'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265235'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 777 | PG 265249 | IDLAN 4011053
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    324.9,
    '2023-03-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265249'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265249'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 778 | PG 265327 | IDLAN 4883554
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4736,
    '2024-12-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265327'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265327'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 779 | PG 265454 | IDLAN 4016155
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    103.4,
    '2023-04-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265454'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265454'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 780 | PG 265690 | IDLAN 4836081
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    31,
    '2024-11-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265690'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265690'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 781 | PG 269386 | IDLAN 3832162
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    593.75,
    '2022-11-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269386'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269386'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 782 | PG 265878 | IDLAN 4259583
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    591,
    '2023-10-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265878'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265878'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 783 | PG 265878 | IDLAN 4975973
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    900.8,
    '2025-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '265878'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265878'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 784 | PG 266153 | IDLAN 4413537
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    79.8,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '266153'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266153'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 785 | PG 266488 | IDLAN 5276193
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2025-08-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '266488'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266488'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 786 | PG 266738 | IDLAN 3923789
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    490,
    '2023-01-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '266738'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266738'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 787 | PG 267426 | IDLAN 4455905
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24.36,
    '2024-02-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '267426'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267426'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 788 | PG 267612 | IDLAN 4211699
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    127.68,
    '2023-08-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '267612'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267612'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 789 | PG 267656 | IDLAN 4402442
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    347.76,
    '2024-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '267656'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267656'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 790 | PG 267762 | IDLAN 4834505
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74,
    '2024-11-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '267762'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267762'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 791 | PG 268015 | IDLAN 5664628
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2081.94,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268015'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268015'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 792 | PG 268015 | IDLAN 5664634
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60.65,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268015'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268015'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 793 | PG 274227 | IDLAN 5299918
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    744,
    '2025-08-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274227'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274227'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 794 | PG 274227 | IDLAN 5299920
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    556,
    '2025-08-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274227'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274227'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 795 | PG 268433 | IDLAN 6059027
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    195.94,
    '2026-10-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268433'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268433'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 796 | PG 268458 | IDLAN 4077066
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    536,
    '2023-05-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268458'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268458'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 797 | PG 268591 | IDLAN 4199126
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    33.49,
    '2023-08-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268591'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268591'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 798 | PG 268591 | IDLAN 4316825
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    71.6,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268591'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268591'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 799 | PG 268712 | IDLAN 4032240
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    9.6,
    '2023-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268712'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268712'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 800 | PG 268712 | IDLAN 4543708
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    409.6,
    '2024-04-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268712'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268712'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 801 | PG 268784 | IDLAN 5664624
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    800,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268784'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268784'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 802 | PG 268787 | IDLAN 3834479
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    53.2,
    '2022-11-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268787'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268787'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 803 | PG 268799 | IDLAN 3902748
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1.6,
    '2023-01-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268799'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268799'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 804 | PG 268849 | IDLAN 5815139
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    656,
    '2026-07-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268849'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268849'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 805 | PG 268856 | IDLAN 4231939
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    467,
    '2023-09-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268856'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268856'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 806 | PG 268856 | IDLAN 4580687
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2024-05-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268856'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268856'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 807 | PG 268936 | IDLAN 4583648
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    186,
    '2024-05-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '268936'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268936'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 808 | PG 323976 | IDLAN 5736269
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    268,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323976'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323976'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 809 | PG 269037 | IDLAN 4313424
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    800,
    '2023-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269037'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269037'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 810 | PG 269068 | IDLAN 4983425
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    382,
    '2025-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 811 | PG 269068 | IDLAN 5111739
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    648,
    '2025-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 812 | PG 269068 | IDLAN 5481180
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1078,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 813 | PG 269070 | IDLAN 5468630
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2025-12-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269070'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269070'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 814 | PG 269078 | IDLAN 4147225
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    23.52,
    '2023-07-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269078'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269078'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 815 | PG 269079 | IDLAN 4257076
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    24.36,
    '2023-10-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269079'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269079'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 816 | PG 269097 | IDLAN 5996732
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    354.8,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269097'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269097'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 817 | PG 269184 | IDLAN 5481245
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    801.33,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269184'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269184'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 818 | PG 269184 | IDLAN 5996684
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    18,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269184'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269184'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 819 | PG 269216 | IDLAN 3952104
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    409.55,
    '2023-02-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 820 | PG 269291 | IDLAN 5481249
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78.3,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269291'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269291'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 821 | PG 269334 | IDLAN 3939603
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    638,
    '2023-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269334'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269334'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 822 | PG 269334 | IDLAN 3939604
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    743.4,
    '2023-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269334'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269334'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 823 | PG 269334 | IDLAN 4071233
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    127.7,
    '2023-05-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269334'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269334'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 824 | PG 269376 | IDLAN 4501361
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    594.58,
    '2024-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 825 | PG 269379 | IDLAN 4413517
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    44.8,
    '2024-02-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269379'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269379'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 826 | PG 269429 | IDLAN 3848453
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    968,
    '2022-11-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269429'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269429'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 827 | PG 269526 | IDLAN 3902550
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2023-01-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269526'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269526'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 828 | PG 269835 | IDLAN 5752142
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269835'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269835'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 829 | PG 270124 | IDLAN 5561009
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.96,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270124'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270124'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 830 | PG 270191 | IDLAN 3834347
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    520,
    '2022-11-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270191'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270191'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 831 | PG 270202 | IDLAN 3873743
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2022-12-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270202'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270202'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 832 | PG 270327 | IDLAN 4133556
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    21,
    '2023-07-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270327'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270327'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 833 | PG 270327 | IDLAN 4139983
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    115.92,
    '2023-07-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270327'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270327'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 834 | PG 270327 | IDLAN 4179344
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.52,
    '2023-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270327'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270327'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 835 | PG 270327 | IDLAN 4402436
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    336.84,
    '2024-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270327'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270327'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 836 | PG 270394 | IDLAN 4318640
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    238.74,
    '2023-12-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270394'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270394'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 837 | PG 270424 | IDLAN 4975960
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    310.8,
    '2025-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270424'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270424'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 838 | PG 270851 | IDLAN 5691182
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    96.9,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270851'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270851'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 839 | PG 270851 | IDLAN 5691183
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    332.5,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270851'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270851'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 840 | PG 270872 | IDLAN 4366813
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    226.8,
    '2024-01-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270872'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270872'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 841 | PG 270874 | IDLAN 4189649
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118.97,
    '2023-08-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270874'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270874'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 842 | PG 270910 | IDLAN 4702232
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    40,
    '2024-08-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270910'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270910'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 843 | PG 270947 | IDLAN 4010507
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2023-03-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270947'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270947'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 844 | PG 270962 | IDLAN 4932126
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1242.8,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270962'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270962'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 845 | PG 270988 | IDLAN 5359957
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80,
    '2025-10-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270988'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270988'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 846 | PG 271131 | IDLAN 3840732
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    38,
    '2022-11-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271131'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271131'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 847 | PG 271212 | IDLAN 4126214
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271212'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271212'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 848 | PG 271219 | IDLAN 4655476
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    10.97,
    '2024-07-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 849 | PG 271221 | IDLAN 5848809
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    536,
    '2026-07-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271221'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271221'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 850 | PG 271239 | IDLAN 4176024
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    798,
    '2023-07-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271239'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271239'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 851 | PG 271639 | IDLAN 4010561
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    380,
    '2023-03-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271639'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271639'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 852 | PG 271806 | IDLAN 4303449
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    11.76,
    '2023-11-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '271806'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271806'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 853 | PG 272030 | IDLAN 4047500
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2023-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272030'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272030'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 854 | PG 272041 | IDLAN 4973835
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    413.4,
    '2025-01-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272041'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272041'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 855 | PG 272107 | IDLAN 3845533
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    42,
    '2022-11-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272107'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272107'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 856 | PG 272435 | IDLAN 4932130
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    97,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272435'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272435'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 857 | PG 272756 | IDLAN 5178683
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    52.1,
    '2025-06-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272756'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272756'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 858 | PG 272842 | IDLAN 5664641
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450.4,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272842'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272842'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 859 | PG 272842 | IDLAN 5664643
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60.65,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '272842'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '272842'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 860 | PG 273083 | IDLAN 4248363
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    96.67,
    '2023-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273083'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273083'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 861 | PG 273083 | IDLAN 4501353
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    220.25,
    '2024-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273083'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273083'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 862 | PG 273597 | IDLAN 5481264
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    552.42,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273597'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273597'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 863 | PG 273623 | IDLAN 5779305
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    99,
    '2026-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273623'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273623'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 864 | PG 273637 | IDLAN 4390982
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    15.95,
    '2024-01-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273637'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273637'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 865 | PG 273637 | IDLAN 4394159
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    136.46,
    '2024-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273637'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273637'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 866 | PG 273637 | IDLAN 4975980
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    173.03,
    '2025-02-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273637'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273637'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 867 | PG 273685 | IDLAN 4074127
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    473.4,
    '2023-05-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273685'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273685'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 868 | PG 273708 | IDLAN 4873020
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16,
    '2024-12-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273708'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273708'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 869 | PG 273979 | IDLAN 4132350
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    696,
    '2023-06-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273979'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273979'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 870 | PG 273979 | IDLAN 4144072
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    230.44,
    '2023-07-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273979'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273979'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 871 | PG 273988 | IDLAN 4086208
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.09,
    '2023-06-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273988'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273988'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 872 | PG 273989 | IDLAN 4026971
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2023-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '273989'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273989'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 873 | PG 274052 | IDLAN 5347834
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    477.54,
    '2025-10-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274052'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274052'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 874 | PG 274057 | IDLAN 4020137
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50.4,
    '2023-04-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274057'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274057'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 875 | PG 274085 | IDLAN 4085175
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50.4,
    '2023-06-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274085'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274085'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 876 | PG 274111 | IDLAN 4321742
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    428.2,
    '2023-12-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274111'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274111'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 877 | PG 274120 | IDLAN 3934526
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    159,
    '2023-02-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274120'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274120'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 878 | PG 274445 | IDLAN 4184591
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    21.57,
    '2023-08-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274445'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274445'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 879 | PG 274626 | IDLAN 4874750
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-12-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274626'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274626'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 880 | PG 274850 | IDLAN 5102234
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    27,
    '2025-04-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274850'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274850'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 881 | PG 274972 | IDLAN 5076806
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    326.3,
    '2025-03-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '274972'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274972'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 882 | PG 275047 | IDLAN 4079874
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-05-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275047'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275047'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 883 | PG 275106 | IDLAN 4742939
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60.1,
    '2024-09-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275106'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275106'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 884 | PG 275134 | IDLAN 4530695
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    527.68,
    '2024-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275134'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275134'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 885 | PG 275302 | IDLAN 5202747
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-06-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275302'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275302'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 886 | PG 275325 | IDLAN 4778528
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    115.92,
    '2024-09-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275325'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275325'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 887 | PG 275339 | IDLAN 4572247
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    75.73,
    '2024-05-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275339'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275339'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 888 | PG 275373 | IDLAN 4664140
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    40,
    '2024-07-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275373'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275373'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 889 | PG 275451 | IDLAN 4294308
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8.04,
    '2023-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 890 | PG 275451 | IDLAN 4306439
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118.75,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 891 | PG 275471 | IDLAN 4031698
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104,
    '2023-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275471'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275471'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 892 | PG 275487 | IDLAN 4206920
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26.1,
    '2023-08-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275487'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275487'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 893 | PG 275541 | IDLAN 5481265
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    230,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275541'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275541'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 894 | PG 275593 | IDLAN 5664611
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1602.2,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275593'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275593'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 895 | PG 275635 | IDLAN 4234041
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    443.4,
    '2023-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275635'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275635'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 896 | PG 275701 | IDLAN 3956407
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    35,
    '2023-02-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275701'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275701'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 897 | PG 275795 | IDLAN 4077495
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    278.5,
    '2023-05-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275795'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275795'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 898 | PG 275795 | IDLAN 4311347
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    171.5,
    '2023-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275795'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275795'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 899 | PG 275795 | IDLAN 5335406
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    242,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275795'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275795'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 900 | PG 275833 | IDLAN 4256917
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    212.27,
    '2023-10-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '275833'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275833'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 901 | PG 276068 | IDLAN 5189870
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    215.6,
    '2025-06-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 902 | PG 276217 | IDLAN 5775174
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76,
    '2026-06-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 903 | PG 276226 | IDLAN 5340785
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2025-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276226'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276226'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 904 | PG 276354 | IDLAN 5247458
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5,
    '2025-07-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276354'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276354'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 905 | PG 276380 | IDLAN 5337192
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    99,
    '2025-09-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276380'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276380'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 906 | PG 276380 | IDLAN 5383827
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    26,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276380'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276380'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 907 | PG 276380 | IDLAN 5383850
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    97,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276380'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276380'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 908 | PG 276419 | IDLAN 5995723
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    79.44,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276419'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276419'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 909 | PG 276562 | IDLAN 4570916
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2024-05-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276562'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276562'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 910 | PG 276830 | IDLAN 4447249
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    148.68,
    '2024-02-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '276830'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276830'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 911 | PG 277082 | IDLAN 5709444
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.25,
    '2026-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '277082'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277082'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 912 | PG 277202 | IDLAN 4903646
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    9,
    '2024-12-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '277202'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277202'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 913 | PG 277285 | IDLAN 4079329
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2023-05-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '277285'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277285'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 914 | PG 279971 | IDLAN 4797892
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.93,
    '2024-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279971'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279971'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 915 | PG 277632 | IDLAN 4174696
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2023-07-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '277632'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277632'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 916 | PG 277727 | IDLAN 5249522
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    136,
    '2025-07-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '277727'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277727'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 917 | PG 270552 | IDLAN 4011184
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    999,
    '2023-04-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270552'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270552'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 918 | PG 278283 | IDLAN 4549173
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.3,
    '2024-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '278283'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278283'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 919 | PG 278307 | IDLAN 4640700
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    207,
    '2024-06-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '278307'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278307'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 920 | PG 278307 | IDLAN 5335486
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    310,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '278307'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278307'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 921 | PG 278510 | IDLAN 4550576
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4.1,
    '2024-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '278510'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278510'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 922 | PG 278948 | IDLAN 4939677
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19.1,
    '2025-01-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '278948'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278948'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 923 | PG 279213 | IDLAN 4257464
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    116.55,
    '2023-10-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279213'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279213'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 924 | PG 279394 | IDLAN 5982677
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-08-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279394'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279394'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 925 | PG 279420 | IDLAN 5664602
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    350,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279420'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279420'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 926 | PG 279457 | IDLAN 4613142
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    111.3,
    '2024-06-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279457'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279457'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 927 | PG 279678 | IDLAN 4294078
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2023-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279678'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279678'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 928 | PG 279678 | IDLAN 4294051
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    496.4,
    '2023-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279678'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279678'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 929 | PG 279781 | IDLAN 5971611
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    263.52,
    '2026-08-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279781'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279781'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 930 | PG 279781 | IDLAN 5971621
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    268,
    '2026-08-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279781'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279781'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 931 | PG 279910 | IDLAN 4316982
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    70.62,
    '2023-11-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '279910'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '279910'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 932 | PG 280001 | IDLAN 4324078
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    139.76,
    '2023-12-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280001'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280001'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 933 | PG 280090 | IDLAN 4082853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    306.74,
    '2023-05-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280090'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280090'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 934 | PG 280309 | IDLAN 4951140
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    256.5,
    '2025-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280309'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280309'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 935 | PG 280309 | IDLAN 4951145
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2025-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280309'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280309'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 936 | PG 280423 | IDLAN 5080630
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    321.32,
    '2025-03-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280423'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280423'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 937 | PG 280497 | IDLAN 4949115
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    55,
    '2025-01-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280497'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280497'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 938 | PG 280501 | IDLAN 4570933
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2024-05-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280501'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280501'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 939 | PG 280686 | IDLAN 5939431
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    88.4,
    '2026-08-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280686'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280686'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 940 | PG 280893 | IDLAN 5664638
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    527.68,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280893'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280893'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 941 | PG 280893 | IDLAN 4990887
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    143,
    '2025-02-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280893'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280893'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 942 | PG 280984 | IDLAN 4509270
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    295,
    '2024-03-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280984'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280984'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 943 | PG 280984 | IDLAN 4510269
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    214.3,
    '2024-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '280984'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280984'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 944 | PG 281725 | IDLAN 4234513
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    223.4,
    '2023-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '281725'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '281725'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 945 | PG 282103 | IDLAN 4870836
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    500,
    '2024-12-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282103'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282103'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 946 | PG 282158 | IDLAN 4192983
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    143.75,
    '2023-08-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282158'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282158'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 947 | PG 282182 | IDLAN 5302532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    531,
    '2025-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282182'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282182'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 948 | PG 282320 | IDLAN 4189118
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    285,
    '2023-08-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282320'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282320'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 949 | PG 282584 | IDLAN 6064448
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    237,
    '2026-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282584'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282584'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 950 | PG 282598 | IDLAN 5269740
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    89.9,
    '2025-08-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282598'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282598'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 951 | PG 282598 | IDLAN 5273398
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    96.9,
    '2025-08-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282598'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282598'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 952 | PG 282614 | IDLAN 4511853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    368.55,
    '2024-04-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282614'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282614'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 953 | PG 282617 | IDLAN 4194811
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1200,
    '2023-08-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282617'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282617'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 954 | PG 282686 | IDLAN 4306661
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2023-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282686'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282686'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 955 | PG 282725 | IDLAN 4618445
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76.5,
    '2024-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282725'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282725'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 956 | PG 282725 | IDLAN 4618448
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    357.7,
    '2024-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282725'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282725'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 957 | PG 282744 | IDLAN 4329127
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    693.9,
    '2023-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282744'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282744'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 958 | PG 282881 | IDLAN 5759319
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    78,
    '2026-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282881'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282881'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 959 | PG 282891 | IDLAN 4218867
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    339.3,
    '2023-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282891'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282891'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 960 | PG 282896 | IDLAN 5888373
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    422,
    '2026-08-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '282896'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282896'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 961 | PG 283047 | IDLAN 4630571
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    128.82,
    '2024-06-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '283047'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283047'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 962 | PG 283146 | IDLAN 4530974
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.65,
    '2024-04-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '283146'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283146'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 963 | PG 283503 | IDLAN 5254284
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2025-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '283503'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283503'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 964 | PG 283602 | IDLAN 5325604
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    48.35,
    '2025-09-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '283602'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283602'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 965 | PG 284030 | IDLAN 4284802
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16.31,
    '2023-11-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284030'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284030'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 966 | PG 284030 | IDLAN 4291199
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    260,
    '2023-11-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284030'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284030'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 967 | PG 284206 | IDLAN 5943467
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    816.12,
    '2026-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284206'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284206'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 968 | PG 284272 | IDLAN 4533300
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66.04,
    '2024-04-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284272'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284272'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 969 | PG 284272 | IDLAN 5943641
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    492,
    '2026-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284272'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284272'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 970 | PG 284272 | IDLAN 6025697
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    630,
    '2026-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284272'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284272'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 971 | PG 284376 | IDLAN 4671179
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    227.1,
    '2024-07-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284376'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284376'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 972 | PG 284553 | IDLAN 5633175
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    68,
    '2026-03-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284553'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284553'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 973 | PG 284711 | IDLAN 6065656
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    139,
    '2026-10-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284711'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284711'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 974 | PG 284711 | IDLAN 6065659
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74,
    '2026-10-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284711'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284711'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 975 | PG 284853 | IDLAN 5391339
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    13,
    '2025-11-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '284853'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '284853'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 976 | PG 285053 | IDLAN 4599270
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.26,
    '2024-05-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285053'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285053'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 977 | PG 285157 | IDLAN 4556816
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2024-04-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285157'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285157'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 978 | PG 285435 | IDLAN 4599099
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    539,
    '2024-05-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285435'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285435'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 979 | PG 285482 | IDLAN 4248840
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2023-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285482'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285482'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 980 | PG 285635 | IDLAN 4524308
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2024-04-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285635'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285635'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 981 | PG 285645 | IDLAN 5355056
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285645'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285645'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 982 | PG 285752 | IDLAN 5043616
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2025-03-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285752'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285752'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 983 | PG 285813 | IDLAN 4590146
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    530,
    '2024-05-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '285813'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285813'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 984 | PG 286297 | IDLAN 4813707
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    416.1,
    '2024-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286297'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286297'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 985 | PG 286402 | IDLAN 4441043
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    293.17,
    '2024-02-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286402'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286402'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 986 | PG 286402 | IDLAN 4931560
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    345.8,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286402'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286402'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 987 | PG 286402 | IDLAN 4931563
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76.19,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286402'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286402'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 988 | PG 286483 | IDLAN 4931539
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    104.03,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286483'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286483'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 989 | PG 303323 | IDLAN 4972483
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-01-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303323'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303323'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 990 | PG 286664 | IDLAN 5968605
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    687,
    '2026-08-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 991 | PG 286664 | IDLAN 5968614
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118.75,
    '2026-08-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 992 | PG 286664 | IDLAN 5968625
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    497.42,
    '2026-08-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286664'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286664'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 993 | PG 286990 | IDLAN 5318757
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22.54,
    '2025-09-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '286990'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '286990'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 994 | PG 287056 | IDLAN 4864944
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    17,
    '2024-11-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287056'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287056'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 995 | PG 287273 | IDLAN 4613123
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    17.1,
    '2024-06-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287273'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287273'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 996 | PG 287578 | IDLAN 5239306
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    101,
    '2025-07-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287578'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287578'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 997 | PG 287715 | IDLAN 5176869
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    136,
    '2025-06-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287715'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287715'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 998 | PG 287715 | IDLAN 5777815
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287715'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287715'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 999 | PG 287786 | IDLAN 4841119
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    220,
    '2024-11-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287786'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287786'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1000 | PG 155259 | IDLAN 4793771
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    983.4,
    '2024-10-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '155259'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '155259'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1001 | PG 287997 | IDLAN 4935693
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    65.7,
    '2025-01-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287997'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287997'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1002 | PG 287997 | IDLAN 4947093
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126,
    '2025-01-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '287997'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287997'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1003 | PG 288072 | IDLAN 5700363
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    25.46,
    '2026-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288072'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288072'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1004 | PG 288072 | IDLAN 6027799
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    153.72,
    '2026-09-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288072'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288072'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1005 | PG 288116 | IDLAN 5767673
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    110,
    '2026-06-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288116'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288116'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1006 | PG 290634 | IDLAN 5788213
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    163.2,
    '2026-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290634'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290634'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1007 | PG 288293 | IDLAN 5664640
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    230,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288293'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288293'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1008 | PG 288412 | IDLAN 5489223
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1194,
    '2026-01-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288412'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288412'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1009 | PG 288884 | IDLAN 4449706
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    8.8,
    '2024-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288884'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288884'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1010 | PG 289098 | IDLAN 4727617
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    43,
    '2024-08-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289098'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289098'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1011 | PG 289234 | IDLAN 4465326
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1207.8,
    '2024-03-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289234'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289234'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1012 | PG 289298 | IDLAN 4715143
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    224,
    '2024-08-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289298'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289298'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1013 | PG 289393 | IDLAN 4929617
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    91,
    '2025-01-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289393'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289393'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1014 | PG 289416 | IDLAN 4457647
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2024-03-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289416'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289416'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1015 | PG 289702 | IDLAN 4758960
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    428,
    '2024-09-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289702'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289702'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1016 | PG 289787 | IDLAN 5814079
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1147,
    '2026-07-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289787'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289787'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1017 | PG 289804 | IDLAN 5189852
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    970.55,
    '2025-06-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '289804'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '289804'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1018 | PG 290175 | IDLAN 4502215
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    244.15,
    '2024-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290175'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290175'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1019 | PG 290231 | IDLAN 4693480
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    209,
    '2024-07-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290231'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290231'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1020 | PG 290287 | IDLAN 5134398
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    157.96,
    '2025-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290287'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290287'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1021 | PG 290304 | IDLAN 4931544
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76.19,
    '2025-01-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290304'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290304'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1022 | PG 290391 | IDLAN 5152753
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    812.25,
    '2025-05-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290391'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290391'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1023 | PG 290427 | IDLAN 5314028
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    440,
    '2025-09-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290427'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290427'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1024 | PG 290673 | IDLAN 4664387
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118.65,
    '2024-07-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290673'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290673'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1025 | PG 290771 | IDLAN 4713919
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    326,
    '2024-08-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290771'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290771'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1026 | PG 290860 | IDLAN 4520270
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    57.12,
    '2024-04-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290860'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290860'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1027 | PG 290962 | IDLAN 5134356
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    543,
    '2025-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290962'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290962'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1028 | PG 290962 | IDLAN 5174143
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    118,
    '2025-06-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '290962'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290962'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1029 | PG 291025 | IDLAN 5261090
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    427,
    '2025-08-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291025'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291025'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1030 | PG 291353 | IDLAN 5481143
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    925,
    '2025-12-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291353'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291353'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1031 | PG 291614 | IDLAN 4640807
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    269.5,
    '2024-06-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291614'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291614'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1032 | PG 291883 | IDLAN 5205909
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    532,
    '2025-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291883'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291883'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1033 | PG 291883 | IDLAN 5713799
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    114,
    '2026-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291883'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291883'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1034 | PG 291911 | IDLAN 4455302
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    550.2,
    '2024-02-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '291911'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '291911'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1035 | PG 292262 | IDLAN 5426060
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    394,
    '2025-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '292262'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292262'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1036 | PG 292894 | IDLAN 5336690
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    353.4,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '292894'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292894'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1037 | PG 292990 | IDLAN 5355841
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    284,
    '2025-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '292990'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292990'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1038 | PG 292990 | IDLAN 5358790
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    101,
    '2025-10-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '292990'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292990'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1039 | PG 293330 | IDLAN 4888527
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    80,
    '2024-12-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293330'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293330'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1040 | PG 293414 | IDLAN 5481269
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    283.5,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293414'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293414'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1041 | PG 293552 | IDLAN 4656312
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    273,
    '2024-07-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293552'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293552'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1042 | PG 293633 | IDLAN 4885595
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    460,
    '2024-12-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293633'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293633'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1043 | PG 293708 | IDLAN 5312682
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    116,
    '2025-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293708'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293708'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1044 | PG 293908 | IDLAN 5049061
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    94,
    '2025-03-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293908'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293908'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1045 | PG 293929 | IDLAN 5318767
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2025-09-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293929'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293929'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1046 | PG 293944 | IDLAN 5213743
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    228,
    '2025-07-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293944'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293944'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1047 | PG 293953 | IDLAN 4656364
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    400,
    '2024-07-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '293953'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '293953'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1048 | PG 294095 | IDLAN 4602855
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    172.7,
    '2024-06-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294095'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294095'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1049 | PG 294695 | IDLAN 4478311
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16.4,
    '2024-03-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294695'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294695'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1050 | PG 294745 | IDLAN 5027124
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    117.18,
    '2025-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294745'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294745'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1051 | PG 294745 | IDLAN 5027127
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    350,
    '2025-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294745'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294745'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1052 | PG 294957 | IDLAN 4656118
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4264,
    '2024-05-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '294957'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294957'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1053 | PG 295267 | IDLAN 5355975
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    127,
    '2025-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295267'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295267'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1054 | PG 295382 | IDLAN 5228285
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    102,
    '2025-07-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295382'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295382'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1055 | PG 295406 | IDLAN 5163557
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    68,
    '2025-05-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295406'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295406'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1056 | PG 295503 | IDLAN 6063110
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    802.84,
    '2026-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295503'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295503'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1057 | PG 295731 | IDLAN 5664627
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    611,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295731'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295731'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1058 | PG 295957 | IDLAN 5064017
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    756,
    '2025-03-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '295957'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '295957'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1059 | PG 296020 | IDLAN 5012982
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    437,
    '2025-02-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '296020'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '296020'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1060 | PG 328053 | IDLAN 5999345
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    604,
    '2026-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '328053'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '328053'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1061 | PG 297182 | IDLAN 5664615
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1191,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '297182'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '297182'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1062 | PG 298254 | IDLAN 4769651
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2024-09-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298254'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298254'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1063 | PG 298522 | IDLAN 4867911
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    64,
    '2024-11-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298522'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298522'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1064 | PG 298531 | IDLAN 4954652
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.17,
    '2025-01-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298531'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298531'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1065 | PG 298586 | IDLAN 4841209
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    300,
    '2024-11-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298586'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298586'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1066 | PG 298639 | IDLAN 4580684
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-05-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298639'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298639'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1067 | PG 298698 | IDLAN 5069573
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    494,
    '2025-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1068 | PG 298698 | IDLAN 5069593
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    37,
    '2025-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1069 | PG 298698 | IDLAN 6070169
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2542.5,
    '2026-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1070 | PG 298698 | IDLAN 6070179
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3253.5,
    '2026-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298698'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298698'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1071 | PG 298801 | IDLAN 5864466
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    339,
    '2026-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298801'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298801'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1072 | PG 298969 | IDLAN 6063321
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    368.37,
    '2026-10-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298969'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298969'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1073 | PG 298969 | IDLAN 6063325
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    368.37,
    '2026-10-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '298969'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '298969'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1074 | PG 299024 | IDLAN 5104548
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    144,
    '2025-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299024'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299024'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1075 | PG 299072 | IDLAN 5341060
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    321.75,
    '2025-09-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299072'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299072'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1076 | PG 299212 | IDLAN 4691677
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    45,
    '2024-07-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299212'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299212'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1077 | PG 299264 | IDLAN 4740762
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    212.8,
    '2024-08-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299264'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299264'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1078 | PG 299284 | IDLAN 5819570
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-07-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299284'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299284'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1079 | PG 299480 | IDLAN 4538856
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    776,
    '2024-04-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299480'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299480'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1080 | PG 299555 | IDLAN 5413038
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    133,
    '2025-11-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299555'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299555'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1081 | PG 299650 | IDLAN 5255005
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19,
    '2025-07-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299650'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299650'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1082 | PG 300374 | IDLAN 5251692
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    198,
    '2025-07-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '300374'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '300374'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1083 | PG 300610 | IDLAN 4672472
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    326,
    '2024-07-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '300610'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '300610'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1084 | PG 300760 | IDLAN 5186444
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    628,
    '2025-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '300760'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '300760'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1085 | PG 301263 | IDLAN 5020646
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    331,
    '2025-02-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301263'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301263'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1086 | PG 301263 | IDLAN 5335392
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1195,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301263'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301263'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1087 | PG 301367 | IDLAN 5284702
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    221,
    '2025-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301367'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301367'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1088 | PG 301367 | IDLAN 5284705
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    315,
    '2025-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301367'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301367'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1089 | PG 301367 | IDLAN 5284716
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    135,
    '2025-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301367'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301367'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1090 | PG 301518 | IDLAN 5593032
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-02-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301518'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301518'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1091 | PG 301587 | IDLAN 5651461
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    116.1,
    '2026-03-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301587'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301587'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1092 | PG 301726 | IDLAN 4968447
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    41.2,
    '2025-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '301726'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '301726'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1093 | PG 302068 | IDLAN 5142420
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    419,
    '2025-05-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1094 | PG 302068 | IDLAN 5725479
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    70,
    '2026-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302068'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302068'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1095 | PG 302366 | IDLAN 5306913
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    150,
    '2025-09-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302366'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302366'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1096 | PG 302511 | IDLAN 5817306
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4,
    '2026-07-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302511'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302511'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1097 | PG 302543 | IDLAN 5938126
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2766,
    '2026-08-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302543'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302543'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1098 | PG 302543 | IDLAN 5938135
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    988,
    '2026-08-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302543'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302543'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1099 | PG 302689 | IDLAN 5377600
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    165,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302689'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302689'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1100 | PG 302689 | IDLAN 5377606
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    203,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302689'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302689'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1101 | PG 302980 | IDLAN 4824933
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    209.48,
    '2024-10-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '302980'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '302980'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1102 | PG 299065 | IDLAN 6024811
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    192.76,
    '2026-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299065'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299065'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1103 | PG 299065 | IDLAN 6024808
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    88.58,
    '2026-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '299065'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299065'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1104 | PG 303170 | IDLAN 5377638
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    209,
    '2025-10-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303170'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303170'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1105 | PG 303175 | IDLAN 5372494
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    312,
    '2025-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303175'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303175'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1106 | PG 303290 | IDLAN 4696162
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-07-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303290'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303290'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1107 | PG 303297 | IDLAN 5397243
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    121,
    '2025-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303297'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303297'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1108 | PG 303315 | IDLAN 4770876
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1361.6,
    '2024-09-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303315'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303315'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1109 | PG 303357 | IDLAN 5296159
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    602,
    '2025-08-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303357'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303357'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1110 | PG 303506 | IDLAN 5186454
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126,
    '2025-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303506'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303506'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1111 | PG 303712 | IDLAN 5428796
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    439,
    '2025-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303712'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303712'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1112 | PG 303740 | IDLAN 4888111
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    43.1,
    '2024-12-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303740'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303740'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1113 | PG 303790 | IDLAN 5322417
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1166,
    '2025-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303790'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303790'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1114 | PG 303790 | IDLAN 5322419
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    532,
    '2025-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '303790'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '303790'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1115 | PG 304258 | IDLAN 5915553
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    16,
    '2026-08-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304258'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304258'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1116 | PG 304269 | IDLAN 5224283
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    174,
    '2025-07-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304269'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304269'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1117 | PG 304495 | IDLAN 5170014
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    266,
    '2025-06-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304495'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304495'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1118 | PG 304650 | IDLAN 5688846
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    316,
    '2026-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304650'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304650'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1119 | PG 304873 | IDLAN 5198526
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    243,
    '2025-06-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304873'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304873'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1120 | PG 304892 | IDLAN 5725876
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    22.54,
    '2026-05-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304892'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304892'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1121 | PG 314657 | IDLAN 4915789
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-01-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314657'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314657'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1122 | PG 305303 | IDLAN 5690768
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2449.1,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305303'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305303'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1123 | PG 305451 | IDLAN 5596855
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    243.2,
    '2026-02-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1124 | PG 305585 | IDLAN 5709280
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30,
    '2026-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305585'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305585'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1125 | PG 305763 | IDLAN 5102287
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    220,
    '2025-04-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305763'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305763'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1126 | PG 305780 | IDLAN 4884817
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    256,
    '2024-12-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305780'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305780'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1127 | PG 305892 | IDLAN 5266532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    28.5,
    '2025-08-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305892'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305892'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1128 | PG 305892 | IDLAN 5678992
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.85,
    '2026-04-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305892'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305892'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1129 | PG 305954 | IDLAN 5353943
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12,
    '2025-10-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '305954'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '305954'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1130 | PG 306210 | IDLAN 5769748
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108,
    '2026-06-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '306210'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '306210'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1131 | PG 306454 | IDLAN 5385405
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1055,
    '2025-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '306454'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '306454'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1132 | PG 306691 | IDLAN 6033103
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    192,
    '2026-09-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '306691'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '306691'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1133 | PG 306691 | IDLAN 6032680
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    216,
    '2026-09-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '306691'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '306691'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1134 | PG 307003 | IDLAN 5257629
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    628,
    '2025-07-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307003'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307003'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1135 | PG 307209 | IDLAN 5768051
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    116.88,
    '2026-06-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307209'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307209'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1136 | PG 307398 | IDLAN 5104735
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    660,
    '2025-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307398'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307398'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1137 | PG 307532 | IDLAN 5297701
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    525,
    '2025-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307532'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307532'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1138 | PG 307596 | IDLAN 5041906
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    313.5,
    '2025-03-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307596'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307596'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1139 | PG 307829 | IDLAN 5613430
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    250,
    '2026-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307829'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307829'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1140 | PG 307834 | IDLAN 5664625
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    64,
    '2026-03-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307834'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307834'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1141 | PG 307870 | IDLAN 5742251
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    190,
    '2026-05-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307870'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307870'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1142 | PG 307938 | IDLAN 5563190
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    132,
    '2026-02-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307938'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307938'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1143 | PG 307938 | IDLAN 5779593
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2026-06-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '307938'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '307938'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1144 | PG 308043 | IDLAN 5520905
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2026-01-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308043'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308043'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1145 | PG 308048 | IDLAN 4835135
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-11-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308048'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308048'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1146 | PG 308084 | IDLAN 4741834
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2024-08-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308084'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308084'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1147 | PG 308288 | IDLAN 5190174
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    133,
    '2025-06-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308288'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308288'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1148 | PG 308815 | IDLAN 5383497
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    148,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308815'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308815'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1149 | PG 308815 | IDLAN 5708404
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    224,
    '2026-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308815'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308815'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1150 | PG 308815 | IDLAN 6062720
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1072,
    '2026-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '308815'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '308815'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1151 | PG 309032 | IDLAN 5362851
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-10-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '309032'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '309032'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1152 | PG 309105 | IDLAN 5865280
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    372,
    '2026-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '309105'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '309105'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1153 | PG 309467 | IDLAN 5996065
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    826,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '309467'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '309467'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1154 | PG 310254 | IDLAN 4839155
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2024-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310254'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310254'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1155 | PG 310612 | IDLAN 5740457
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126.35,
    '2026-05-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310612'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310612'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1156 | PG 310746 | IDLAN 5397356
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-11-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310746'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310746'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1157 | PG 310905 | IDLAN 5001011
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    205,
    '2025-02-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310905'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310905'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1158 | PG 311003 | IDLAN 4994040
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    87,
    '2025-02-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '311003'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '311003'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1159 | PG 311114 | IDLAN 5665741
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-03-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '311114'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '311114'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1160 | PG 311300 | IDLAN 5660519
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    707,
    '2026-03-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '311300'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '311300'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1161 | PG 311424 | IDLAN 4974014
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-01-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '311424'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '311424'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1162 | PG 312041 | IDLAN 5395822
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    19.25,
    '2025-11-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '312041'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '312041'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1163 | PG 312051 | IDLAN 5393605
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    119.7,
    '2025-11-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '312051'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '312051'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1164 | PG 312461 | IDLAN 5104599
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4.46,
    '2025-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '312461'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '312461'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1165 | PG 312523 | IDLAN 5192814
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108,
    '2025-06-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '312523'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '312523'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1166 | PG 312921 | IDLAN 5024742
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2025-02-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '312921'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '312921'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1167 | PG 313304 | IDLAN 6032033
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5,
    '2026-09-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '313304'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '313304'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1168 | PG 313896 | IDLAN 5172948
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-06-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '313896'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '313896'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1169 | PG 314110 | IDLAN 5481310
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    752,
    '2025-12-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314110'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314110'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1170 | PG 314217 | IDLAN 6054665
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    742,
    '2026-10-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314217'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314217'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1171 | PG 314308 | IDLAN 5121041
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    20,
    '2025-04-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314308'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314308'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1172 | PG 314519 | IDLAN 4894561
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    64,
    '2024-12-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314519'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314519'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1173 | PG 314519 | IDLAN 4894562
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    128,
    '2024-12-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314519'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314519'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1174 | PG 314746 | IDLAN 5022732
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-02-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314746'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314746'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1175 | PG 314921 | IDLAN 5520258
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2026-01-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314921'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314921'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1176 | PG 314957 | IDLAN 5086831
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    43.26,
    '2025-04-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '314957'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '314957'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1177 | PG 315325 | IDLAN 4891346
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    126,
    '2024-12-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '315325'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '315325'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1178 | PG 315786 | IDLAN 5779308
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    282.4,
    '2026-06-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '315786'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '315786'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1179 | PG 316165 | IDLAN 5736288
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '316165'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '316165'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1180 | PG 316951 | IDLAN 5269864
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    257,
    '2025-08-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '316951'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '316951'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1181 | PG 316951 | IDLAN 5314335
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    36,
    '2025-09-09',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '316951'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '316951'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1182 | PG 316968 | IDLAN 5031254
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-02-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '316968'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '316968'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1183 | PG 317077 | IDLAN 5312516
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    230.65,
    '2025-09-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317077'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317077'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1184 | PG 317452 | IDLAN 5612076
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    566,
    '2026-02-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317452'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317452'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1185 | PG 317563 | IDLAN 5736981
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    441.09,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317563'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317563'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1186 | PG 317700 | IDLAN 5404756
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    115,
    '2025-11-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317700'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317700'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1187 | PG 317757 | IDLAN 5317471
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-09-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317757'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317757'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1188 | PG 318245 | IDLAN 5614861
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    202,
    '2026-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318245'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318245'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1189 | PG 318245 | IDLAN 5616004
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    68,
    '2026-03-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318245'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318245'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1190 | PG 318439 | IDLAN 5117056
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108.8,
    '2025-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318439'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318439'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1191 | PG 318439 | IDLAN 5117071
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    108.8,
    '2025-04-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318439'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318439'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1192 | PG 318537 | IDLAN 5121491
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    165,
    '2025-04-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318537'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318537'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1193 | PG 318569 | IDLAN 5384183
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    333,
    '2025-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318569'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318569'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1194 | PG 318885 | IDLAN 5614667
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    556,
    '2026-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '318885'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '318885'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1195 | PG 319002 | IDLAN 5942606
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4996,
    '2026-08-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '319002'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '319002'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1196 | PG 319116 | IDLAN 5403457
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    110,
    '2025-11-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '319116'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '319116'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1197 | PG 319558 | IDLAN 5119007
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-04-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '319558'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '319558'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1198 | PG 320422 | IDLAN 5609532
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3.39,
    '2026-02-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '320422'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '320422'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1199 | PG 320440 | IDLAN 5080340
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-03-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '320440'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '320440'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1200 | PG 320465 | IDLAN 5535142
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    210,
    '2026-01-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '320465'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '320465'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1201 | PG 320834 | IDLAN 5866491
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    548.76,
    '2026-07-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '320834'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '320834'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1202 | PG 321693 | IDLAN 5808190
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    5,
    '2026-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '321693'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '321693'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1203 | PG 322502 | IDLAN 5759682
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    133,
    '2026-06-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '322502'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '322502'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1204 | PG 323094 | IDLAN 5798430
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    10,
    '2026-06-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323094'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323094'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1205 | PG 323190 | IDLAN 5397248
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2036,
    '2025-11-07',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323190'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323190'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1206 | PG 323299 | IDLAN 5759301
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    348.74,
    '2026-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323299'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323299'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1207 | PG 323345 | IDLAN 5336510
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    133,
    '2025-09-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323345'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323345'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1208 | PG 323914 | IDLAN 5976451
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    225,
    '2026-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323914'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323914'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1209 | PG 323914 | IDLAN 5976454
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    279,
    '2026-08-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '323914'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '323914'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1210 | PG 324219 | IDLAN 5961690
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    375,
    '2026-08-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '324219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '324219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1211 | PG 324219 | IDLAN 5996354
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    757.62,
    '2026-09-03',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '324219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '324219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1212 | PG 324219 | IDLAN 5961720
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    610.72,
    '2026-08-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '324219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '324219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1213 | PG 324575 | IDLAN 6029821
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60.14,
    '2026-09-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '324575'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '324575'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1214 | PG 324701 | IDLAN 5596365
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    101,
    '2026-02-24',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '324701'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '324701'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1215 | PG 325037 | IDLAN 5838860
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-07-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325037'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325037'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1216 | PG 325187 | IDLAN 5395120
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    102,
    '2025-11-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325187'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325187'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1217 | PG 325213 | IDLAN 5736884
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66.5,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325213'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325213'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1218 | PG 325216 | IDLAN 5428896
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2025-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1219 | PG 325486 | IDLAN 5338238
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    87.65,
    '2025-09-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325486'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325486'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1220 | PG 325791 | IDLAN 5666543
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    12,
    '2026-03-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325791'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325791'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1221 | PG 325963 | IDLAN 6064426
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    76.86,
    '2026-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325963'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325963'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1222 | PG 326099 | IDLAN 5409992
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    72,
    '2025-11-18',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326099'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326099'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1223 | PG 326219 | IDLAN 5394434
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    120,
    '2025-11-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326219'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326219'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1224 | PG 326543 | IDLAN 5561290
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326543'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326543'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1225 | PG 326773 | IDLAN 5633025
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    42,
    '2026-03-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326773'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326773'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1226 | PG 326863 | IDLAN 5560113
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1846,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326863'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326863'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1227 | PG 327228 | IDLAN 5428904
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    528.81,
    '2025-11-28',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '327228'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '327228'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1228 | PG 327647 | IDLAN 5759669
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    500,
    '2026-06-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '327647'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '327647'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1229 | PG 325216 | IDLAN 5987313
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    27.81,
    '2026-08-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '325216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '325216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1230 | PG 328475 | IDLAN 5317210
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    74,
    '2025-09-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '328475'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '328475'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1231 | PG 333058 | IDLAN 5561253
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    218,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '333058'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '333058'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1232 | PG 328571 | IDLAN 5292670
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30,
    '2025-08-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '328571'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '328571'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1233 | PG 328675 | IDLAN 5775694
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    70,
    '2026-06-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '328675'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '328675'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1234 | PG 328792 | IDLAN 5500634
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    90,
    '2026-01-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '328792'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '328792'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1235 | PG 329432 | IDLAN 5440515
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.04,
    '2025-12-05',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '329432'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '329432'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1236 | PG 329613 | IDLAN 5774836
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    66.5,
    '2026-06-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '329613'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '329613'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1237 | PG 329615 | IDLAN 5560415
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2026-02-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '329615'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '329615'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1238 | PG 330930 | IDLAN 5838191
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    88,
    '2026-07-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '330930'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '330930'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1239 | PG 331274 | IDLAN 5372444
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2025-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '331274'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331274'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1240 | PG 331304 | IDLAN 5349455
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    250,
    '2025-10-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '331304'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331304'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1241 | PG 331715 | IDLAN 6065590
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    123,
    '2026-10-23',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '331715'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331715'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1242 | PG 331904 | IDLAN 6026853
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    3.57,
    '2026-09-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '331904'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331904'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1243 | PG 332159 | IDLAN 5966371
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-08-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '332159'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332159'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1244 | PG 332268 | IDLAN 5748004
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    295,
    '2026-05-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '332268'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332268'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1245 | PG 332444 | IDLAN 5948362
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    70,
    '2026-08-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '332444'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332444'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1246 | PG 332703 | IDLAN 5655355
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    888,
    '2026-03-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '332703'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332703'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1247 | PG 332763 | IDLAN 5727249
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    554.8,
    '2026-05-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '332763'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '332763'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1248 | PG 333300 | IDLAN 5690574
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    2.8,
    '2026-04-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '333300'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '333300'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1249 | PG 333502 | IDLAN 5687533
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    123.5,
    '2026-04-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '333502'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '333502'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1250 | PG 333637 | IDLAN 5549573
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    158,
    '2026-02-04',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '333637'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '333637'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1251 | PG 334267 | IDLAN 5399793
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    30,
    '2025-11-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '334267'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '334267'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1252 | PG 334856 | IDLAN 5454024
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    29.8,
    '2025-12-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '334856'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '334856'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1253 | PG 335451 | IDLAN 5672136
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    450,
    '2026-04-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '335451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '335451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1254 | PG 335451 | IDLAN 6073530
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    712.8,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '335451'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '335451'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1255 | PG 335799 | IDLAN 5790749
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    0.4,
    '2026-06-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '335799'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '335799'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1256 | PG 336162 | IDLAN 5717509
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2026-04-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '336162'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '336162'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1257 | PG 336321 | IDLAN 5844036
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    291,
    '2026-07-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '336321'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '336321'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1258 | PG 336763 | IDLAN 5805053
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    237,
    '2026-06-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '336763'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '336763'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1259 | PG 336823 | IDLAN 5808093
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    48,
    '2026-06-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '336823'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '336823'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1260 | PG 336823 | IDLAN 5808465
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    134,
    '2026-06-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '336823'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '336823'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1261 | PG 337013 | IDLAN 5811718
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    140,
    '2026-07-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '337013'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '337013'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1262 | PG 337013 | IDLAN 5811780
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    140,
    '2026-07-01',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '337013'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '337013'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1263 | PG 337415 | IDLAN 5680802
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    50,
    '2026-04-08',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '337415'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '337415'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1264 | PG 337828 | IDLAN 5759288
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-05-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '337828'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '337828'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1265 | PG 338484 | IDLAN 5632548
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-03-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '338484'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '338484'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1266 | PG 338543 | IDLAN 5843810
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-07-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '338543'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '338543'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1267 | PG 339839 | IDLAN 6011663
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1624.5,
    '2026-09-15',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '339839'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '339839'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1268 | PG 340264 | IDLAN 6068087
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200.29,
    '2026-10-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '340264'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340264'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1269 | PG 340414 | IDLAN 5702778
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    4.29,
    '2026-04-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '340414'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340414'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1270 | PG 340614 | IDLAN 6018786
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    83,
    '2026-09-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '340614'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340614'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1271 | PG 340760 | IDLAN 6064643
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    200,
    '2026-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '340760'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340760'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1272 | PG 340881 | IDLAN 6062687
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    250,
    '2026-10-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '340881'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '340881'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1273 | PG 341515 | IDLAN 5887255
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    737.25,
    '2026-08-06',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '341515'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '341515'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1274 | PG 342134 | IDLAN 5735681
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    127.3,
    '2026-05-14',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '342134'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '342134'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1275 | PG 342294 | IDLAN 6027082
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    810,
    '2026-09-25',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '342294'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '342294'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1276 | PG 342588 | IDLAN 5791475
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-06-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '342588'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '342588'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1277 | PG 342859 | IDLAN 5699802
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    416,
    '2026-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '342859'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '342859'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1278 | PG 344308 | IDLAN 5791486
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-06-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '344308'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '344308'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1279 | PG 345747 | IDLAN 5865439
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    606,
    '2026-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '345747'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '345747'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1280 | PG 345760 | IDLAN 6064392
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1040,
    '2026-10-22',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '345760'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '345760'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1281 | PG 345947 | IDLAN 5901902
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    138,
    '2026-08-10',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '345947'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '345947'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1282 | PG 346099 | IDLAN 5951184
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-08-21',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '346099'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '346099'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1283 | PG 346216 | IDLAN 5982500
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    518.85,
    '2026-08-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '346216'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '346216'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1284 | PG 346432 | IDLAN 5791471
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    100,
    '2026-06-19',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '346432'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '346432'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1285 | PG 346591 | IDLAN 5809479
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    17.6,
    '2026-06-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '346591'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '346591'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1286 | PG 347749 | IDLAN 5836386
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    92.65,
    '2026-07-13',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '347749'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '347749'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1287 | PG 349182 | IDLAN 6061157
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    300,
    '2026-10-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '349182'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '349182'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1288 | PG 349615 | IDLAN 5947888
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    360,
    '2026-08-20',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '349615'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '349615'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1289 | PG 354257 | IDLAN 6054204
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    56.15,
    '2026-10-16',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '354257'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '354257'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1290 | PG 21554 | IDLAN 6070312
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    112.61,
    '2026-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '21554'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '21554'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1291 | PG 304643 | IDLAN 6070138
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    710,
    '2026-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304643'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304643'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1292 | PG 341408 | IDLAN 6070550
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1,
    '2026-10-27',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '341408'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '341408'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1293 | PG 9142 | IDLAN 6073461
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    244.28,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9142'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9142'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1294 | PG 32080 | IDLAN 6074097
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    41,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '32080'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '32080'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1295 | PG 21554 | IDLAN 6072898
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    556,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '21554'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '21554'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1296 | PG 288195 | IDLAN 6074000
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    278,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '288195'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288195'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1297 | PG 310311 | IDLAN 6073558
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    6587.11,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310311'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310311'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1298 | PG 310311 | IDLAN 6073578
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    326.8,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '310311'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '310311'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1299 | PG 326339 | IDLAN 6073592
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    140,
    '2026-10-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326339'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326339'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1300 | PG 9907 | IDLAN 6075706
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    432,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '9907'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '9907'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1301 | PG 304643 | IDLAN 6074591
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    84.81,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '304643'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '304643'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1302 | PG 317557 | IDLAN 6075733
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    1710,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317557'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317557'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1303 | PG 317557 | IDLAN 6075703
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '317557'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '317557'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1304 | PG 326089 | IDLAN 6074712
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    72.8,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '326089'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '326089'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1305 | PG 331463 | IDLAN 6074939
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    460,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '331463'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '331463'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1306 | PG 341339 | IDLAN 6075213
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    180,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '341339'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '341339'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1307 | PG 350722 | IDLAN 6074598
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    736,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '350722'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '350722'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1308 | PG 351143 | IDLAN 6074647
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    105,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '351143'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '351143'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1309 | PG 352103 | IDLAN 6075310
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    570,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '352103'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '352103'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1310 | PG 352183 | IDLAN 6075242
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    60,
    '2026-10-30',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '352183'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '352183'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 1311 | PG 356055 | IDLAN 6076377
call sp_criar_credito_paciente_faturamento_completo(
    14572,
    184,
    '2026-10-31',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '356055'
          AND p.tenant_id = 14572
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '356055'
              AND p.tenant_id = 14572
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    229837,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);
