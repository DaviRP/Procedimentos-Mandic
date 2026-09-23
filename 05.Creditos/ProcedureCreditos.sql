
 
DELIMITER $$
 
CREATE PROCEDURE sp_criar_credito_paciente_faturamento_completo(
    IN p_tenant_id INT,
    IN p_valor DECIMAL(10,2),
    IN p_data_faturamento DATE,
    IN p_codpaciente INT,
    IN p_codcliente INT,
    IN p_codconta INT,
    IN p_tipodocumento VARCHAR(50),
    IN p_numerodocumento VARCHAR(50),
    IN p_codcategoria INT,
    IN p_codtipopagamento INT,
    OUT p_codfaturamento_pai INT,
    OUT p_codfaturamento INT,
    OUT p_codfaturamento_pai_receber INT,
    OUT p_codfaturamento_receber INT,
    OUT p_codmovimento_receber INT,
    OUT p_codlancamentocarteira INT
)
BEGIN
    -- Se der qualquer erro, desfaz tudo
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
 
    START TRANSACTION;
 
    -- 1. Insert na tabela pai A PAGAR
    INSERT INTO FATURAMENTO_PAI (
        diasparcelamento, tipoparcelamento, qtdparcelas, valorTotal,
        tenant_id, numerocontrolecontrato, origem, codorigem,
        agendaorcamento, convenio, DATACRIADO
    ) VALUES (
        NULL, NULL, NULL, p_valor, p_tenant_id, NULL, 'CARTEIRA', NULL, 0, 0, p_data_faturamento
    );
 
    SET p_codfaturamento_pai = LAST_INSERT_ID();
 
    -- 2. Insert no FATURAMENTO A PAGAR
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
        'Crédito avulso como antecipação do pagamento', p_tipodocumento, p_valor, p_valor, p_codcliente, p_codconta,
        NULL, p_numerodocumento, NULL, NULL, NULL, NULL, NULL, NULL,
        p_data_faturamento, NOW(), NULL, 0, 'PAGAR', p_data_faturamento,
        p_codfaturamento_pai, NULL, 'CARTEIRA', NULL, p_data_faturamento, 0, NULL, 0, NULL
    );
 
    SET p_codfaturamento = LAST_INSERT_ID();
 
    -- 3. Insert no RATEIO A PAGAR
    INSERT INTO FATURAMENTO_RATEIO (
        tenant_id, codfaturamento, codcategoria, valor
    ) VALUES (
        p_tenant_id, p_codfaturamento, p_codcategoria, p_valor
    );
   
   
   
   
     -- 4. Insert na tabela pai A RECEBER
    INSERT INTO FATURAMENTO_PAI (
        diasparcelamento, tipoparcelamento, qtdparcelas, valorTotal,
        tenant_id, numerocontrolecontrato, origem, codorigem,
        agendaorcamento, convenio, DATACRIADO
    ) VALUES (
        NULL, NULL, NULL, p_valor, p_tenant_id, NULL, 'CARTEIRA', NULL, 0, 0, p_data_faturamento
    );
 
    SET p_codfaturamento_pai_receber = LAST_INSERT_ID();
 
    -- 5. Insert no FATURAMENTO A RECEBER
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
        'Crédito avulso como antecipação do pagamento', p_tipodocumento, p_valor, p_valor, p_codcliente, p_codconta,
        NULL, p_numerodocumento, NULL, NULL, NULL, NULL, NULL, NULL,
        p_data_faturamento, NOW(), NULL, 0, 'RECEBER', p_data_faturamento,
        p_codfaturamento_pai_receber, NULL, 'CARTEIRA', NULL, p_data_faturamento, 0, NULL, 0, NULL
    );
 
    SET p_codfaturamento_receber = LAST_INSERT_ID();
 
    -- 6. Insert no RATEIO A RECEBER
    INSERT INTO FATURAMENTO_RATEIO (
        tenant_id, codfaturamento, codcategoria, valor
    ) VALUES (
        p_tenant_id, p_codfaturamento_receber, p_codcategoria, p_valor
    );
   
   
    -- 7. Insert no MOVIMENTO A RECEBER
 
    INSERT INTO MOVIMENTO (tenant_id, `data`, descricao, tipoFaturamento, valor, codconta, codestorno,
            numeroDocumento, tipoDocumento, valorCaixa, codCriadoPor, codAlteradoPor, dataCriado,
            dataAlterado, dataConciliado, hashconciliado, tipodescontoacrescimo, tipovalordescontoacrescimo,
             valordescontoacrescimo, codautorizacaodescontoacrescimo, codconciliacaoregistro,
             tributadoporcreditorenegociacao, valorjuros, valormulta)
        VALUES(p_tenant_id, p_data_faturamento, NULL, 'RECEBER', p_valor, p_codconta, NULL,
            NULL, p_tipodocumento, p_valor, NULL, NULL, NOW(),
            NULL, p_data_faturamento, NULL, 'DESCONTO', 'ABSOLUTO', 0.00, NULL, NULL, 0, 0.00, 0.00);
   
    SET p_codmovimento_receber = LAST_INSERT_ID();
   
    -- 8. Insert no PAGAMENTO A RECEBER
    INSERT INTO PAGAMENTO (tenant_id, codfaturamento, codmovimento, codestorno, codProfissional, codrecibo,
                 codCriadoPor, codAlteradoPor, dataCriado, dataAlterado, codrpa, codtipopagamento, possuidetalhes,
                 possuicheque, codigoImportacao, categoriapagamento, codigolancamentocarteira)
            VALUES(p_tenant_id, p_codfaturamento_receber, p_codmovimento_receber, NULL, NULL, NULL,
                NULL, NULL, NOW(), NULL, NULL, p_codtipopagamento, 0,
                0, NULL, 'NORMAL', NULL);
   
     -- 9. Insert na carteira do paciente
    INSERT INTO PACIENTE_CARTEIRA_LANCAMENTO (valor, `data`, operacao, origemfaturamento,
						 tipo, codorigem, codpaciente, tenant_id, codCriadoPor,
						 codAlteradoPor, dataCriado, dataAlterado)
					VALUES(p_valor, p_data_faturamento, 'CREDITO', 'CARTEIRA',
						'CREDITO_CARTEIRA', p_codfaturamento_receber, p_codpaciente, p_tenant_id, NULL,
						 NULL, NOW(), NULL);
	 
	  SET p_codlancamentocarteira = LAST_INSERT_ID();				 
						
 
     -- 10. Insert na carteira do paciente_credito
	INSERT INTO PACIENTE_CARTEIRA_LANCAMENTO_CREDITO (versao, saldo, liquidado, codlancamentocarteira,
							codfaturamentopagar, codfaturamentoreceber, tenant_id, pago, liberado)
						VALUES(0, p_valor, 0, p_codlancamentocarteira,
							p_codfaturamento, p_codfaturamento_receber, p_tenant_id, 1, 1);
   
 
    COMMIT;
END$$
 
DELIMITER ;