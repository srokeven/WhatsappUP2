object fmControladorMensagens: TfmControladorMensagens
  Left = 0
  Top = 0
  Caption = 'Controlador de mensagens'
  ClientHeight = 534
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 951
    Height = 65
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 9
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 104
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Parar'
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 208
      Top = 21
      Width = 161
      Height = 25
      Caption = 'Ciclo de mensagens "Brutas"'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button6: TButton
      Left = 400
      Top = 21
      Width = 233
      Height = 25
      Caption = 'Processar mensagens para enviar'
      TabOrder = 3
      OnClick = Button6Click
    end
  end
  object mmLog: TMemo
    Left = 297
    Top = 65
    Width = 359
    Height = 469
    Align = alClient
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 297
    Height = 469
    Align = alLeft
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 74
      Height = 13
      Caption = 'Data hora inicio'
    end
    object Label2: TLabel
      Left = 160
      Top = 112
      Width = 65
      Height = 13
      Caption = 'Data hora fim'
    end
    object Label4: TLabel
      Left = 9
      Top = 164
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label5: TLabel
      Left = 160
      Top = 164
      Width = 68
      Height = 13
      Caption = 'Tipo intera'#231#227'o'
    end
    object Label6: TLabel
      Left = 9
      Top = 260
      Width = 61
      Height = 13
      Caption = 'Tipo entrega'
    end
    object Label7: TLabel
      Left = 160
      Top = 260
      Width = 110
      Height = 13
      Caption = 'Situa'#231#227'o da mensagem'
    end
    object NumeroEmpresa: TLabeledEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero empresa'
      TabOrder = 0
      Text = '55988584261'
    end
    object NumeroCliente: TLabeledEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero cliente'
      TabOrder = 1
      Text = '88992140949'
    end
    object DataHoraInicio: TcxDateEdit
      Left = 8
      Top = 131
      EditValue = 45371d
      Properties.Kind = ckDateTime
      TabOrder = 2
      Width = 121
    end
    object DataHoraFim: TcxDateEdit
      Left = 160
      Top = 131
      EditValue = 45371d
      Properties.Kind = ckDateTime
      TabOrder = 3
      Width = 121
    end
    object OpcaoEntregue: TLabeledEdit
      Left = 8
      Top = 231
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Opcao entregue'
      TabOrder = 4
    end
    object OpcaoRecebida: TLabeledEdit
      Left = 160
      Top = 231
      Width = 121
      Height = 21
      EditLabel.Width = 75
      EditLabel.Height = 13
      EditLabel.Caption = 'Op'#231#227'o recebida'
      TabOrder = 5
    end
    object Mensagem: TLabeledEdit
      Left = 8
      Top = 335
      Width = 273
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Mensagem'
      TabOrder = 6
    end
    object AnexoMensagem: TLabeledEdit
      Left = 8
      Top = 383
      Width = 273
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Anexo mensagem'
      TabOrder = 7
    end
    object Button4: TButton
      Left = 8
      Top = 424
      Width = 201
      Height = 25
      Caption = 'Salvar mensagem sem tratamento'
      TabOrder = 8
      OnClick = Button4Click
    end
    object Ticket: TLabeledEdit
      Left = 8
      Top = 72
      Width = 273
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Ticket'
      TabOrder = 9
    end
    object StatusEnvio: TComboBox
      Left = 9
      Top = 183
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 10
      Text = 'N'#227'o enviada'
      Items.Strings = (
        'N'#227'o enviada'
        'Enviada'
        'Recebida'
        'Lida')
    end
    object TipoInteracao: TComboBox
      Left = 160
      Top = 183
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 11
      Text = 'Desconhecido'
      Items.Strings = (
        'Desconhecido'
        'A partir do usuario'
        'A partir da empresa')
    end
    object TipoEntregaMensagem: TComboBox
      Left = 9
      Top = 279
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 12
      Text = 'Enviar para o usuairo'
      Items.Strings = (
        'Enviar para o usuairo'
        'Receber do usuario')
    end
    object Situacao: TComboBox
      Left = 160
      Top = 279
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 13
      Text = 'Desconhecido'
      Items.Strings = (
        'Desconhecido'
        'Em aberto'
        'Finalizado')
    end
  end
  object Panel3: TPanel
    Left = 656
    Top = 65
    Width = 295
    Height = 469
    Align = alRight
    TabOrder = 3
    object Label3: TLabel
      Left = 6
      Top = 69
      Width = 85
      Height = 13
      Caption = 'Mensagem cliente'
    end
    object NumeroClienteRecebido: TLabeledEdit
      Left = 158
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero cliente'
      TabOrder = 0
      Text = '88992140949'
    end
    object NumeroEmpresaRecebido: TLabeledEdit
      Left = 6
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero empresa'
      TabOrder = 1
      Text = '55988584261'
    end
    object mmMensagemCliente: TMemo
      Left = 6
      Top = 88
      Width = 275
      Height = 145
      TabOrder = 2
    end
    object Button5: TButton
      Left = 6
      Top = 239
      Width = 195
      Height = 25
      Caption = 'Enviar mensagem cliente'
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=c:\sistemas\mtc\dados.fdb'
      'Port=3050'
      'Server=45.234.92.126'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    BeforeConnect = fdConexaoBeforeConnect
    Left = 512
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 472
    Top = 272
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 480
    Top = 280
  end
  object tmCiclos: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmCiclosTimer
    Left = 440
    Top = 120
  end
end
