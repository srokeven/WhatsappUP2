object frmMainControlador: TfrmMainControlador
  Left = 0
  Top = 0
  Caption = 'Controlador de mensagens'
  ClientHeight = 311
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSideBar: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 311
    Align = alLeft
    Caption = 'pnlSideBar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    object btnIniciar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 137
      Height = 42
      Align = alTop
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = btnIniciarClick
    end
    object btnParar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 52
      Width = 137
      Height = 42
      Align = alTop
      Caption = 'Parar'
      Enabled = False
      TabOrder = 1
      OnClick = btnPararClick
    end
    object btnOpcoesAvancadas: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 137
      Height = 42
      Align = alTop
      Caption = 'Op'#231#245'es Avan'#231'adas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnOpcoesAvancadasClick
    end
  end
  object mmLog: TMemo
    Left = 145
    Top = 0
    Width = 529
    Height = 311
    Align = alClient
    TabOrder = 1
  end
  object tmCiclos: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmCiclosTimer
    Left = 440
    Top = 120
  end
end
