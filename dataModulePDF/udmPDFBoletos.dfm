object dmPDFBoletos: TdmPDFBoletos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 329
  Width = 386
  object qrReceber: TFDQuery
    SQL.Strings = (
      'select first 3'
      '    0 as SEL,'
      '    CBR_TITULOS.*,'
      '    case CBR_TITULOS.SITUACAO'
      '      when '#39'A'#39' then '#39'Aberto'#39
      '      when '#39'L'#39' then '#39'Liquidado'#39
      '      when '#39'B'#39' then '#39'Baixado'#39
      '      when '#39'C'#39' then '#39'Cancelado'#39
      '    end as SITUACAO_DESRICAO,'
      '    case CBR_TITULOS.REGISTRO_STATUS'
      '      when '#39'A'#39' then '#39'Sem Registro'#39
      '      when '#39'R'#39' then '#39'Registrada'#39
      '      when '#39'E'#39' then '#39'Rejeitada'#39
      '    end as REGISTRO_STATUS_DESCRICAO,'
      '    CLI.DESCRICAO as CLI_DESCRICAO,'
      '    iif(CLI.TIPOCLIENTE = 0, CLI.CPF, CLI.CNPJ) as CLI_CPF_CNPJ,'
      '    CLI.ENDERECO as CLI_ENDERECO,'
      '    CLI.NUMERO as CLI_ENDNUMERO,'
      '    CLI.BAIRRO as CLI_ENDBAIRRO,'
      '    CLI.CIDADE as CLI_ENDCIDADE,'
      '    CLI.UF as CLI_ENDUF,'
      '    CLI.CEP as CLI_ENDCEP'
      'from'
      '    CBR_TITULOS'
      'inner join'
      '    CLIENTES CLI on CBR_TITULOS.CLIENTE_ID = CLI.ID'
      'where'
      '    CBR_TITULOS.SITUACAO = '#39'A'#39' and'
      '    CBR_TITULOS.REMESSA = '#39'S'#39' and'
      '    CBR_TITULOS.CLIENTE_ID = :CLIENTE_ID'
      'order by'
      '    DTVENCIMENTO')
    Left = 32
    Top = 32
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qrReceberSEL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEL'
      Origin = 'SEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrReceberID_EMISSOR: TIntegerField
      FieldName = 'ID_EMISSOR'
      Origin = 'ID_EMISSOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrReceberID_CBR_TITULOS: TLargeintField
      FieldName = 'ID_CBR_TITULOS'
      Origin = 'ID_CBR_TITULOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrReceberSITUACAO: TWideStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qrReceberCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
    end
    object qrReceberDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
    end
    object qrReceberDTALTERACAO: TSQLTimeStampField
      FieldName = 'DTALTERACAO'
      Origin = 'DTALTERACAO'
    end
    object qrReceberDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object qrReceberDTCANCELAMENTO: TDateField
      FieldName = 'DTCANCELAMENTO'
      Origin = 'DTCANCELAMENTO'
    end
    object qrReceberVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qrReceberHISTORICO: TWideStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object qrReceberVLJURO: TFMTBCDField
      FieldName = 'VLJURO'
      Origin = 'VLJURO'
      Precision = 18
      Size = 2
    end
    object qrReceberVLACRESCIMO: TFMTBCDField
      FieldName = 'VLACRESCIMO'
      Origin = 'VLACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qrReceberVLDESCONTO: TFMTBCDField
      FieldName = 'VLDESCONTO'
      Origin = 'VLDESCONTO'
      Precision = 18
      Size = 2
    end
    object qrReceberVLPAGO: TFMTBCDField
      FieldName = 'VLPAGO'
      Origin = 'VLPAGO'
      Precision = 18
      Size = 2
    end
    object qrReceberDTCADASTRO: TSQLTimeStampField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
    end
    object qrReceberDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
      Origin = 'DTPAGAMENTO'
    end
    object qrReceberALTERACAO_LOJA: TWideStringField
      FieldName = 'ALTERACAO_LOJA'
      Origin = 'ALTERACAO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qrReceberPAGAMENTO_LOJA: TWideStringField
      FieldName = 'PAGAMENTO_LOJA'
      Origin = 'PAGAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qrReceberCANCELAMENTO_LOJA: TWideStringField
      FieldName = 'CANCELAMENTO_LOJA'
      Origin = 'CANCELAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qrReceberCANCELAMENTO_DATA: TSQLTimeStampField
      FieldName = 'CANCELAMENTO_DATA'
      Origin = 'CANCELAMENTO_DATA'
    end
    object qrReceberREMESSA: TWideStringField
      FieldName = 'REMESSA'
      Origin = 'REMESSA'
      FixedChar = True
      Size = 1
    end
    object qrReceberREMESSA_REENVIAR: TWideStringField
      FieldName = 'REMESSA_REENVIAR'
      Origin = 'REMESSA_REENVIAR'
      FixedChar = True
      Size = 1
    end
    object qrReceberREMESSA_DATA: TDateField
      FieldName = 'REMESSA_DATA'
      Origin = 'REMESSA_DATA'
    end
    object qrReceberREMESSA_ARQUIVO: TWideStringField
      FieldName = 'REMESSA_ARQUIVO'
      Origin = 'REMESSA_ARQUIVO'
      Size = 200
    end
    object qrReceberREGISTRO_ID_CBR_RETORNO: TLargeintField
      FieldName = 'REGISTRO_ID_CBR_RETORNO'
      Origin = 'REGISTRO_ID_CBR_RETORNO'
    end
    object qrReceberREGISTRO_STATUS: TWideStringField
      FieldName = 'REGISTRO_STATUS'
      Origin = 'REGISTRO_STATUS'
      FixedChar = True
      Size = 1
    end
    object qrReceberREGISTRO_DATA: TSQLTimeStampField
      FieldName = 'REGISTRO_DATA'
      Origin = 'REGISTRO_DATA'
    end
    object qrReceberREGISTRO_ARQUIVO: TWideStringField
      FieldName = 'REGISTRO_ARQUIVO'
      Origin = 'REGISTRO_ARQUIVO'
      Size = 200
    end
    object qrReceberREGISTRO_HISTORICO: TWideStringField
      FieldName = 'REGISTRO_HISTORICO'
      Origin = 'REGISTRO_HISTORICO'
      Size = 200
    end
    object qrReceberREGISTRO_SEM_REGISTRO: TWideStringField
      FieldName = 'REGISTRO_SEM_REGISTRO'
      Origin = 'REGISTRO_SEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qrReceberREGISTRO_LIMITE_PRAZO: TWideStringField
      FieldName = 'REGISTRO_LIMITE_PRAZO'
      Origin = 'REGISTRO_LIMITE_PRAZO'
      FixedChar = True
      Size = 1
    end
    object qrReceberRETORNO_HISTORICO: TWideStringField
      FieldName = 'RETORNO_HISTORICO'
      Origin = 'RETORNO_HISTORICO'
      Size = 300
    end
    object qrReceberOBS: TWideStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 300
    end
    object qrReceberID_CBR_REMESSA_UUID: TWideStringField
      FieldName = 'ID_CBR_REMESSA_UUID'
      Origin = 'ID_CBR_REMESSA_UUID'
      Size = 44
    end
    object qrReceberPEDIDOS_VENDAS_ID: TIntegerField
      FieldName = 'PEDIDOS_VENDAS_ID'
      Origin = 'PEDIDOS_VENDAS_ID'
    end
    object qrReceberCONTA_PR_ID: TIntegerField
      FieldName = 'CONTA_PR_ID'
      Origin = 'CONTA_PR_ID'
    end
    object qrReceberCAIXA_BANCO_ID: TIntegerField
      FieldName = 'CAIXA_BANCO_ID'
      Origin = 'CAIXA_BANCO_ID'
    end
    object qrReceberVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      Origin = 'VALOR_MULTA'
      Precision = 18
      Size = 2
    end
    object qrReceberTIPO_COBRANCA_JUROS: TIntegerField
      FieldName = 'TIPO_COBRANCA_JUROS'
      Origin = 'TIPO_COBRANCA_JUROS'
    end
    object qrReceberTIPO_MULTA: TIntegerField
      FieldName = 'TIPO_MULTA'
      Origin = 'TIPO_MULTA'
    end
    object qrReceberDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'DIAS_CARENCIA'
    end
    object qrReceberCODIGO_BARRAS: TWideStringField
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      Size = 100
    end
    object qrReceberDATA_NOTIFICACAO: TDateField
      FieldName = 'DATA_NOTIFICACAO'
      Origin = 'DATA_NOTIFICACAO'
    end
    object qrReceberSITUACAO_DESRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO_DESRICAO'
      Origin = 'SITUACAO_DESRICAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object qrReceberREGISTRO_STATUS_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'REGISTRO_STATUS_DESCRICAO'
      Origin = 'REGISTRO_STATUS_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object qrReceberCLI_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object qrReceberCLI_CPF_CNPJ: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_CPF_CNPJ'
      Origin = 'CLI_CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qrReceberCLI_ENDERECO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object qrReceberCLI_ENDNUMERO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDNUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qrReceberCLI_ENDBAIRRO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDBAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object qrReceberCLI_ENDCIDADE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDCIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qrReceberCLI_ENDUF: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDUF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qrReceberCLI_ENDCEP: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_ENDCEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 9
    end
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.Numero = 104
    Banco.TamanhoMaximoNossoNum = 15
    Banco.TipoCobranca = cobCaixaEconomica
    Banco.OrientacoesBanco.Strings = (
      
        'SAC CAIXA: 0800 726 0101 (informa'#231#245'es, reclama'#231#245'es, sugest'#245'es e ' +
        'elogios) '#13#10'Para pessoas com defici'#234'ncia auditiva ou de fala: 080' +
        '0 726 2492 '#13#10'Ouvidoria: 0800 725 7474 (reclama'#231#245'es n'#227'o soluciona' +
        'das e den'#250'ncias) '#13#10'caixa.gov.br ')
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.TipoInscricao = pJuridica
    Cedente.IdentDistribuicao = tbBancoDistribui
    Cedente.PIX.TipoChavePIX = tchNenhuma
    DirArqRemessa = 'c:\temp'
    NumeroArquivo = 0
    LayoutRemessa = c240
    ACBrBoletoFC = ACBrBoletoFCFortes1
    Configuracoes.Arquivos.LogNivel = logNenhum
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = tawsHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 79
    Top = 163
  end
  object qryCBR_CONFIG: TFDQuery
    SQL.Strings = (
      
        'select CBR_CONFIG.*, EMPRESA.RAZAO_SOCIAL as EMP_RAZAOSOCIAL, EM' +
        'PRESA.CNPJ_CPF as EMP_CNPJ,'
      
        '       EMPRESA.ENDERECO EMP_ENDERECO, '#39#39' as EMP_COMPLEMENTO, EMP' +
        'RESA.BAIRRO as EMP_BAIRRO, EMPRESA.CIDADE as EMP_CIDADE,'
      '       EMPRESA.UF as EMP_UF,'
      '       (select CEP'
      '        from CIDADES'
      '        where NOMECIDADE = EMPRESA.CIDADE and'
      
        '              UFESTADO = EMPRESA.UF) as EMP_CEP, EMPRESA.TELEFON' +
        'E as EMP_TELEFONE'
      'from CBR_CONFIG'
      'inner join EMPRESA on 1 = EMPRESA.ID'
      'where 1 = 1 and'
      '      CBR_CONFIG.ID_EMISSOR = :ID_EMISSOR')
    Left = 114
    Top = 34
    ParamData = <
      item
        Name = 'ID_EMISSOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCBR_CONFIGID_EMISSOR: TIntegerField
      FieldName = 'ID_EMISSOR'
      Origin = 'ID_EMISSOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCBR_CONFIGDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryCBR_CONFIGDIRRECEBE: TWideStringField
      FieldName = 'DIRRECEBE'
      Origin = 'DIRRECEBE'
      Size = 300
    end
    object qryCBR_CONFIGDIRENVIA: TWideStringField
      FieldName = 'DIRENVIA'
      Origin = 'DIRENVIA'
      Size = 300
    end
    object qryCBR_CONFIGDIRRECEBEBKP: TWideStringField
      FieldName = 'DIRRECEBEBKP'
      Origin = 'DIRRECEBEBKP'
      Size = 300
    end
    object qryCBR_CONFIGVLRTARIFABOLETA: TFMTBCDField
      FieldName = 'VLRTARIFABOLETA'
      Origin = 'VLRTARIFABOLETA'
      Precision = 18
      Size = 2
    end
    object qryCBR_CONFIGTIPOCOBRANCA: TWideStringField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA'
      Size = 30
    end
    object qryCBR_CONFIGCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
      Origin = 'CODBANCO'
    end
    object qryCBR_CONFIGAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryCBR_CONFIGAGENCIADIG: TWideStringField
      FieldName = 'AGENCIADIG'
      Origin = 'AGENCIADIG'
      FixedChar = True
      Size = 2
    end
    object qryCBR_CONFIGCONTA: TWideStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object qryCBR_CONFIGCONTADIG: TWideStringField
      FieldName = 'CONTADIG'
      Origin = 'CONTADIG'
      FixedChar = True
      Size = 2
    end
    object qryCBR_CONFIGCODCEDENTE: TWideStringField
      FieldName = 'CODCEDENTE'
      Origin = 'CODCEDENTE'
    end
    object qryCBR_CONFIGCODCEDENTEDIG: TWideStringField
      FieldName = 'CODCEDENTEDIG'
      Origin = 'CODCEDENTEDIG'
      FixedChar = True
      Size = 2
    end
    object qryCBR_CONFIGCONVENIO: TWideStringField
      FieldName = 'CONVENIO'
      Origin = 'CONVENIO'
      Size = 15
    end
    object qryCBR_CONFIGCARTEIRA: TWideStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 15
    end
    object qryCBR_CONFIGMODALIDADE: TWideStringField
      FieldName = 'MODALIDADE'
      Origin = 'MODALIDADE'
      Size = 15
    end
    object qryCBR_CONFIGESPECIEDOC: TWideStringField
      FieldName = 'ESPECIEDOC'
      Origin = 'ESPECIEDOC'
      FixedChar = True
      Size = 3
    end
    object qryCBR_CONFIGCOBMOEDA: TWideStringField
      FieldName = 'COBMOEDA'
      Origin = 'COBMOEDA'
      Size = 10
    end
    object qryCBR_CONFIGCOBACEITE: TWideStringField
      FieldName = 'COBACEITE'
      Origin = 'COBACEITE'
      Size = 10
    end
    object qryCBR_CONFIGLOCALPAGTO: TWideStringField
      FieldName = 'LOCALPAGTO'
      Origin = 'LOCALPAGTO'
      Size = 100
    end
    object qryCBR_CONFIGINSTRUCAO1: TWideStringField
      FieldName = 'INSTRUCAO1'
      Origin = 'INSTRUCAO1'
      Size = 300
    end
    object qryCBR_CONFIGINSTRUCAO2: TWideStringField
      FieldName = 'INSTRUCAO2'
      Origin = 'INSTRUCAO2'
      Size = 300
    end
    object qryCBR_CONFIGJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Precision = 18
      Size = 5
    end
    object qryCBR_CONFIGMULTA: TFMTBCDField
      FieldName = 'MULTA'
      Origin = 'MULTA'
      Precision = 18
      Size = 5
    end
    object qryCBR_CONFIGCARENCIA_JUROS: TIntegerField
      FieldName = 'CARENCIA_JUROS'
      Origin = 'CARENCIA_JUROS'
    end
    object qryCBR_CONFIGTIPO_CALC_JUROS: TIntegerField
      FieldName = 'TIPO_CALC_JUROS'
      Origin = 'TIPO_CALC_JUROS'
    end
    object qryCBR_CONFIGWS_CLIENTID: TWideStringField
      FieldName = 'WS_CLIENTID'
      Origin = 'WS_CLIENTID'
      Size = 500
    end
    object qryCBR_CONFIGWS_CLIENTSECRET: TWideStringField
      FieldName = 'WS_CLIENTSECRET'
      Origin = 'WS_CLIENTSECRET'
      Size = 500
    end
    object qryCBR_CONFIGWS_KEYUSER: TWideStringField
      FieldName = 'WS_KEYUSER'
      Origin = 'WS_KEYUSER'
      Size = 500
    end
    object qryCBR_CONFIGWS_SCOPE: TWideStringField
      FieldName = 'WS_SCOPE'
      Origin = 'WS_SCOPE'
      Size = 255
    end
    object qryCBR_CONFIGWS_INDICADORPIX: TIntegerField
      FieldName = 'WS_INDICADORPIX'
      Origin = 'WS_INDICADORPIX'
    end
    object qryCBR_CONFIGLAYOUT: TIntegerField
      FieldName = 'LAYOUT'
      Origin = 'LAYOUT'
    end
    object qryCBR_CONFIGOBSERVACOES: TWideStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 500
    end
    object qryCBR_CONFIGEMP_RAZAOSOCIAL: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_RAZAOSOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCBR_CONFIGEMP_CNPJ: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_CNPJ'
      Origin = 'CNPJ_CPF'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCBR_CONFIGEMP_ENDERECO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCBR_CONFIGEMP_COMPLEMENTO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_COMPLEMENTO'
      Origin = 'EMP_COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object qryCBR_CONFIGEMP_BAIRRO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_CONFIGEMP_CIDADE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_CONFIGEMP_UF: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryCBR_CONFIGEMP_CEP: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryCBR_CONFIGEMP_TELEFONE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object ACBrBoletoFCFortes1: TACBrBoletoFCFortes
    Left = 183
    Top = 165
  end
end
