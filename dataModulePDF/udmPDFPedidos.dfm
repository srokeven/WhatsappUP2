object dmPDFPedidos: TdmPDFPedidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 647
  object qrCliente: TFDQuery
    SQL.Strings = (
      'select * from clientes where id = :CLIENTE_ID')
    Left = 40
    Top = 74
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 10
      end>
    object qrClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrClienteGRUPOS_CLIENTE_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPOS_CLIENTE_ID'
      Origin = 'GRUPOS_CLIENTE_ID'
    end
    object qrClienteDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 70
    end
    object qrClienteTIPOCLIENTE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPOCLIENTE'
      Origin = 'TIPOCLIENTE'
    end
    object qrClienteIDENTIDADE: TWideStringField
      FieldName = 'IDENTIDADE'
      Origin = 'IDENTIDADE'
      Size = 18
    end
    object qrClienteCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object qrClienteINSCRICAOESTADUAL: TWideStringField
      FieldName = 'INSCRICAOESTADUAL'
      Origin = 'INSCRICAOESTADUAL'
      Size = 18
    end
    object qrClienteCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object qrClienteUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qrClienteCODIGOESTADO: TSmallintField
      FieldName = 'CODIGOESTADO'
      Origin = 'CODIGOESTADO'
    end
    object qrClienteCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 35
    end
    object qrClienteCODIGOCIDADE: TWideStringField
      FieldName = 'CODIGOCIDADE'
      Origin = 'CODIGOCIDADE'
      FixedChar = True
      Size = 5
    end
    object qrClienteBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 45
    end
    object qrClienteENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 45
    end
    object qrClienteCEP: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object qrClienteNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 6
    end
    object qrClienteTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object qrClienteCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
    end
    object qrClienteDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
    object qrClienteESTADOCIVIL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADOCIVIL'
      Origin = 'ESTADOCIVIL'
    end
    object qrClienteINFORMACOES: TWideStringField
      FieldName = 'INFORMACOES'
      Origin = 'INFORMACOES'
      Size = 100
    end
    object qrClienteAREAPROFISSIONAL: TWideStringField
      FieldName = 'AREAPROFISSIONAL'
      Origin = 'AREAPROFISSIONAL'
    end
    object qrClienteAPELIDO: TWideStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 30
    end
    object qrClienteNOMEFANTASIA: TWideStringField
      FieldName = 'NOMEFANTASIA'
      Origin = 'NOMEFANTASIA'
      Size = 40
    end
    object qrClienteOBS: TWideStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 1000
    end
    object qrClienteEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qrClienteLIMITECREDITO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LIMITECREDITO'
      Origin = 'LIMITECREDITO'
      Precision = 18
      Size = 2
    end
    object qrClienteTIPOCONTRIBUINTE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPOCONTRIBUINTE'
      Origin = 'TIPOCONTRIBUINTE'
    end
    object qrClienteDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qrClienteSTATUS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object qrClienteINATIVO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'INATIVO'
      Origin = 'INATIVO'
    end
    object qrClienteCREDITO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CREDITO'
      Origin = 'CREDITO'
      Precision = 18
      Size = 2
    end
    object qrClienteUSUARIOS_ID: TIntegerField
      FieldName = 'USUARIOS_ID'
      Origin = 'USUARIOS_ID'
    end
  end
  object qrMain: TFDQuery
    SQL.Strings = (
      'select'
      '    pv.*,'
      '    CLI.id || '#39' - '#39' || CLI.descricao AS CLIENTE_ID_DESC,'
      '    VEN.id || '#39' - '#39' || VEN.nome AS VENDEDOR_ID_DESC'
      'from'
      '    PEDIDOS_VENDAS PV'
      'join VENDEDORES VEN on VEN.ID = PV.VENDEDOR_ID  '
      'join clientes cli on cli.id = pv.vendedor_id'
      'where pv.id = :ID_MOVI order by PV.id ')
    Left = 40
    Top = 24
    ParamData = <
      item
        Name = 'ID_MOVI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qrMainID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrMainUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
    end
    object qrMainVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
      Origin = 'VENDEDOR_ID'
    end
    object qrMainCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
    end
    object qrMainFILIAL_ID: TIntegerField
      FieldName = 'FILIAL_ID'
      Origin = 'FILIAL_ID'
    end
    object qrMainTIPO_PAGAMENTO: TIntegerField
      FieldName = 'TIPO_PAGAMENTO'
      Origin = 'TIPO_PAGAMENTO'
    end
    object qrMainSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object qrMainDATA_CRIACAO: TSQLTimeStampField
      FieldName = 'DATA_CRIACAO'
      Origin = 'DATA_CRIACAO'
    end
    object qrMainDATA_CONCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_CONCLUSAO'
      Origin = 'DATA_CONCLUSAO'
    end
    object qrMainVALOR_BRUTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_BRUTO'
      Origin = 'VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object qrMainVALOR_DESCONTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qrMainVALOR_LIQUIDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_LIQUIDO'
      Origin = 'VALOR_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object qrMainVALOR_RECEBIDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      Precision = 18
      Size = 2
    end
    object qrMainVALOR_TROCO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TROCO'
      Origin = 'VALOR_TROCO'
      Precision = 18
      Size = 2
    end
    object qrMainPEDIDO_ORIGINAL: TWideStringField
      FieldName = 'PEDIDO_ORIGINAL'
      Origin = 'PEDIDO_ORIGINAL'
      Size = 100
    end
    object qrMainINTEGRACAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'INTEGRACAO'
      Origin = 'INTEGRACAO'
    end
    object qrMainOBSERVACOES: TWideStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 1000
    end
    object qrMainSTATUS_MOVIMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_MOVIMENTO'
      Origin = 'STATUS_MOVIMENTO'
    end
    object qrMainCLIENTE_ID_DESC: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE_ID_DESC'
      Origin = 'CLIENTE_ID_DESC'
      ProviderFlags = []
      ReadOnly = True
      Size = 84
    end
    object qrMainVENDEDOR_ID_DESC: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VENDEDOR_ID_DESC'
      Origin = 'VENDEDOR_ID_DESC'
      ProviderFlags = []
      ReadOnly = True
      Size = 269
    end
    object qrMainVALOR_FRETE_AGREGADO: TBCDField
      FieldName = 'VALOR_FRETE_AGREGADO'
      Origin = 'VALOR_FRETE_AGREGADO'
      Precision = 18
      Size = 2
    end
    object qrMainVALOR_ABATIDO_FRETE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ABATIDO_FRETE'
      Origin = 'VALOR_ABATIDO_FRETE'
      Precision = 18
      Size = 2
    end
    object qrMainTEXTO_GARANTIA: TWideStringField
      FieldName = 'TEXTO_GARANTIA'
      Origin = 'TEXTO_GARANTIA'
      Size = 1000
    end
  end
  object qrDetail: TFDQuery
    IndexFieldNames = 'PEDIDOS_VENDAS_ID'
    MasterSource = dsMain
    MasterFields = 'ID'
    SQL.Strings = (
      'select'
      '    PVP.PEDIDOS_VENDAS_ID,'
      '    PRODUTOS_ID,'
      '    PRO.DESCRICAO,'
      '    PRO.UNIDADEMEDIDA,'
      '    VALOR_UNITARIO,'
      '    VALOR_DESCONTO,'
      '    VALOR_ACRESCIMO,'
      '    QUANTIDADE,'
      '    VALOR_TOTAL,'
      '    HISTORICO,'
      '    ORDEM,'
      '    LOCALIZACAO,'
      '    PRO.PRECO_VENDA,'
      '    PRO.PRECO_VENDA_PRZ,'
      '    PRO.PRECO_VENDA_ATA,'
      '    PRO.PRECO_VENDA_ATA_PRZ,'
      '    M.razaosocial AS MARCA_DESCRICAO'
      'from'
      '    PEDIDOS_VENDAS_PRODUTOS PVP'
      'join'
      '    PRODUTOS PRO on PRO.ID = PVP.PRODUTOS_ID'
      'left join'
      '    MARCAS M on M.ID = PRO.MARCA_ID  ')
    Left = 42
    Top = 128
    object qrDetailPEDIDOS_VENDAS_ID: TIntegerField
      FieldName = 'PEDIDOS_VENDAS_ID'
      Origin = 'PEDIDOS_VENDAS_ID'
    end
    object qrDetailPRODUTOS_ID: TIntegerField
      FieldName = 'PRODUTOS_ID'
      Origin = 'PRODUTOS_ID'
    end
    object qrDetailDESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qrDetailUNIDADEMEDIDA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADEMEDIDA'
      Origin = 'UNIDADEMEDIDA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qrDetailVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object qrDetailVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qrDetailVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'VALOR_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qrDetailQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object qrDetailVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qrDetailHISTORICO: TWideStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 1000
    end
    object qrDetailORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
    object qrDetailLOCALIZACAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrDetailPRECO_VENDA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrDetailPRECO_VENDA_PRZ: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_VENDA_PRZ'
      Origin = 'PRECO_VENDA_PRZ'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrDetailPRECO_VENDA_ATA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_VENDA_ATA'
      Origin = 'PRECO_VENDA_ATA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrDetailPRECO_VENDA_ATA_PRZ: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_VENDA_ATA_PRZ'
      Origin = 'PRECO_VENDA_ATA_PRZ'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrDetailMARCA_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA_DESCRICAO'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
  end
  object qrSubDetail: TFDQuery
    IndexFieldNames = 'PEDIDOS_VENDAS_ID'
    MasterSource = dsMain
    MasterFields = 'ID'
    SQL.Strings = (
      'select PEDIDOS_VENDAS_PAGAMENTOS.*,'
      
        '       iif(PEDIDOS_VENDAS_PAGAMENTOS.TIPO_TITULO = 0, TIPOS_PAGA' +
        'MENTOS.DESCRICAO, TIPOS_DOCUMENTOS.DESCRICAO) DESCRICAO_PAG_DOC'
      'from PEDIDOS_VENDAS_PAGAMENTOS'
      
        'left join TIPOS_PAGAMENTOS on TIPOS_PAGAMENTOS.ID = PEDIDOS_VEND' +
        'AS_PAGAMENTOS.FORMAS_PAGAMENTOS_ID'
      
        'left join TIPOS_DOCUMENTOS on TIPOS_DOCUMENTOS.ID = PEDIDOS_VEND' +
        'AS_PAGAMENTOS.TIPOS_DOCUMENTOS_ID'
      'where PEDIDOS_VENDAS_PAGAMENTOS.PEDIDOS_VENDAS_ID = :ID   '
      'order by PEDIDOS_VENDAS_PAGAMENTOS.ORDEM')
    Left = 40
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
    object qrSubDetailID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrSubDetailORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
    object qrSubDetailPEDIDOS_VENDAS_ID: TIntegerField
      FieldName = 'PEDIDOS_VENDAS_ID'
      Origin = 'PEDIDOS_VENDAS_ID'
    end
    object qrSubDetailCAIXAS_ID: TIntegerField
      FieldName = 'CAIXAS_ID'
      Origin = 'CAIXAS_ID'
    end
    object qrSubDetailFORMAS_PAGAMENTOS_ID: TIntegerField
      FieldName = 'FORMAS_PAGAMENTOS_ID'
      Origin = 'FORMAS_PAGAMENTOS_ID'
    end
    object qrSubDetailTIPOS_DOCUMENTOS_ID: TIntegerField
      FieldName = 'TIPOS_DOCUMENTOS_ID'
      Origin = 'TIPOS_DOCUMENTOS_ID'
    end
    object qrSubDetailDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qrSubDetailTIPO_TITULO: TIntegerField
      FieldName = 'TIPO_TITULO'
      Origin = 'TIPO_TITULO'
    end
    object qrSubDetailVALOR_PAGAMENTO: TBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Origin = 'VALOR_PAGAMENTO'
      Precision = 18
      Size = 2
    end
    object qrSubDetailHISTORICO: TWideStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object qrSubDetailDESCRICAO_PAG_DOC: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PAG_DOC'
      Origin = 'DESCRICAO_PAG_DOC'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object frxReportMain: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43264.718192893500000000
    ReportOptions.LastChange = 44820.974118842590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      
        '  PEDIDO_ID, DATA_PEDIDO, NOME_EMPRESA, CNPJ_EMPRESA, ENDERECO_E' +
        'MPRESA, TELEFONE,'
      
        '  NOME_CLIENTE, ENDERECO_CLIENTE, BAIRRO_CLIENTE, CIDADE_CLIENTE' +
        ', CEP_CLIENTE, CPF_CLIENTE,'
      
        '  TELEFONE_CLIENTE, OBSERVACOES, NOME_VENDEDOR, TIPO_VENDA, VALO' +
        'R_TOTAL, VALOR_DESCONTO,'
      
        '  PERCENTUAL_DESCONTO, VALOR_ENTRADA, VALOR_LIQUIDO, VALOR_RECEB' +
        'IDO, VALOR_TROCO, CONTEUDO_QUEBRA_LINHA,'
      
        '  TIPO_PEDIDO, INFO_IMPRESSAO, LOGO_EMPRESA, INSTRUCOES, MENSAGE' +
        'M_ORCAMENTO, STATUS_PEDIDO,'
      
        '  NOME_FANTASIA, CAIXA, VALOR_ENTRADA_TROCA, VALOR_SAIDA_TROCA, ' +
        'VALOR_DIFERENCA_TROCA,'
      
        '  APELIDO_CLIENTE, NOME_FANTASIA_CLIENTE, OBS_CLIENTE, PESO_PROD' +
        'UTOS, '
      
        '  LINHA_INSTRUCAO_1, LINHA_INSTRUCAO_2, LINHA_INSTRUCAO_3, GARAN' +
        'TIA, INFOR_ADICIONAIS: string;'
      ''
      'begin'
      '  if <LOGO_EMPRESA> <> '#39#39' then'
      '    picLogo.Picture.LoadFromFile(<LOGO_EMPRESA>);   '
      'end.')
    Left = 152
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDatasetDetail
        DataSetName = 'frxDBDatasetDetail'
      end
      item
        DataSet = frxDBDatasetMain
        DataSetName = 'frxDBDatasetMain'
      end
      item
        DataSet = frxDBDatasetSubDetail
        DataSetName = 'frxDBDatasetSubDetail'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object pgBobina48c: TfrxReportPage
      Visible = False
      PaperWidth = 80.000000000000000000
      PaperHeight = 230.000000000000000000
      PaperSize = 256
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 3.000000000000000000
      EndlessHeight = True
      PrintIfEmpty = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 279.685220000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 2.118120000000000000
          Width = 249.448980000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[TIPO_PEDIDO]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 21.015770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo: [PEDIDO_ID]')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 117.165430000000000000
          Top = 21.015770000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data: [DATA_PEDIDO]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 43.692950000000000000
          Width = 249.448980000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[NOME_EMPRESA][NOME_FANTASIA][CNPJ_EMPRESA][ENDERECO_EMPRESA][TE' +
              'LEFONE]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 49.227833720000000000
          Width = 253.228510000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            
              '[NOME_CLIENTE][ENDERECO_CLIENTE][BAIRRO_CLIENTE][CIDADE_CLIENTE]' +
              '[CEP_CLIENTE][CPF_CLIENTE][TELEFONE_CLIENTE][OBS_CLIENTE][NOME_V' +
              'ENDEDOR][CAIXA]'
            '[OBSERVACOES]'
            '[frxDBDatasetMain."TEXTO_GARANTIA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 38.354360000000000000
        Top = 139.842610000000000000
        Width = 279.685220000000000000
        object Line4: TfrxLineView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 251.338582680000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd.')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 49.133890000000000000
          Top = 7.559060000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Top = 34.574830000000000000
          Width = 251.338582680000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 88.913551020000000000
          Top = 18.897637795275600000
          Width = 29.608990340000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 121.064652200000000000
          Top = 18.558666950000000000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Un.')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 141.978989320000000000
          Top = 18.897650000000000000
          Width = 36.540800680000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'V. Unit.')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 180.008425240000000000
          Top = 18.897650000000000000
          Width = 33.388520340000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Desc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 215.316010470000000000
          Top = 18.897650000000000000
          Width = 41.692029530000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 7.906976740000000000
          Top = 20.157390000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterData: TfrxMasterData
        FillType = ftBrush
        Height = 22.999213900000000000
        Top = 200.315090000000000000
        Width = 279.685220000000000000
        DataSet = frxDBDatasetDetail
        DataSetName = 'frxDBDatasetDetail'
        RowCount = 0
        object mmProduto: TfrxMemoView
          Left = 49.133890000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsProdutoPedidoPRODUTO_ID: TfrxMemoView
          Left = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DataField = 'PRODUTOS_ID'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."PRODUTOS_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsProdutoPedidoQUANTIDADE: TfrxMemoView
          Left = 87.557618810000000000
          Top = 11.338590000000000000
          Width = 30.992125984252000000
          Height = 11.338590000000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."QUANTIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 121.708720000000000000
          Top = 11.338582680000000000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          DataField = 'UNIDADEMEDIDA'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."UNIDADEMEDIDA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 141.978989320000000000
          Top = 11.321640850000000000
          Width = 36.879783730000000000
          Height = 11.338590000000000000
          DataField = 'VALOR_UNITARIO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_UNITARIO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 181.025374390000000000
          Top = 11.464723230000000000
          Width = 32.371571190000000000
          Height = 11.338590000000000000
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_DESCONTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 215.316010470000000000
          Top = 11.338590000000000000
          Width = 41.692029530000000000
          Height = 11.338590000000000000
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetDetailMARCA_DESCRICAO: TfrxMemoView
          Left = 7.355143880000000000
          Top = 11.338582680000000000
          Width = 78.283812030000000000
          Height = 11.338582680000000000
          DataField = 'MARCA_DESCRICAO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."MARCA_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object FooterQtdeItens: TfrxFooter
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 245.669450000000000000
        Width = 279.685220000000000000
        object Memo79: TfrxMemoView
          Left = 7.559060000000000000
          Width = 147.401670000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Qtd. Itens:[COUNT(MasterData)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 267.905494720000000000
        Top = 396.850650000000000000
        Width = 279.685220000000000000
        Stretched = True
        object Memo71: TfrxMemoView
          Align = baCenter
          Left = 8.000000000000000000
          Top = 3.779530000000000000
          Width = 263.685220000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Fill.BackColor = clMenuText
          HAlign = haCenter
          Memo.UTF8W = (
            '[STATUS_PEDIDO]')
          ParentFont = False
          WordWrap = False
        end
        object mmTipoVenda: TfrxMemoView
          Left = 75.590600000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo de Venda:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorTotal: TfrxMemoView
          Left = 75.590600000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorDesconto: TfrxMemoView
          Left = 56.692950000000000000
          Top = 68.031540000000000000
          Width = 113.385900000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Desconto:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorLiquido: TfrxMemoView
          Left = 75.590600000000000000
          Top = 90.708668740000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor L'#237'quido:')
          ParentFont = False
          WordWrap = False
        end
        object dtTipoVenda: TfrxMemoView
          Left = 177.637910000000000000
          Top = 22.677180000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TIPO_VENDA]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorTotal: TfrxMemoView
          Left = 177.637910000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
          Height = 11.338565590000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<frxDBDatasetMain."VALOR_BRUTO">+<frxDBDatasetMain."VALOR_FRETE' +
              '_AGREGADO">]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorDesconto: TfrxMemoView
          Left = 177.637910000000000000
          Top = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_DESCONTO"]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorLiquido: TfrxMemoView
          Left = 177.637910000000000000
          Top = 90.708668740000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_LIQUIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmInstrucoes: TfrxMemoView
          Left = 15.118120000000000000
          Top = 146.503824720000000000
          Width = 249.448980000000000000
          Height = 42.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[LINHA_INSTRUCAO_1][LINHA_INSTRUCAO_2][LINHA_INSTRUCAO_3]'
            '[MENSAGEM_ORCAMENTO]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mmAssinatura: TfrxMemoView
          Left = 15.118120000000000000
          Top = 196.299124720000000000
          Width = 249.448980000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Assinatura do Cliente')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object mmQuebra: TfrxMemoView
          Align = baCenter
          Left = 15.118120000000000000
          Top = 215.228314720000000000
          Width = 249.448980000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CONTEUDO_QUEBRA_LINHA] '
            '_')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmValorRecebido: TfrxMemoView
          Left = 75.590600000000000000
          Top = 102.047251420000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Recebido:')
          ParentFont = False
          WordWrap = False
        end
        object dtValorRecebido: TfrxMemoView
          Left = 177.637910000000000000
          Top = 102.047251420000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_RECEBIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmTroco: TfrxMemoView
          Left = 75.590600000000000000
          Top = 113.385834090000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Troco:')
          ParentFont = False
          WordWrap = False
        end
        object dtTroco: TfrxMemoView
          Left = 177.637910000000000000
          Top = 113.385834090000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_TROCO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmPercentualDesconto: TfrxMemoView
          Left = 56.692950000000000000
          Top = 79.370130000000000000
          Width = 113.385900000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Percentual Desconto:')
          ParentFont = False
          WordWrap = False
        end
        object dtPercentualDesconto: TfrxMemoView
          Left = 177.637910000000000000
          Top = 79.370130000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxdbdsProdutoPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[Trunc(<frxDBDatasetMain."VALOR_DESCONTO"> / <SUM(<frxDBDatasetD' +
              'etail."VALOR_TOTAL">,MasterData,2)> * 100)] %')
          ParentFont = False
          WordWrap = False
        end
        object mmValorFrete: TfrxMemoView
          Left = 75.611008160000000000
          Top = 45.354316060000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Frete:')
          ParentFont = False
          WordWrap = False
        end
        object dtValorFrete: TfrxMemoView
          Left = 177.658318160000000000
          Top = 45.354316060000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_FRETE_AGREGADO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 75.590600000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor dos Produtos:')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 177.637910000000000000
          Top = 34.015770000000000000
          Width = 71.811070000000000000
          Height = 11.338565590000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetDetail."VALOR_TOTAL">,MasterData,2)]')
          ParentFont = False
          WordWrap = False
        end
      end
      object HeaderTitulos: TfrxHeader
        FillType = ftBrush
        Height = 17.007876460000000000
        Top = 283.464750000000000000
        Width = 279.685220000000000000
        OnBeforePrint = 'Header2OnBeforePrint'
        object Line7: TfrxLineView
          Left = 7.559060000000000000
          Top = 3.779530000000020000
          Width = 251.338582680000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo30: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Parcela')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 158.740260000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor R$')
          ParentFont = False
          WordWrap = False
        end
        object mmTipoDocumento: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 13.228346456692900000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de DOC./PAG.')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterDataTitulos: TfrxMasterData
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 325.039580000000000000
        Width = 279.685220000000000000
        DataSet = frxDBDatasetSubDetail
        DataSetName = 'frxDBDatasetSubDetail'
        RowCount = 0
        object frxdbdsPagamentosREFERENCIA: TfrxMemoView
          Left = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."HISTORICO"]')
          ParentFont = False
        end
        object frxdbdsPagamentosDATA: TfrxMemoView
          Left = 158.740260000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."DATA"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsPagamentosVALOR_PAGAR: TfrxMemoView
          Left = 211.653680000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."VALOR_PAGAMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmTipoDocData: TfrxMemoView
          Left = 56.692950000000000000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DataField = 'DESCRICAO_PAG_DOC'
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."DESCRICAO_PAG_DOC"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
    object pgPadraoA4: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 120.944960000000000000
        Width = 755.906000000000000000
        PrintChildIfInvisible = True
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 377.953000000000000000
          Width = 377.953000000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[TIPO_PEDIDO]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 419.527830000000000000
          Top = 30.236240000000000000
          Width = 336.378170000000000000
          Height = 64.252010000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[NOME_EMPRESA][NOME_FANTASIA][CNPJ_EMPRESA][ENDERECO_EMPRESA][TE' +
              'LEFONE]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo39: TfrxMemoView
          Align = baLeft
          Left = 117.165430000000000000
          Top = 34.015750470000000000
          Width = 309.921460000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[STATUS_PEDIDO], '
            'Data: [DATA_PEDIDO]'
            'Forma de Pagamento: [TIPO_VENDA]'
            '[NOME_VENDEDOR]'
            '[CAIXA]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo102: TfrxMemoView
          Align = baLeft
          Left = 117.165430000000000000
          Width = 211.653680000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#176': [PEDIDO_ID]')
          ParentFont = False
        end
        object picLogo: TfrxPictureView
          Left = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 102.051880000000000000
          Center = True
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 36.464591340000000000
        Top = 393.071120000000000000
        Width = 755.906000000000000000
        PrintChildIfInvisible = True
        object Memo40: TfrxMemoView
          Left = 7.559060000000000000
          Top = 20.346471340000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'C'#211'D.')
          ParentFont = False
        end
        object MemoDescricaoProduto: TfrxMemoView
          Left = 60.472480000000000000
          Top = 20.566941340000000000
          Width = 270.064574240000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 468.661720000000000000
          Top = 21.165354330000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'UND.')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 510.236550000000000000
          Top = 21.165354330000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'UNIT. R$')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 631.181510000000000000
          Top = 21.165354330000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'QTD.')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 687.874460000000000000
          Top = 21.165354330000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL R$')
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 7.559055120000000000
          Width = 743.811016300000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'ITENS DO PEDIDO')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 570.709030000000000000
          Top = 21.165354330000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'DESC. R$')
          ParentFont = False
          WordWrap = False
        end
        object MemoLOCALIZACAO: TfrxMemoView
          Left = 336.800000000000000000
          Top = 20.409448820000000000
          Width = 123.162248660000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'MARCA')
          ParentFont = False
        end
      end
      object FooterRESUMO: TfrxFooter
        FillType = ftBrush
        Height = 175.944336560000000000
        Top = 491.338900000000000000
        Width = 755.906000000000000000
        PrintChildIfInvisible = True
        Stretched = True
        object Memo54: TfrxMemoView
          Left = 517.354670000000000000
          Top = 12.779530000000000000
          Width = 234.330860000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'RESUMO FINANCEIRO')
          ParentFont = False
        end
        object mmTotRegistros: TfrxMemoView
          Left = 507.212598430000000000
          Top = 32.708720000000000000
          Width = 151.181102360000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL REGISTROS:')
          ParentFont = False
        end
        object mmTotReg: TfrxMemoView
          Left = 665.197280000000000000
          Top = 33.031540000000000000
          Width = 71.811070000000000000
          Height = 13.228344020000000000
          DataSetName = 'frxdbdsProdutoPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object mmTipoVendaA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 46.110236220000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'TIPO DE VENDA:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorTotalA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 85.795275590000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR TOTAL:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorDescontoA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 99.149660000000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR DESCONTO:')
          ParentFont = False
          WordWrap = False
        end
        object mmValorLiquidoA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 125.480314960000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR LIQUIDO:')
          ParentFont = False
          WordWrap = False
        end
        object dtTipoVendaA4: TfrxMemoView
          Left = 665.378170000000000000
          Top = 46.110236220000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TIPO_VENDA]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorTotalA4: TfrxMemoView
          Left = 665.378170000000000000
          Top = 85.795275590000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<frxDBDatasetMain."VALOR_BRUTO">+<frxDBDatasetMain."VALOR_FRETE' +
              '_AGREGADO">]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorDescontoA4: TfrxMemoView
          Left = 665.378170000000000000
          Top = 99.149660000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_DESCONTO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmValorRecebidoA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 138.708661420000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR RECEBIDO:')
          ParentFont = False
          WordWrap = False
        end
        object mmTrocoA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 151.937007870000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'TROCO:')
          ParentFont = False
          WordWrap = False
        end
        object mmPercentualDescontoA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 112.251966060000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'PERCENTUAL DESCONTO:')
          ParentFont = False
          WordWrap = False
        end
        object dtPercentualDescontoA4: TfrxMemoView
          Left = 665.196850390000000000
          Top = 112.251968500000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxdbdsProdutoPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[Trunc(<frxDBDatasetMain."VALOR_DESCONTO"> / <SUM(<frxDBDatasetD' +
              'etail."VALOR_TOTAL">,MasterData1,2)> * 100)] %')
          ParentFont = False
          WordWrap = False
        end
        object dtValorLiquidoA4: TfrxMemoView
          Left = 665.196850390000000000
          Top = 125.480314960000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_LIQUIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object dtValorRecebidoA4: TfrxMemoView
          Left = 665.196850390000000000
          Top = 138.708661420000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_RECEBIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object dtTrocoA4: TfrxMemoView
          Left = 665.196850390000000000
          Top = 151.937007870000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_TROCO"]')
          ParentFont = False
          WordWrap = False
        end
        object mmValorFreteA4: TfrxMemoView
          Left = 507.212598430000000000
          Top = 72.188976380000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR FRETE:')
          ParentFont = False
          WordWrap = False
        end
        object dtValorFreteA4: TfrxMemoView
          Left = 665.196850390000000000
          Top = 72.188976380000000000
          Width = 71.811023620000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetMain."VALOR_FRETE_AGREGADO"]')
          ParentFont = False
          WordWrap = False
        end
        object ShapeAssinaturaA4: TfrxShapeView
          Left = 10.338590000000000000
          Top = 15.118120000000000000
          Width = 351.496290000000000000
          Height = 151.181200000000000000
          Curve = 2
          Frame.Color = 15000804
          Shape = skRoundRectangle
        end
        object mmAreaAssinaturaA4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 17.385831650000000000
          Width = 219.212740000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxdbdsPedidoVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #193'rea de Assinatura')
          ParentFont = False
        end
        object mmAssinaturaA4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 140.504020000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxdbdsPedidoVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Assinatura do Cliente')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 507.212598430000000000
          Top = 58.960629920000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR DOS PRODUTOS:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 665.196850390000000000
          Top = 58.960629920000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetDetail."VALOR_TOTAL">,MasterData1,2)]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 997.795920000000000000
        Width = 755.906000000000000000
        object Memo72: TfrxMemoView
          Left = 551.811380000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina[Page#] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo73: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[INFO_IMPRESSAO]')
          ParentFont = False
          WordWrap = False
        end
      end
      object HeaderCliente: TfrxHeader
        FillType = ftBrush
        Height = 62.031540000000000000
        Top = 287.244280000000000000
        Width = 755.906000000000000000
        PrintChildIfInvisible = True
        Stretched = True
        object MemoCliente: TfrxMemoView
          Left = 11.338590000000000000
          Top = 24.456710000000000000
          Width = 480.000310000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo36OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[NOME_CLIENTE][APELIDO_CLIENTE][CPF_CLIENTE][ENDERECO_CLIENTE][B' +
              'AIRRO_CLIENTE] [CIDADE_CLIENTE][CEP_CLIENTE] [TELEFONE_CLIENTE] ' +
              '[INFOR_ADICIONAIS]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo37: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 744.567410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8W = (
            'Dados do Cliente')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 498.897960000000000000
          Top = 24.236240000000000000
          Width = 257.008040000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' [OBS_CLIENTE]')
          ParentFont = False
        end
      end
      object ReportTitleCanhoto: TfrxReportTitle
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Visible = False
        Width = 755.906000000000000000
        object Shape73: TfrxShapeView
          Width = 648.945265120000000000
          Height = 30.236227800000000000
          Frame.Color = clSilver
        end
        object Shape75: TfrxShapeView
          Top = 30.236220472440900000
          Width = 119.811065120000000000
          Height = 34.015757800000000000
          Frame.Color = clSilver
        end
        object Memo103: TfrxMemoView
          Left = 83.149660000000000000
          Width = 355.275820000000000000
          Height = 13.228346456692900000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[NOME_EMPRESA] - CNPJ: [CNPJ_EMPRESA]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 13.228346456692900000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Recebemos de ')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 533.693260000000000000
          Width = 113.385900000000000000
          Height = 13.228344020000000000
          DataSetName = 'frxdbdsProdutoPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'R$ [VALOR_LIQUIDO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo106: TfrxMemoView
          Left = 533.693260000000000000
          Top = 13.118120000000000000
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DATA_PEDIDO]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 445.984540000000000000
          Width = 86.929190000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Valor do Pedido:')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 445.984540000000000000
          Top = 13.118120000000000000
          Width = 86.929190000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Criado Em:')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 3.779530000000000000
          Top = 13.118120000000000000
          Width = 317.480520000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'os produtos referentes ao pedido indicado '#224' direita.')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Data de recebimento.')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 4.157480314960630000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 17.007876460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '__/__/____')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 128.504020000000000000
          Top = 30.236240000000000000
          Width = 325.039580000000000000
          Height = 32.125996460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Assinatura do recebedor.')
          ParentFont = False
        end
        object Shape74: TfrxShapeView
          Left = 648.944881890000000000
          Width = 100.913385830000000000
          Height = 63.874015750000000000
          Frame.Color = clSilver
        end
        object Memo38: TfrxMemoView
          Left = 653.858690000000000000
          Top = 0.779530000000000000
          Width = 94.488250000000000000
          Height = 47.244116460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[TIPO_PEDIDO]'
            'N'#176': [PEDIDO_ID]')
          ParentFont = False
        end
        object Shape76: TfrxShapeView
          Left = 120.188976380000000000
          Top = 30.236240000000000000
          Width = 528.000305120000000000
          Height = 34.015757800000000000
          Frame.Color = clSilver
        end
        object Line2: TfrxLineView
          Left = 16.897650000000000000
          Top = 71.811070000000000000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Style = fsDashDot
          Frame.Typ = [ftTop]
        end
        object Picture1: TfrxPictureView
          Left = 3.000000000000000000
          Top = 66.031540000000000000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 453.543600000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetDetail
        DataSetName = 'frxDBDatasetDetail'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object frxdbdsProdutoPedidoID: TfrxMemoView
          Left = 6.779530000000000000
          Top = 0.779530000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          DataField = 'PRODUTOS_ID'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."PRODUTOS_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsProdutoPedidoDESCRICAOA4: TfrxMemoView
          Left = 61.692950000000000000
          Top = 1.000000000000000000
          Width = 268.870356770000000000
          Height = 13.228346460000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsProdutoPedidoUNIDADEMEDIDA: TfrxMemoView
          Left = 468.661720000000000000
          Top = 0.889763780000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataField = 'UNIDADEMEDIDA'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."UNIDADEMEDIDA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 510.236550000000000000
          Top = 0.889763780000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          DataField = 'VALOR_UNITARIO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_UNITARIO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 629.181510000000000000
          Top = 0.889763780000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."QUANTIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 689.874460000000000000
          Top = 0.889763780000000000
          Width = 60.472480000000000000
          Height = 13.228346460000000000
          DataField = 'VALOR_TOTAL'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 570.709030000000000000
          Top = 0.755905510000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          DataField = 'VALOR_DESCONTO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetDetail."VALOR_DESCONTO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetDetailLOCALIZACAO: TfrxMemoView
          Left = 336.600000000000000000
          Top = 1.133858270000000000
          Width = 124.050650000000000000
          Height = 13.228346460000000000
          DataField = 'MARCA_DESCRICAO'
          DataSet = frxDBDatasetDetail
          DataSetName = 'frxDBDatasetDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetDetail."MARCA_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterData_do_Header_cliente: TfrxMasterData
        FillType = ftBrush
        Top = 370.393940000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetDetail
        DataSetName = 'frxDBDatasetDetail'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 691.653990000000000000
        Width = 755.906000000000000000
        object Memo62: TfrxMemoView
          Left = 4.425519060000000000
          Width = 743.811023620000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'VENCIMENTOS')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 3.779530000000000000
          Top = 20.566941340000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'PARCELA')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 143.622140000000000000
          Top = 20.409448820000000000
          Width = 249.448980000000000000
          Height = 15.118112680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'TIPO DE PAG. / DOC.')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 638.740570000000000000
          Top = 20.409448820000000000
          Width = 109.606370000000000000
          Height = 15.118112680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR PARCELA')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 494.677490000000000000
          Top = 20.409448820000000000
          Width = 128.504020000000000000
          Height = 15.118112680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 15000804
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 789.921770000000000000
        Width = 755.906000000000000000
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 14.118110240000000000
        Top = 752.126470000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetSubDetail
        DataSetName = 'frxDBDatasetSubDetail'
        RowCount = 0
        object frxdbdsPagamentosREFERENCIA1: TfrxMemoView
          Left = 4.338590000000000000
          Top = 0.889763780000000000
          Width = 128.504020000000000000
          Height = 13.228346460000000000
          DataField = 'HISTORICO'
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."HISTORICO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxdbdsPagamentosDESCRICAO: TfrxMemoView
          Left = 145.181200000000000000
          Top = 0.889763780000000000
          Width = 336.378170000000000000
          Height = 13.228346460000000000
          DataField = 'DESCRICAO_PAG_DOC'
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."DESCRICAO_PAG_DOC"]')
          ParentFont = False
        end
        object frxdbdsPagamentosDATA1: TfrxMemoView
          Left = 494.897960000000000000
          Top = 0.889763780000000000
          Width = 124.724490000000000000
          Height = 13.228346460000000000
          DataField = 'DATA'
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."DATA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 636.520100000000000000
          Top = 0.889763780000000000
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          DataField = 'VALOR_PAGAMENTO'
          DataSet = frxDBDatasetSubDetail
          DataSetName = 'frxDBDatasetSubDetail'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetSubDetail."VALOR_PAGAMENTO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Height = 120.944896540000000000
        Top = 816.378480000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetMain
        DataSetName = 'frxDBDatasetMain'
        RowCount = 1
        Stretched = True
        object frxdbdsPedidoVendaOBSERVACOES: TfrxMemoView
          Left = 5.779530000000000000
          Top = 26.118120000000000000
          Width = 374.173470000000000000
          Height = 83.149660000000000000
          StretchMode = smActualHeight
          DataField = 'OBSERVACOES'
          DataSet = frxDBDatasetMain
          DataSetName = 'frxDBDatasetMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetMain."OBSERVACOES"]')
          ParentFont = False
          WordBreak = True
          Wysiwyg = False
        end
        object Memo66: TfrxMemoView
          Left = 6.779530000000000000
          Top = 10.000000000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxdbdsPedidoVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Observa'#231#245'es do Pedido:')
          ParentFont = False
        end
        object dtGarantiaA4: TfrxMemoView
          Left = 383.732530000000000000
          Top = 26.118120000000000000
          Width = 366.614410000000000000
          Height = 83.149660000000000000
          Visible = False
          StretchMode = smActualHeight
          DataField = 'TEXTO_GARANTIA'
          DataSet = frxDBDatasetMain
          DataSetName = 'frxDBDatasetMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetMain."TEXTO_GARANTIA"]')
          ParentFont = False
          WordBreak = True
          Wysiwyg = False
        end
        object mmGarantiaA4: TfrxMemoView
          Left = 384.732530000000000000
          Top = 10.000000000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Visible = False
          DataSetName = 'frxdbdsPedidoVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Garantia do Cliente:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetMain: TfrxDBDataset
    UserName = 'frxDBDatasetMain'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'USUARIO_ID=USUARIO_ID'
      'VENDEDOR_ID=VENDEDOR_ID'
      'CLIENTE_ID=CLIENTE_ID'
      'FILIAL_ID=FILIAL_ID'
      'TIPO_PAGAMENTO=TIPO_PAGAMENTO'
      'STATUS=STATUS'
      'DATA_CRIACAO=DATA_CRIACAO'
      'DATA_CONCLUSAO=DATA_CONCLUSAO'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_LIQUIDO=VALOR_LIQUIDO'
      'VALOR_RECEBIDO=VALOR_RECEBIDO'
      'VALOR_TROCO=VALOR_TROCO'
      'PEDIDO_ORIGINAL=PEDIDO_ORIGINAL'
      'INTEGRACAO=INTEGRACAO'
      'OBSERVACOES=OBSERVACOES'
      'STATUS_MOVIMENTO=STATUS_MOVIMENTO'
      'CLIENTE_ID_DESC=CLIENTE_ID_DESC'
      'VENDEDOR_ID_DESC=VENDEDOR_ID_DESC'
      'VALOR_FRETE_AGREGADO=VALOR_FRETE_AGREGADO'
      'VALOR_ABATIDO_FRETE=VALOR_ABATIDO_FRETE'
      'TEXTO_GARANTIA=TEXTO_GARANTIA')
    DataSet = qrMain
    BCDToCurrency = False
    Left = 272
    Top = 24
  end
  object imgAcoes: TcxImageList
    SourceDPI = 96
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 1048968
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000040000000800000009000000090000
          000A0000000A0000000B0000000B0000000B0000000B0000000B0000000B0000
          000B000000080000000300000000000000000000000000000000000000000000
          00010000000100000001000000043628225B6E5045AF6E4F45B06E4F44B06E4F
          43B16D4E43B16D4E43B16D4D42B16C4D42B16C4C41B26C4C41B26C4B41B26B4B
          40B14F372F890000000900000002000000010000000100000000000000010000
          000400000007000000090000000F705247B0F8F1ECFFF8F0EDFFF7F0EDFFF7F0
          EBFFF6EFEAFFF5EDE8FFF5EDE7FFF5ECE6FFF5ECE6FFF5ECE5FFF5ECE5FFF5EC
          E6FFA27364FF000000170000000D0000000A0000000700000003000000081A12
          0F3C33231E6734241F6C32231D707E5C4ED1F9F3F0FFE0B27BFFE1B37CFFE0B3
          7CFFE0B178FFDDA96EFFDCA66AFFDCA569FFDBA467FFDAA365FFDAA162FFECD2
          BAFF9D6E5FFF2A1B167A2D1D17722D1D17701F14105404030218000000138866
          59D3B89282FDC6A797FFBFA08FFFAB8271FFFAF5F2FFE3BA86FFE7C08DFFE7BF
          8CFFE6BD8AFFE3B57EFFE1B075FFE0AF74FFDFAD72FFDFAC6FFFDCA769FFECD4
          BCFF996B5BFFB39483FFBE9E8EFFB28B7AFF936F5FE72519155400000019B189
          78FFCBAC9CFFDFCABBFFDDC8B9FFBD9A8BFFFBF7F4FFE6C08EFFE9C596FFE9C4
          95FFE9C493FFE6BE8AFFE1B379FFE1B177FFE0B075FFE0AE72FFDDA96BFFEED6
          BEFFA07364FFDAC8BBFFDCC6B7FFC9AA99FFB79180FF35251F6E00000019B58C
          7CFFCFB2A3FFE4D2C6FFCBB1A1FF9A6D5BFFD0BDB5FFC49A74FFC59E79FFC49E
          79FFC49D78FFC39C75FFBF9063FFBF9062FFBE8E60FFBD8C5FFFBC885AFFC7A6
          91FF8E604EFFB39384FFE2CEC1FFCDB0A1FFBB9485FF3626206F00000017B791
          81FFD3B9ACFFEADBD2FFDECCBFFFC6ADA0FFC3AA9CFFC3A99BFFC3A99CFFC3A9
          9BFFC3AA9CFFC3A99CFFC3AA9BFFC3A99CFFC3A99BFFC3A99BFFC3A99CFFC3AA
          9BFFC3AA9CFFD5C0B4FFE7D7CBFFD1B7A9FFBD9A8BFF3627216D00000015BB95
          86FFD8C1B6FFEFE5DDFFECE0D7FFECE0D7FFECE0D8FFECE0D7FFECE0D7FFECE0
          D7FFECE0D7FFECE0D7FFECE0D7FFECE0D7FFECE0D7FFECE0D7FFECE0D7FFECE0
          D7FFECE0D7FFECE0D8FFECE0D7FFD6BEB3FFC09F91FF3727226C00000013BE9A
          8CFFDDCAC0FFF5EDE8FFF1E9E3FFF2EAE4FFF3ECE5FFF3ECE6FFF3ECE6FFF3EC
          E6FFF3ECE6FFF3ECE6FFF3ECE6FFF3ECE6FFF3EBE6FFF3EBE6FFF3ECE6FFF3EB
          E5FFF2EBE5FFF2E9E2FFF1E9E2FFDBC6BDFFC4A599FF3728236B00000011C3A1
          93FFE1D0C9FFF8F4F0FFF3EEE9FFC5BAB4FF97857EFF8B7972FF8B7972FF8B78
          71FF8B7872FF8B7871FF8A7871FF8A7871FF897771FF897771FF897670FF907E
          78FFAEA09AFFF0EAE6FFF6F0ECFFDFCDC5FFC9ACA0FF392A25690000000FC7A7
          9AFFE6D7D1FFFBF9F7FFB8ACA7FF674B42FF6B4E44FF6D4F45FF6E4F45FF6E4F
          45FF6D4F45FF6D4F45FF6D4F45FF6D4F45FF6D4F45FF6D4F45FF6D4F45FF6C4E
          44FF65483EFF8B7972FFF1ECEAFFE4D4CDFFCEB2A9FF3B2C27680000000DCBAE
          A1FFE9DDD7FFFDFCFBFF7F6A60FF795B51FF7B5D52FF7D5F54FF7D6054FF7E60
          55FF806256FF806257FF806256FF806257FF806256FF7F6155FF7D5F54FF7D5F
          54FF7B5D52FF785E53FFD2CAC6FFE7DAD4FFD2B9AFFF3C2F29670000000BD0B4
          A7FFECE1DDFFFEFEFDFF806658FFA58777FFA68777FFA98A79FFA88A79FFAA8A
          7AFFAC8C7BFFAB8C7BFFAB8C7BFFAB8C7BFFAC8C7BFFAA8B7AFFA98A79FFA98A
          79FFA68877FF917365FFCBC2BEFFE9DDD9FFD6BFB7FF3E312B6500000009CCB4
          AAF6EFE7E3FFFFFEFEFF977C6CFF8E6F62FF71544AFF71534AFF705349FF7053
          49FF705349FF705348FF6F5248FF6F5248FF6E5147FF6E5147FF6E5146FF6E50
          46FF6D4F45FFAC8E7DFFD2C9C5FFECE2DDFFDAC7C0FC3D312C5F000000058D7D
          76ABEDE4E0FDFDFBFBFFA08674FFB78E7CFFF3EAE5FFEEE3DCFFEEE2DBFFEDE2
          DCFFEDE1DAFFEDE1DAFFEDE0D9FFEDE0D9FFECDFD8FFECDFD9FFECDFD8FFEEE2
          DCFFA37464FFB29582FFD2C8C3FFF1E9E5FFB3A199D6211B193700000002211D
          1B2D8C7D76A7CFBBB2EE9A8273FFAE8A79FFF4EDE9FFF0E6E0FFF0E5DFFFEFE4
          E0FFEFE4DFFFEFE4DDFFEEE3DDFFEFE3DDFFEEE2DCFFEEE1DCFFEEE1DBFFF0E5
          DFFFA77A6AFF9D8476FFB59F94F4A6948BCB372F2B500403030B000000000000
          000100000003000000050000000E795E54B1F6F0EDFFF2E9E4FFF2E9E4FFF1E8
          E3FFF2E8E3FFF1E7E2FFF0E7E2FFF1E7E1FFF0E6E0FFF0E6E0FFF0E5DFFFF2E8
          E3FFAE8373FF0000001E0000000F000000090000000400000001000000000000
          00000000000100000001000000077D6359AEF8F4F1FFF5EDE9FFF4ECE8FFF4EC
          E8FFF4ECE7FFF4EBE6FFF3EAE6FFF2EAE5FFF3E9E5FFF2E9E4FFF2E8E3FFF4EC
          E8FFB38B7CFF0000001200000004000000010000000100000000000000000000
          000000000000000000000000000680695EADFAF6F4FFF7F0EDFFF6EFECFFF6EF
          ECFFF6EFEBFFF6EEEAFFF5EEEAFFF5EEEAFFF5EDE9FFF4EDE8FFF4ECE8FFF5EF
          ECFFBA9485FF0000000E00000002000000000000000000000000000000000000
          0000000000000000000000000004846D63ACFAF8F7FFF8F4F1FFF9F3F0FFF8F2
          F0FFF7F2EFFFF7F2EFFFF7F2EFFFF7F2EEFFF7F0EDFFF7F0EDFFF6EFECFFF8F3
          F0FFC09C8DFF0000000D00000001000000000000000000000000000000000000
          0000000000000000000000000004877167ACFDFAF9FFFBF7F5FFFAF6F4FFFAF6
          F3FFF9F6F3FFF9F5F2FFF9F5F2FFF9F5F2FFF8F4F1FFF9F4F0FFF8F3F0FFF9F6
          F3FFC5A395FF0000000C00000001000000000000000000000000000000000000
          000000000000000000000000000389756BABFEFEFEFFFEFDFCFFFEFCFCFFFEFC
          FCFFFDFCFCFFFDFCFBFFFDFCFBFFFDFCFBFFFDFCFBFFFDFCFBFFFDFBFBFFFDFC
          FCFFCAAA9BFF0000000900000001000000000000000000000000000000000000
          000000000000000000000000000267585180D1B3A5FFD1B3A5FFD1B3A4FFD0B2
          A4FFD1B2A4FFCFB2A3FFCFB2A3FFCFB1A3FFCFB1A2FFCFB0A2FFCEB0A2FFCEAF
          A1FF998277C10000000500000001000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000100000001000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0001000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000040000000700000006000000030000
          0000000000000000000000000000000000000000000000000002000000060000
          0007000000050000000100000000000000000000000000000000000000000000
          00000000000000000001000000050000000F0605153C04030E2E0000000B0000
          0003000000000000000000000000000000000000000200000009020207200605
          153C000000110000000700000002000000000000000000000000000000000000
          000000000001000000050000001009061C4E262586DA1E1C67B504030E320000
          000C000000040000000100000000000000020000000A000000161513498F2625
          86DA0D092A6A0000001300000007000000010000000000000000000000000000
          0000000000040000000D07051541272787DA333FCFFF323BC3FF1E1B64B70000
          001A0000000C00000003000000020000000900000016140F40923237B7FF333F
          CFFF3133ABFF0D0A2B6A00000011000000050000000100000000000000000000
          0001000000050706173A2A2C86CE3844CAFF3644D0FF3644D0FF363FC2FF201F
          67B705040F320000000E0000000C0202082318164C90353DBAFF3744D1FF3644
          D0FF3746D1FF3137A1E6100F3363000000070000000100000000000000000000
          000000000004161345864854C8FF4658DBFF3C4CD3FF3C4AD2FF3C4BD3FF3B48
          C8FF23246FB5050410360000001C19194F903640B5F33C4BD3FF3C4AD2FF3C4B
          D3FF4252D7FF4C5CD5FF26266DB0000000070000000100000000000000000000
          00000000000100000006292A71AE5768DAFF4C5DDBFF4352D6FF4251D5FF4251
          D5FF424ECCFF23246FB916144A963F48C1FF4352D5FF4251D5FF4352D5FF495A
          D9FF5C71E6FF3B4199D708071931000000020000000000000000000000000000
          00000000000000000001050511222F3378AD5E73DCFF5469DEFF4A5CD9FF4859
          D8FF485AD8FF4451CAFF424CC4FF485AD8FF4859D8FF485AD8FF5164DDFF5C71
          DEFF3E459CD60A0A213F00000002000000000000000000000000000000000000
          0000000000000000000000000002050511222D3178AE6277DAFF5D72E1FF5062
          DBFF4E61DAFF4E61DAFF4E61DAFF4E61DAFF4F62DBFF576CDEFF657CE0FF3D47
          97CA08081A310000000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000830367CB06B82DFFF5B71
          E0FF5569DDFF5569DDFF5569DDFF5569DDFF596EDFFF718BE8FF4753A4D80809
          1C33000000020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000A09091D3F414BA5DA6178
          E2FF5C72E1FF5C72E1FF5C72E1FF5C72E1FF6076E2FF5464CCFF11123A680000
          000E000000030000000000000000000000000000000000000000000000000000
          00000000000000000000000000020000000A000000162227618F5667CBF3647B
          E4FF637AE3FF637AE3FF637AE3FF637AE3FF647BE4FF6075DDFF323A85B60607
          15320000000C0000000400000001000000000000000000000000000000000000
          0000000000000000000200000009000000161D1F60925F73DAFF6A83E6FF6982
          E6FF6A83E6FF6F89E8FF718BE8FF6A84E7FF6982E6FF6982E6FF657CE1FF3138
          87B70000001A0000000C00000003000000000000000000000000000000000000
          0000000000020000000803040B22252C67906579DDFF718BE9FF708AE9FF718B
          E9FF7D98ECFF8AA4EBFF8AA3EAFF849EECFF738DE9FF708AE9FF708AE9FF6980
          E1FF343C8BB7070817320000000C000000030000000000000000000000000000
          00010000000500000010272E6B8E6579D6F37791EBFF7690EBFF7792EBFF839C
          EDFF96ADEEFF5764ACCB3D468EB090A5EBFF8BA4EFFF7892EBFF7690EBFF7691
          EBFF7189E6FF3A4490B50708172E000000060000000100000000000000000000
          0001000000051F2569888194E8FF839EEEFF7A97EDFF7B98EDFF87A2EFFFABC1
          F4FF626EBBD70A0C233300000008404992AF9EB1EFFF8CA6F0FF7C98EDFF7A97
          EDFF7D99EDFF889EECFF3D4792B1000000080000000100000000000000000000
          0000000000031519465A7985CFE49EB3F2FF88A3F0FF8FA8F1FFA1B4F2FF646E
          BED60E112F3F000000020000000107081722495196ADA3B4F1FF96AEF2FF88A3
          F0FF9CB3F3FF8E9CE0F230366E85000000050000000100000000000000000000
          000000000000000000031E224A5B7C88D1E4B1C4F6FFA9B9F3FF606AB4CA0B0D
          24310000000200000000000000000000000207081822444C96AEA0B0F1FFB1C4
          F6FF98A6EEFF3137708504040C12000000010000000000000000000000000000
          0000000000000000000000000003161B4A5B8F9AECFF6A74C2D70B0D25310000
          0002000000000000000000000000000000000000000100000006464E99AE8F9A
          ECFF21286F850000000500000001000000000000000000000000000000000000
          000000000000000000000000000100000003151B49580E12303C000000020000
          000000000000000000000000000000000000000000000000000107091920151B
          4958000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000100000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object frxDBDatasetDetail: TfrxDBDataset
    UserName = 'frxDBDatasetDetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PEDIDOS_VENDAS_ID=PEDIDOS_VENDAS_ID'
      'PRODUTOS_ID=PRODUTOS_ID'
      'DESCRICAO=DESCRICAO'
      'UNIDADEMEDIDA=UNIDADEMEDIDA'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_ACRESCIMO=VALOR_ACRESCIMO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_TOTAL=VALOR_TOTAL'
      'HISTORICO=HISTORICO'
      'ORDEM=ORDEM'
      'LOCALIZACAO=LOCALIZACAO'
      'PRECO_VENDA=PRECO_VENDA'
      'PRECO_VENDA_PRZ=PRECO_VENDA_PRZ'
      'PRECO_VENDA_ATA=PRECO_VENDA_ATA'
      'PRECO_VENDA_ATA_PRZ=PRECO_VENDA_ATA_PRZ'
      'MARCA_DESCRICAO=MARCA_DESCRICAO')
    DataSet = qrDetail
    BCDToCurrency = False
    Left = 272
    Top = 72
  end
  object frxDBDatasetSubDetail: TfrxDBDataset
    UserName = 'frxDBDatasetSubDetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ORDEM=ORDEM'
      'PEDIDOS_VENDAS_ID=PEDIDOS_VENDAS_ID'
      'CAIXAS_ID=CAIXAS_ID'
      'FORMAS_PAGAMENTOS_ID=FORMAS_PAGAMENTOS_ID'
      'TIPOS_DOCUMENTOS_ID=TIPOS_DOCUMENTOS_ID'
      'DATA=DATA'
      'TIPO_TITULO=TIPO_TITULO'
      'VALOR_PAGAMENTO=VALOR_PAGAMENTO'
      'HISTORICO=HISTORICO'
      'DESCRICAO_PAG_DOC=DESCRICAO_PAG_DOC')
    DataSet = qrSubDetail
    BCDToCurrency = False
    Left = 272
    Top = 128
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 88
    Top = 32
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 152
    Top = 72
  end
end
