object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 343
  Width = 460
  object fdConexao: TFDConnection
    ConnectionName = 'Conexao'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=UTF8')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 108
    Top = 55
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 116
    Top = 191
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 108
    Top = 119
  end
end
