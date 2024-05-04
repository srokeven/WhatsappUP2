object fmMainWhatsapp: TfmMainWhatsapp
  Left = 0
  Top = 0
  Caption = 'Whatsapp UP2'
  ClientHeight = 549
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 549
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 1016
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Gerenciador de mensagens do          integrado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Cascadia Mono Light'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 1016
        Height = 57
        Align = alClient
        Alignment = taCenter
        Caption = '                  Whatsapp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -23
        Font.Name = 'Cascadia Mono'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 338
        ExplicitHeight = 30
      end
    end
    object pnlStatusAplicacao: TPanel
      Left = 0
      Top = 57
      Width = 337
      Height = 492
      Align = alLeft
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object pnlTipoConexao: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 333
        Height = 65
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 5
          Width = 94
          Height = 16
          Caption = 'Tipo de conex'#227'o'
        end
        object cbTipoConexao: TComboBox
          Left = 16
          Top = 27
          Width = 289
          Height = 24
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'Gerar QR Code'
          Items.Strings = (
            'Gerar QR Code'
            'Abrir pelo navegador')
        end
      end
      object pnlConfiguracoesGerais: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 68
        Width = 333
        Height = 221
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Label3: TLabel
          Left = 13
          Top = 108
          Width = 310
          Height = 16
          Caption = 'Arquivo de configura'#231#227'o com o banco de dados (*.ini)'
        end
        object SpeedButton1: TSpeedButton
          Left = 298
          Top = 130
          Width = 23
          Height = 22
          OnClick = SpeedButton1Click
        end
        object Label29: TLabel
          Left = 13
          Top = 160
          Width = 304
          Height = 16
          Caption = 'Tempo para monitorar novas mensagens (segundos)'
        end
        object chkPausarEnvioMensagem: TCheckBox
          Left = 13
          Top = 16
          Width = 292
          Height = 17
          Caption = 'Pausar envio de mensagens'
          TabOrder = 0
          OnClick = chkPausarEnvioMensagemClick
        end
        object chkConectarAoIniciar: TCheckBox
          Left = 13
          Top = 62
          Width = 292
          Height = 17
          Caption = 'Conectar-se ao iniciar a aplica'#231#227'o'
          TabOrder = 2
        end
        object chkForcarNonoDigito: TCheckBox
          Left = 13
          Top = 85
          Width = 292
          Height = 17
          Caption = 'For'#231'ar usar n'#250'meros com nono digito'
          TabOrder = 3
        end
        object edArquivoIni: TEdit
          Left = 13
          Top = 130
          Width = 279
          Height = 24
          TabOrder = 4
        end
        object chkPausarRecebimento: TCheckBox
          Left = 13
          Top = 39
          Width = 292
          Height = 17
          Caption = 'Pausar recebimento de mensagens'
          TabOrder = 1
          OnClick = chkPausarRecebimentoClick
        end
        object edTempoMonitorarMensagens: TEdit
          Left = 13
          Top = 184
          Width = 60
          Height = 24
          NumbersOnly = True
          TabOrder = 5
          Text = '5'
        end
      end
      object pnlControles: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 292
        Width = 333
        Height = 193
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object lbStatus: TLabel
          Left = 0
          Top = 0
          Width = 333
          Height = 146
          Align = alClient
          Alignment = taCenter
          Caption = 'Offline'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -23
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 79
          ExplicitHeight = 28
        end
        object pnlControlesButtons: TPanel
          Left = 0
          Top = 146
          Width = 333
          Height = 47
          Align = alBottom
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object btnDesconectar: TcxButton
            AlignWithMargins = True
            Left = 170
            Top = 3
            Width = 160
            Height = 41
            Align = alRight
            Caption = 'Desconectar'
            Enabled = False
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000000473424954080808087C0864880000000970485973000000B1000000
              B101C62D498D0000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A000001A7494441544889ADD63D4F15511006E067EF
              55632B851F9D1AB511A520367656D76B62E347232D15958D96FA3FD446C54613
              ED3436188C9AF80FACA4D348101B1012102C76578E9BD965F7864926BB9BF3CE
              3BEF9C9973B29976D6C7111C2BBEBF61117F5AC6D7DA104FB18CED8A2F176B97
              47219EC0FB80B4CEE771BE2DF90DAC76202F7D0D53BB91DFC4D608E4A56FE17A
              1DF9C488CAABBE82735182F900FC04A7F1B263927755F261007A835EB1BE1FAF
              3B261948086E05153D90EF296CE073547683FD6B785F3CE75712F0256C76ACE0
              277A3DF9093D1428984CDE7F1742BAD8180E97449182AF3890043CEB58C13626
              7BD857A3E0046692EF697CE8580538D9A0600D1713EC41CC166B9BB8AF79BA8E
              42266E72E98B3855117541DE78F2117E15C42DD999522F1A129449D24AAA7626
              88799C02A28356F575DCF67FE3152A6703FC200565F8D82249395DF77015D7F0
              36C0CC45653E6C9960375FC178957CCCDEDCA4B5D7F5DD3D521E92F7B1900057
              F1089F3A90CF45DB52DA78015AC09D62BBC81B3FC473FC0A4897E4A338D06059
              F13C8B2FEA7F43321C975F5E1BF88E1F76AEF35AFB0B9C3B3ADA0897ADD50000
              000049454E44AE426082}
            TabOrder = 0
            OnClick = btnDesconectarClick
          end
          object btnConectar: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 160
            Height = 41
            Align = alLeft
            Caption = 'Conectar'
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F40000000473424954080808087C0864880000000970485973000000EC000000
              EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A0000033F494441545885ED955F6C54451487BF33BB
              2B0A4B2D86126D687968291A09044A494988BE1402D4DBDDA2096262D4F8A609
              2190985462B36613484888894F84171F440224CAEE7651524578A20910FE24D5
              9616624CE5165129B05BA2DDED8C0FD875BBCCBDDD82461FFA7BBA73CE99F3FB
              EE9DB93330A319FDC792E94E70BA9C5A930B3A28BD14ADAA0150DA45ABDE80D2
              A9643439F4AF00B41E8B36027B04D6F99419A05B29DD918AA42EFE330006694D
              46E262E4FDB2EAEF4B03F17434F12182796880582CA6CE2DBF7450606B99C625
              DDCD67E948F2753F8880DFFC39DB9F8C0BF2CE4399DF2758D6D0FF2C0347FA4F
              7B5678253625DB5629ADCE4ED4CC7BBC92B79E7F13307C74E1638CF1FDB2C5D2
              A25553D7CB5F5CB025839E645AED9E30171176ADEE60C9530D005CBC79995343
              A7CB055046E9DDC0066BD21674BA9C5A81968971EDDC9A8239C0FA452DB6697E
              5A1F49446ACA0630F9401B45CB336EC627E5EBE7D51110DFED532AD1E0940F60
              6469F1F87AC6253396298CF75F3EF000D4942AE9E90B2062AA27CDC5F0E50F27
              0ACF8323D7A6670E68A8B6C5AD0058FE8EC4D51477FEB88320BCD7B49370283C
              2D00C17E16D8018CFC521ACAE6B2EC3DB70F6D348B2A6A89ADF98039A1D94506
              C29A679AA99C55E905306C8B5B7752C396E716226C2A8DFF7CEF26B77E1FA1E9
              E946AA66CFE7C59A1770478771B32EEDF551B6AD7C17A7AE957028CCC0C80039
              9DFBFB9DE093C123FDE74B7BDACF01ADBA098C1B2C4BD1FDE3D764735976366E
              A7EA892A3A9B777177EC2E158F5500105221A2F56D8CE64739DC7FB4E02FC17C
              CA66655D82F42B9F0F1AF8C60A079C717BD8766A07DFFFD60750302F56EFAFDF
              150F4FA49DF4755B2FCF9F79F16B0D7D62E46D2FC8CC58869343DF72F5F635C2
              A13015B3E6125221DC5197837D8738E3F64C946AA5F4AB570E5FB961EBE37B1B
              BE9488F460A4D9AFA658411524AFF39362063A8FB727E25E733C019C2E67BEC9
              0786F1B92FCAD0A7E968E20DBFEBD8EB1C40E7039B1FC15C1BE89CCADC174060
              0B626E081C404CABD26A2D70128F03E52F19E02BA5F48AE3ED89F854E6E0F586
              062141C7AA4B2BCEC762315D9469D9782C5A17808D1859294A2F305A8D1B313F
              01BD12CCA7BC76FB8C66F4BFD59FF47118726D97BB740000000049454E44AE42
              6082}
            TabOrder = 1
            OnClick = btnConectarClick
          end
        end
      end
    end
    object pnlLogMensagens: TPanel
      Left = 337
      Top = 57
      Width = 679
      Height = 492
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object pnlInformacoes: TPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 65
        Align = alTop
        TabOrder = 0
        DesignSize = (
          675
          65)
        object lbMeuNumero: TLabel
          Left = 4
          Top = 7
          Width = 149
          Height = 24
          Caption = '(XX) XXXX-XXXX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbStatusAtual: TLabel
          Left = 4
          Top = 43
          Width = 79
          Height = 16
          Caption = 'Desconectado'
        end
        object edNomeEmpresa: TEdit
          Left = 208
          Top = 4
          Width = 458
          Height = 32
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'EMPRESA'
        end
      end
      object pcInformacoes: TPageControl
        Left = 0
        Top = 65
        Width = 675
        Height = 423
        ActivePage = tsEnvioMensagem
        Align = alClient
        TabOrder = 1
        object tsLogs: TTabSheet
          Caption = 'Logs'
          object Label5: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 661
            Height = 16
            Align = alTop
            Caption = 'Log das '#250'ltimas mensagens'
            ExplicitWidth = 158
          end
          object mmMensagens: TMemo
            Left = 0
            Top = 22
            Width = 667
            Height = 370
            Align = alClient
            TabOrder = 0
          end
        end
        object tsHorarios: TTabSheet
          Caption = 'Horarios de funcionamento'
          ImageIndex = 2
          object Label4: TLabel
            Left = 115
            Top = 42
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label6: TLabel
            Left = 379
            Top = 42
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label7: TLabel
            Left = 240
            Top = 41
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label8: TLabel
            Left = 240
            Top = 94
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label9: TLabel
            Left = 379
            Top = 95
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label10: TLabel
            Left = 115
            Top = 95
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label11: TLabel
            Left = 240
            Top = 147
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label12: TLabel
            Left = 379
            Top = 148
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label13: TLabel
            Left = 115
            Top = 148
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label14: TLabel
            Left = 240
            Top = 200
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label15: TLabel
            Left = 379
            Top = 201
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label16: TLabel
            Left = 115
            Top = 201
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label17: TLabel
            Left = 240
            Top = 253
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label18: TLabel
            Left = 379
            Top = 254
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label19: TLabel
            Left = 115
            Top = 254
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label20: TLabel
            Left = 240
            Top = 306
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label21: TLabel
            Left = 379
            Top = 307
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label22: TLabel
            Left = 115
            Top = 307
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label23: TLabel
            Left = 240
            Top = 359
            Width = 50
            Height = 16
            Caption = 'Intervalo'
          end
          object Label24: TLabel
            Left = 379
            Top = 360
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object Label25: TLabel
            Left = 115
            Top = 360
            Width = 19
            Height = 16
            Caption = 'At'#233
          end
          object chkMonitorarSegunda: TCheckBox
            Left = 16
            Top = 15
            Width = 105
            Height = 17
            Caption = 'Segunda-Feira'
            TabOrder = 0
          end
          object chkMonitorarTerca: TCheckBox
            Left = 16
            Top = 68
            Width = 105
            Height = 17
            Caption = 'Ter'#231'a-Feira'
            TabOrder = 5
          end
          object chkMonitorarQuarta: TCheckBox
            Left = 16
            Top = 121
            Width = 105
            Height = 17
            Caption = 'Quarta-Feira'
            TabOrder = 10
          end
          object chkMonitorarQuinta: TCheckBox
            Left = 16
            Top = 174
            Width = 105
            Height = 17
            Caption = 'Quinta-Feira'
            TabOrder = 15
          end
          object chkMonitorarSexta: TCheckBox
            Left = 16
            Top = 227
            Width = 105
            Height = 17
            Caption = 'Sexta-Feira'
            TabOrder = 20
          end
          object chkMonitorarSabado: TCheckBox
            Left = 16
            Top = 280
            Width = 105
            Height = 17
            Caption = 'S'#225'bado'
            TabOrder = 25
          end
          object chkMonitorarDomingo: TCheckBox
            Left = 16
            Top = 333
            Width = 105
            Height = 17
            Caption = 'Domingo'
            TabOrder = 26
          end
          object tdHoraInicioSegunda: TcxTimeEdit
            Left = 32
            Top = 38
            TabOrder = 1
            Width = 77
          end
          object tdHoraInicioTerca: TcxTimeEdit
            Left = 32
            Top = 91
            TabOrder = 6
            Width = 77
          end
          object tdHoraInicioQuarta: TcxTimeEdit
            Left = 32
            Top = 144
            TabOrder = 11
            Width = 77
          end
          object tdHoraInicioQuinta: TcxTimeEdit
            Left = 32
            Top = 197
            TabOrder = 16
            Width = 77
          end
          object tdHoraInicioSexta: TcxTimeEdit
            Left = 32
            Top = 250
            TabOrder = 21
            Width = 77
          end
          object tdHoraInicioSabado: TcxTimeEdit
            Left = 32
            Top = 303
            TabOrder = 27
            Width = 77
          end
          object tdHoraInicioDomingo: TcxTimeEdit
            Left = 32
            Top = 356
            TabOrder = 31
            Width = 77
          end
          object tdHoraFimSegunda: TcxTimeEdit
            Left = 140
            Top = 38
            TabOrder = 2
            Width = 77
          end
          object tdHoraIntervaloInicioSegunda: TcxTimeEdit
            Left = 296
            Top = 38
            TabOrder = 3
            Width = 77
          end
          object tdHoraIntervaloFimSegunda: TcxTimeEdit
            Left = 404
            Top = 38
            TabOrder = 4
            Width = 77
          end
          object tdHoraFimTerca: TcxTimeEdit
            Left = 140
            Top = 91
            TabOrder = 7
            Width = 77
          end
          object tdHoraIntervaloFimTerca: TcxTimeEdit
            Left = 404
            Top = 91
            TabOrder = 9
            Width = 77
          end
          object tdHoraIntervaloInicioTerca: TcxTimeEdit
            Left = 296
            Top = 91
            TabOrder = 8
            Width = 77
          end
          object tdHoraFimQuarta: TcxTimeEdit
            Left = 140
            Top = 144
            TabOrder = 12
            Width = 77
          end
          object tdHoraIntervaloFimQuarta: TcxTimeEdit
            Left = 404
            Top = 144
            TabOrder = 14
            Width = 77
          end
          object tdHoraIntervaloInicioQuarta: TcxTimeEdit
            Left = 296
            Top = 144
            TabOrder = 13
            Width = 77
          end
          object tdHoraFimQuinta: TcxTimeEdit
            Left = 140
            Top = 197
            TabOrder = 17
            Width = 77
          end
          object tdHoraIntervaloFimQuinta: TcxTimeEdit
            Left = 404
            Top = 197
            TabOrder = 19
            Width = 77
          end
          object tdHoraIntervaloInicioQuinta: TcxTimeEdit
            Left = 296
            Top = 197
            TabOrder = 18
            Width = 77
          end
          object tdHoraFimSexta: TcxTimeEdit
            Left = 140
            Top = 250
            TabOrder = 22
            Width = 77
          end
          object tdHoraIntervaloFimSexta: TcxTimeEdit
            Left = 404
            Top = 250
            TabOrder = 24
            Width = 77
          end
          object tdHoraIntervaloInicioSexta: TcxTimeEdit
            Left = 296
            Top = 250
            TabOrder = 23
            Width = 77
          end
          object tdHoraFimSabado: TcxTimeEdit
            Left = 140
            Top = 303
            TabOrder = 28
            Width = 77
          end
          object tdHoraIntervaloFimSabado: TcxTimeEdit
            Left = 404
            Top = 303
            TabOrder = 30
            Width = 77
          end
          object tdHoraIntervaloInicioSabado: TcxTimeEdit
            Left = 296
            Top = 303
            TabOrder = 29
            Width = 77
          end
          object tdHoraFimDomingo: TcxTimeEdit
            Left = 140
            Top = 356
            TabOrder = 32
            Width = 77
          end
          object tdHoraIntervaloFimDomingo: TcxTimeEdit
            Left = 404
            Top = 356
            TabOrder = 34
            Width = 77
          end
          object tdHoraIntervaloInicioDomingo: TcxTimeEdit
            Left = 296
            Top = 356
            TabOrder = 33
            Width = 77
          end
          object btnSalvarHorarios: TButton
            Left = 504
            Top = 356
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 35
            OnClick = btnSalvarHorariosClick
          end
        end
        object tsRespostasAutomaticas: TTabSheet
          Caption = 'Respostas Autom'#225'ticas'
          ImageIndex = 3
          object Label26: TLabel
            Left = 16
            Top = 14
            Width = 182
            Height = 16
            Caption = 'Fora do hor'#225'rio de atendimento'
          end
          object Label27: TLabel
            Left = 16
            Top = 103
            Width = 107
            Height = 16
            Caption = 'Sistema fora do ar'
          end
          object Label28: TLabel
            Left = 16
            Top = 192
            Width = 213
            Height = 16
            Caption = 'Recebimento de mensagens pausado'
          end
          object mmForaHorario: TMemo
            Left = 16
            Top = 36
            Width = 625
            Height = 61
            TabOrder = 0
          end
          object mmForaDoAr: TMemo
            Left = 16
            Top = 125
            Width = 625
            Height = 61
            TabOrder = 1
          end
          object mmRecebimentoPausado: TMemo
            Left = 16
            Top = 214
            Width = 625
            Height = 61
            TabOrder = 2
          end
          object btnSalvarRespostas: TButton
            Left = 16
            Top = 281
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 3
            OnClick = btnSalvarHorariosClick
          end
        end
        object tsEnvioMensagem: TTabSheet
          Caption = 'Envio de mensagem'
          ImageIndex = 1
          DesignSize = (
            667
            392)
          object imgQRCode: TImage
            Left = 9
            Top = 138
            Width = 22
            Height = 26
            Anchors = [akTop, akRight]
            Proportional = True
            Visible = False
            ExplicitLeft = 0
          end
          object imgAuxiliar: TImage
            Left = 20
            Top = 311
            Width = 22
            Height = 18
            Anchors = [akTop, akRight]
            Proportional = True
            Visible = False
            ExplicitLeft = 11
          end
          object Label30: TLabel
            Left = 11
            Top = 14
            Width = 68
            Height = 16
            Caption = 'Menssagem'
          end
          object Label31: TLabel
            Left = 11
            Top = 190
            Width = 134
            Height = 16
            Caption = 'Numero do destinat'#225'rio'
          end
          object Label32: TLabel
            Left = 11
            Top = 242
            Width = 138
            Height = 16
            AutoSize = False
            Caption = 'Exemplo: 8898765432'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object mmMensagemEnviar: TMemo
            Left = 11
            Top = 36
            Width = 294
            Height = 148
            TabOrder = 0
          end
          object edNumeroEnviar: TEdit
            Left = 11
            Top = 212
            Width = 121
            Height = 24
            NumbersOnly = True
            TabOrder = 1
          end
          object btnEnviarMensagem: TButton
            Left = 11
            Top = 264
            Width = 75
            Height = 25
            Caption = 'Enviar'
            TabOrder = 2
            OnClick = btnEnviarMensagemClick
          end
          object btnCarregarAquivo: TButton
            Left = 311
            Top = 66
            Width = 114
            Height = 25
            Caption = 'Carregar Arquivo'
            TabOrder = 3
            OnClick = btnCarregarAquivoClick
          end
          object edArquivoEnviar: TEdit
            Left = 311
            Top = 36
            Width = 338
            Height = 24
            TabOrder = 4
          end
          object btnSalvarNoBanco: TButton
            Left = 92
            Top = 264
            Width = 129
            Height = 25
            Caption = 'Salvar no Banco'
            TabOrder = 5
            OnClick = btnSalvarNoBancoClick
          end
        end
      end
    end
  end
  object pnlAlertaFinalizando: TPanel
    Left = 856
    Top = 8
    Width = 33
    Height = 26
    Caption = 'Finalizando o aplicativo. Por favor, aguarde!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object odArquivo: TOpenDialog
    Filter = 'Arquivo de configuracao|*.ini'
    Left = 272
    Top = 416
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 832
    Top = 464
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 936
    Top = 464
  end
  object WhatsappWeb: TInject
    InjectJS.AutoUpdateTimeOut = 20
    Config.AutoDelay = 30
    Config.ReceiveAttachmentAuto = False
    Config.Zoom = 0
    Config.SecondsMonitor = 5
    Config.ShowRandom = False
    AjustNumber.LengthPhone = 8
    AjustNumber.DDIDefault = 55
    FormQrCodeType = Ft_Http
    OnGetQrCode = WhatsappWebGetQrCode
    OnGetUnReadMessages = WhatsappWebGetUnReadMessages
    OnGetStatus = WhatsappWebGetStatus
    OnIsConnected = WhatsappWebIsConnected
    OnGetCheckIsValidNumber = WhatsappWebGetCheckIsValidNumber
    OnGetMyNumber = WhatsappWebGetMyNumber
    OnDisconnected = WhatsappWebDisconnected
    OnDisconnectedBrute = WhatsappWebDisconnectedBrute
    OnErroAndWarning = WhatsappWebErroAndWarning
    OnGetStatusMessage = WhatsappWebGetStatusMessage
    OnGetMe = WhatsappWebGetMe
    OnNewGetNumber = WhatsappWebNewGetNumber
    OnGetIncomingCall = WhatsappWebGetIncomingCall
    Left = 528
    Top = 88
  end
  object tmEnvioMensagens: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmEnvioMensagensTimer
    Left = 469
    Top = 269
  end
  object fdConexaoEnvio: TFDConnection
    ConnectionName = 'ConexaoEnvio'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 712
    Top = 360
  end
  object fdConexaoRecebimento: TFDConnection
    ConnectionName = 'ConexaoEnvio'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 712
    Top = 408
  end
  object fdConexaoAdmininstrativo: TFDConnection
    ConnectionName = 'ConexaoAdministrativo'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 712
    Top = 464
  end
end
