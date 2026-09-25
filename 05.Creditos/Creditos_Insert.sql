-- Script gerado automaticamente por GerarSQLCreditos.py
-- Gerado em: 2026-09-25 08:05:45
-- Total de chamadas: 6 | Ignoradas: 0

-- Linha 2 | PG 257298 | IDLAN 3504064
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    100,
    '2022-03-02',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257298'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257298'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 3 | PG 188792 | IDLAN 3788968
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    89.6,
    '2022-09-26',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '188792'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '188792'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 4 | PG 257298 | IDLAN 4697191
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    98,
    '2024-07-29',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '257298'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257298'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 5 | PG 270734 | IDLAN 4756972
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    22.54,
    '2024-09-12',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '270734'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270734'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 6 | PG 28934620 | IDLAN 5102689
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    22.54,
    '2025-04-11',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '28934620'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '28934620'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);

-- Linha 7 | PG 269527 | IDLAN 5110670
call sp_criar_credito_paciente_faturamento_completo(
    14551,
    22.54,
    '2025-04-17',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '269527'
          AND p.tenant_id = 14551
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269527'
              AND p.tenant_id = 14551
            LIMIT 1
        )
        LIMIT 1
    ),
    25740,
    'CARTEIRA',
    '31232',
    616956,
    110649,
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);
