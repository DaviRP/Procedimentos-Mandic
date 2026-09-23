CALL sp_criar_faturamento_completo(
    14567,
    44,
    '2026-06-24',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '185976'
              AND p.tenant_id = 14567 
        )
    ),
    25614,
    '31232',
    'CARTAO_DEBITO',
    'ATENDIMENTO TRIAGEM',
    616956,
    5816611,
    '1',
    @pai_id,
    @fat_id
);



DELIMITER $$

CREATE PROCEDURE sp_criar_faturamento_completo(
    IN p_tenant_id INT,
    IN p_valor DECIMAL(10,2),
    IN p_data_faturamento DATE,
    IN p_codcliente INT,
    IN p_codconta INT,
    IN p_numerodocumento VARCHAR(50),
    IN p_tipodocumento VARCHAR(50),
    IN p_descricao VARCHAR(255),
    IN p_codcategoria INT,
    IN p_idtotvs INT,
    IN p_idcoligadatotvs VARCHAR(10),
    OUT p_codfaturamento_pai INT,
    OUT p_codfaturamento INT
)
BEGIN
    -- Se der qualquer erro, desfaz tudo
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- 1. Insert na tabela pai
    INSERT INTO FATURAMENTO_PAI (
        diasparcelamento, tipoparcelamento, qtdparcelas, valorTotal,
        tenant_id, numerocontrolecontrato, origem, codorigem,
        agendaorcamento, convenio, DATACRIADO
    ) VALUES (
        NULL, NULL, NULL, p_valor, p_tenant_id, NULL, 'MANUAL', NULL, 0, 0, p_data_faturamento
    );

    SET p_codfaturamento_pai = LAST_INSERT_ID();

    -- 2. Insert no FATURAMENTO
    INSERT INTO FATURAMENTO (
        tenant_id, dataCriacao, dataFaturamento, dataQuitacao, dataVencimento,
        descricao, tipoDocumento, valor, valororiginal, codcliente, codconta,
        codestorno, numeroDocumento, codProfissional, codrepeticao, cod_prontuario,
        cod_agenda, codCriadoPor, codAlteradoPor, dataCriado, dataAlterado,
        codpaciente, parcela, tipoFaturamento, mesAnoCompetencia, codpai,
        codigoimportacao, tipodocumentopgto, qtdparcelaspgto, vencimentooriginal,
        criado_no_modo_split, dataCriacaoBoleto, versao, codtipopagamento
    ) VALUES (
        p_tenant_id, NOW(), p_data_faturamento, NULL, p_data_faturamento,
        p_descricao, p_tipodocumento, p_valor, p_valor, p_codcliente, p_codconta,
        NULL, p_numerodocumento, NULL, NULL, NULL, NULL, NULL, NULL,
        p_data_faturamento, NOW(), NULL, 0, 'RECEBER', p_data_faturamento,
        p_codfaturamento_pai, NULL, NULL, NULL, p_data_faturamento, 0, NULL, 4, NULL
    );

    SET p_codfaturamento = LAST_INSERT_ID();

    -- 3. Insert no RATEIO
    INSERT INTO FATURAMENTO_RATEIO (
        tenant_id, codfaturamento, codcategoria, valor
    ) VALUES (
        p_tenant_id, p_codfaturamento, p_codcategoria, p_valor
    );

    -- 4. Insert no TOTVS
    INSERT INTO FATURAMENTO_TOTVS (
        idtotvs, idcoligadatotvs, codfaturamento, datacriacao, dataalteracao, tenant_id
    ) VALUES (
        p_idtotvs, p_idcoligadatotvs, p_codfaturamento, NOW(), NOW(), p_tenant_id
    );

    COMMIT;
END$$

DELIMITER ;