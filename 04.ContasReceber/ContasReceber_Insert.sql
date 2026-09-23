-- Script gerado automaticamente por GerarSQLContasReceber.py
-- Gerado em: 2026-09-01 09:06:41
-- Total de chamadas: 177 | Ignoradas: 0


-- Linha 3 | PG 150997 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-04-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '150997'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4551173,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 4 | PG 283720 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-07-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283720'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4168829,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 5 | PG 268475 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268475'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035183,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 6 | PG 258898 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2021-11-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258898'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3397372,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 7 | PG 261889 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-06-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261889'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4122059,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 8 | PG 296446 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2024-02-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '296446'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4447225,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 9 | PG 101655 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-04-13',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '101655'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4028675,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 10 | PG 177678 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-02-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '177678'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3963353,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 11 | PG 271264 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-10-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271264'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3821833,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 12 | PG 174315 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-06-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174315'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3252542,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 13 | PG 161064 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2023-10-05',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '161064'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    4254551,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 14 | PG 182996 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-07-30',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '182996'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3669025,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 15 | PG 281968 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-09-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '281968'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    4240097,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 16 | PG 248373 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2021-08-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248373'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3313498,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 17 | PG 170444 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-11-26',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170444'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3408623,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 18 | PG 262984 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-04-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262984'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3552282,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 19 | PG 262984 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-08-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '262984'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3755468,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 20 | PG 263347 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-09-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263347'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3772833,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 21 | PG 261905 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-06-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '261905'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4120997,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 22 | PG 268820 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268820'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035112,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 23 | PG 268820 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    75,
    '2025-11-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268820'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    5407099,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 24 | PG 141234 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-01-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '141234'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3455439,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 25 | PG 140169 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-12-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '140169'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4336421,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 26 | PG 277022 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-09-13',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277022'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4230046,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 27 | PG 348086 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-07-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '348086'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5845841,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 28 | PG 260886 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-02-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260886'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3477996,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 29 | PG 268008 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2025-02-26',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268008'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    5024837,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 30 | PG 96211 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '96211'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3741259,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 31 | PG 271825 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-10-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271825'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3819124,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 32 | PG 250045 | ATENDIMENTO DE URGÊNCIA SEM TRATAMENTO EM CURSO
