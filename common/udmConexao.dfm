object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 429
  Width = 575
  PixelsPerInch = 120
  object fdConexao: TFDConnection
    ConnectionName = 'Conexao'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Server=45.234.92.126'
      'Database=c:\sistemas\mtc\dados.fdb'
      'Port=3050')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 135
    Top = 69
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 145
    Top = 239
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 135
    Top = 149
  end
end
