object Dm: TDm
  OldCreateOrder = False
  Height = 340
  Width = 473
  object FDBanco: TFDConnection
    ConnectionName = 'FB_DEMO'
    Params.Strings = (
      'Database=C:\ProjetoFortes\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object qrGenerica: TFDQuery
    Connection = FDBanco
    Left = 88
    Top = 24
  end
  object qrBomba: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'SELECT * FROM BOMBA')
    Left = 384
    Top = 56
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\ProjetoFortes\FBCLIENT.DLL'
    Left = 56
    Top = 80
  end
  object DSBomba: TDataSource
    DataSet = qrBomba
    Left = 332
    Top = 56
  end
  object qrTanque: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'SELECT * FROM TANQUE')
    Left = 384
    Top = 120
  end
  object DSTanque: TDataSource
    DataSet = qrTanque
    Left = 332
    Top = 120
  end
  object DSAtendimento: TDataSource
    DataSet = qrAbastecimento
    Left = 332
    Top = 184
  end
  object qrAbastecimento: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTO')
    Left = 384
    Top = 184
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 152
  end
  object qrRelatorio: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'SELECT A.DT_ABASTECIMENTO,'
      '       T.COMBUSTIVEL,'
      '       B.DESCRICAO,'
      '       SUM(A.VL_ABASTECIDO) AS TOTAL'
      '  FROM ABASTECIMENTO A'
      ' INNER JOIN BOMBA B ON A.ID_BOMBA = B.ID_BOMBA'
      ' INNER JOIN TANQUE T ON A.ID_TANQUE = T.ID_TANQUE'
      
        ' WHERE A.DT_ABASTECIMENTO BETWEEN CURRENT_DATE - 1 AND CURRENT_D' +
        'ATE'
      ' GROUP BY A.DT_ABASTECIMENTO, T.COMBUSTIVEL, B.DESCRICAO')
    Left = 384
    Top = 248
  end
  object DSRelatorio: TDataSource
    DataSet = qrRelatorio
    Left = 332
    Top = 248
  end
end