CALL sp_criar_faturamento_completo(
    14567,
    120,
    '2025-04-29',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250045'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO DE URGÊNCIA SEM TRATAMENTO EM CURSO',
    616956,
    5123852,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 33 | PG 347369 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2026-06-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '347369'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    5774218,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 34 | PG 266122 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266122'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3650332,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 35 | PG 270654 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-09-08',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270654'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3772119,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 36 | PG 348188 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-08-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '348188'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5962043,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 37 | PG 119690 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2025-02-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '119690'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    4988487,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 38 | PG 93643 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-10-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '93643'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3379374,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 39 | PG 269085 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269085'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3650354,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 40 | PG 281501 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-05-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '281501'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4071522,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 41 | PG 169438 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-07-29',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169438'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3668060,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 42 | PG 154371 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-05-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '154371'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4071497,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 43 | PG 269088 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269088'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3650420,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 44 | PG 287570 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2025-07-01',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287570'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    5208940,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 45 | PG 271209 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-10-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271209'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3819055,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 46 | PG 168150 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '168150'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035129,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 47 | PG 294866 | IMPLANTE HELIX GM 3.5X11.5 ACQUA
CALL sp_criar_faturamento_completo(
    14567,
    570,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'IMPLANTE HELIX GM 3.5X11.5 ACQUA',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 48 | PG 294866 | IMPLANTE HELIX GM 3.5X13 ACQUA
CALL sp_criar_faturamento_completo(
    14567,
    570,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'IMPLANTE HELIX GM 3.5X13 ACQUA',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 49 | PG 294866 | IMPLANTE HELIX GM 4.3X11.5 ACQUA
CALL sp_criar_faturamento_completo(
    14567,
    570,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'IMPLANTE HELIX GM 4.3X11.5 ACQUA',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 50 | PG 294866 | IMPLANTE HELIX GM 3.5X11.5 ACQUA
CALL sp_criar_faturamento_completo(
    14567,
    570,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'IMPLANTE HELIX GM 3.5X11.5 ACQUA',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 51 | PG 294866 | PARAFUSO DE COBERTURA GM
CALL sp_criar_faturamento_completo(
    14567,
    29,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'PARAFUSO DE COBERTURA GM',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 52 | PG 294866 | PARAFUSO DE COBERTURA GM ALT. 2
CALL sp_criar_faturamento_completo(
    14567,
    29,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'PARAFUSO DE COBERTURA GM ALT. 2',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 53 | PG 294866 | KIT COMPLETO DE IMPLANTE UNIDADE FORTALEZA
CALL sp_criar_faturamento_completo(
    14567,
    125,
    '2024-05-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '294866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'KIT COMPLETO DE IMPLANTE UNIDADE FORTALEZA',
    616956,
    4592268,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 54 | PG 257312 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257312'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035228,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 55 | PG 273147 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-11-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273147'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3842080,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 56 | PG 166194 | ATENDIMENTO DE URGÊNCIA SEM TRATAMENTO EM CURSO
CALL sp_criar_faturamento_completo(
    14567,
    120,
    '2024-07-02',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166194'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO DE URGÊNCIA SEM TRATAMENTO EM CURSO',
    616956,
    4650260,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 57 | PG 268312 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268312'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3740640,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 58 | PG 258928 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2021-11-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258928'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3400695,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 59 | PG 288732 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2024-01-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288732'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4382248,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 60 | PG 288732 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-04-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288732'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4548854,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 61 | PG 288732 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-07-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288732'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4691113,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 62 | PG 258066 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2021-11-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258066'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3397377,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 63 | PG 265352 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-05-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265352'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3587145,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 64 | PG 252918 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-02-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252918'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3955264,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 65 | PG 138333 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-04-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '138333'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4552243,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 66 | PG 266126 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-05-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266126'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3587141,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 67 | PG 266126 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266126'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3650337,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 68 | PG 175629 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-12-13',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175629'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4330709,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 69 | PG 123198 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-11-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '123198'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3848003,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 70 | PG 174351 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-09-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '174351'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4241033,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 71 | PG 175311 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-06-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175311'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3251876,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 72 | PG 348190 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-07-18',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '348190'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5846412,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 73 | PG 292821 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-05-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292821'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4590035,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 74 | PG 169012 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-04-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169012'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4552028,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 75 | PG 145424 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-07-27',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145424'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4176405,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 76 | PG 160783 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-03-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '160783'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4002516,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 77 | PG 263263 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-03-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263263'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3513965,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 78 | PG 269090 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269090'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3650421,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 79 | PG 173697 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-10-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '173697'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3379423,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 80 | PG 145852 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '145852'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3741294,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 81 | PG 259537 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259537'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4032283,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 82 | PG 259537 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-06-27',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '259537'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4644288,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 83 | PG 269031 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269031'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3648114,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 84 | PG 278812 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-03-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278812'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    3996818,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 85 | PG 278812 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-03-18',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278812'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    3996823,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 86 | PG 257051 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    75,
    '2025-12-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257051'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    5449983,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 87 | PG 282811 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-06-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282811'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4119280,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 88 | PG 256761 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2021-09-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '256761'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3344250,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 89 | PG 170500 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-07-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170500'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3663132,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 90 | PG 252194 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    65,
    '2023-05-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252194'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4059680,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 91 | PG 237494 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-04-07',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '237494'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3548290,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 92 | PG 247424 | AVALIAÇÃO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    0,
    '2021-06-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '247424'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'AVALIAÇÃO DE ENDODONTIA',
    616956,
    3242753,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 93 | PG 92971 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '92971'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3741245,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 94 | PG 252355 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-03-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252355'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4002482,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 95 | PG 252355 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252355'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035080,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 96 | PG 173426 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-06-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '173426'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3250573,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 97 | PG 287093 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-10-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '287093'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4273997,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 98 | PG 119691 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2025-02-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '119691'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    4988486,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 99 | PG 270937 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-01-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270937'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3911420,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 100 | PG 350029 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-08-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '350029'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5962046,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 101 | PG 263262 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-06-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '263262'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3616117,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 102 | PG 170503 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-07-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170503'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3663133,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 103 | PG 170503 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2024-03-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170503'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4496632,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 104 | PG 265544 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    70,
    '2024-09-27',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265544'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4780167,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 105 | PG 275553 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-03-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '275553'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3993099,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 106 | PG 267424 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-06-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267424'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3614425,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 107 | PG 265233 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-13',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265233'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3743777,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 108 | PG 273174 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-10-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273174'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3821831,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 109 | PG 162379 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-06-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '162379'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4106890,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 110 | PG 341835 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-06-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '341835'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5791890,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 111 | PG 278628 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-03-18',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '278628'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    3996824,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 112 | PG 290926 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-12-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '290926'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4334651,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 113 | PG 166688 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-07-05',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '166688'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4137465,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 114 | PG 265647 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-06-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265647'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3614414,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 115 | PG 252777 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-05-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '252777'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3592640,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 116 | PG 280429 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-05-18',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '280429'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4070194,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 117 | PG 155079 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-08-26',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '155079'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3320683,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 118 | PG 285941 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-08-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '285941'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4204218,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 119 | PG 253743 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2021-08-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '253743'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3313183,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 120 | PG 348076 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-07-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '348076'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5844877,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 121 | PG 186409 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-06-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186409'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4122714,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 122 | PG 186409 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-07-28',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186409'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4179374,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 123 | PG 254489 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-12-08',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '254489'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3864372,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 124 | PG 268988 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-07-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '268988'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3646350,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 125 | PG 282501 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-06-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '282501'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4121012,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 126 | PG 265234 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-11-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265234'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3853016,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 127 | PG 292298 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-12-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '292298'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4336912,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 128 | PG 257661 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257661'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035876,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 129 | PG 138562 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2023-04-27',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '138562'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    4045252,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 130 | PG 139309 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2025-10-31',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139309'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    5389236,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 131 | PG 132082 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-06-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '132082'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3629766,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 132 | PG 270505 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-08-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270505'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3752712,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 133 | PG 248412 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2021-10-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '248412'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3379596,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 134 | PG 175768 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175768'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4025777,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 135 | PG 175768 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    65,
    '2023-05-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '175768'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4059562,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 136 | PG 260622 | RETRATAMENTO (POSTERIOR)
CALL sp_criar_faturamento_completo(
    14567,
    170,
    '2021-12-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260622'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'RETRATAMENTO (POSTERIOR)',
    616956,
    3420980,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 137 | PG 350085 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-08-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '350085'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5961953,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 138 | PG 258497 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2021-12-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258497'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3419551,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 139 | PG 260064 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2021-12-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '260064'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3419677,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 140 | PG 250670 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-09-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '250670'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3787724,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 141 | PG 266106 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-05-13',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '266106'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3586897,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 142 | PG 271205 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-09-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271205'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3772661,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 143 | PG 139247 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-06-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '139247'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4121296,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 144 | PG 169866 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-02-17',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '169866'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3490513,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 145 | PG 170817 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-11-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '170817'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3842590,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 146 | PG 276740 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-06-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276740'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4121122,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 147 | PG 276378 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '276378'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4025760,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 148 | PG 277713 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-03-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277713'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    3993098,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 149 | PG 277713 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277713'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4024977,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 150 | PG 269257 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-04-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269257'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4035933,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 151 | PG 329716 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2025-08-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '329716'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    5294723,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 152 | PG 131952 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-10-31',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '131952'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3843487,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 153 | PG 267367 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-03-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267367'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4005372,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 154 | PG 283703 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-07-20',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '283703'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    4167831,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 155 | PG 273364 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-11-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '273364'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3842589,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 156 | PG 180493 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-12-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180493'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4335267,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 157 | PG 180493 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2024-02-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '180493'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    4447632,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 158 | PG 267489 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-14',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '267489'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3646920,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 159 | PG 271207 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-09-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271207'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3772720,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 160 | PG 152203 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2023-02-10',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '152203'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3945830,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 161 | PG 277709 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2023-03-15',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '277709'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3993097,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 162 | PG 269084 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-07-16',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269084'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3650345,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 163 | PG 186650 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-11-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '186650'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3850256,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 164 | PG 257044 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-07-25',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257044'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3663235,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 165 | PG 257044 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2022-11-23',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '257044'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3850243,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 166 | PG 258364 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-08-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '258364'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3743604,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 167 | PG 270898 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-09-08',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '270898'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3771553,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 168 | PG 136534 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-07-18',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '136534'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5846413,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 169 | PG 106695 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2025-08-19',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '106695'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    5285582,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 170 | PG 274027 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-11-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '274027'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3842409,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 171 | PG 269362 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2022-10-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '269362'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3821832,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 172 | PG 299746 | ATENDIMENTO TRIAGEM
CALL sp_criar_faturamento_completo(
    14567,
    40,
    '2024-04-22',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '299746'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    4545111,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 173 | PG 265268 | TRATAMENTO DE  (DENTES MOLARES)
CALL sp_criar_faturamento_completo(
    14567,
    150,
    '2022-08-11',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '265268'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES MOLARES)',
    616956,
    3740632,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 174 | PG 271243 | CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO
CALL sp_criar_faturamento_completo(
    14567,
    55,
    '2022-09-09',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '271243'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'CONSULTA EMERGÊNCIA- CLINICA AVANÇADA/CLINICA DE APOIO',
    616956,
    3773279,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 175 | PG 350055 | TRATAMENTO DE ENDODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2026-08-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '350055'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE ENDODONTIA',
    616956,
    5954227,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 176 | PG 163931 | TRATAMENTO ORTODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    60,
    '2021-08-26',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '163931'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO ORTODONTIA',
    616956,
    3319745,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 177 | PG 288166 | TRATAMENTO PERIODONTIA
CALL sp_criar_faturamento_completo(
    14567,
    50,
    '2023-09-21',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '288166'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO PERIODONTIA',
    616956,
    4241509,
    '1',
    @pai_id,
    @fat_id
);

-- Linha 178 | PG 112728 | TRATAMENTO DE  (DENTES INCISIVOS)
CALL sp_criar_faturamento_completo(
    14567,
    100,
    '2021-11-12',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '112728'
              AND p.tenant_id = 14567
        )
    ),
    25745,
    '31232',
    'CARTAO_DEBITO',
    'TRATAMENTO DE  (DENTES INCISIVOS)',
    616956,
    3397887,
    '1',
    @pai_id,
    @fat_id
);
