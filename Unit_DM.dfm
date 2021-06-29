object DM: TDM
  Left = 0
  Top = 0
  Caption = 'DM'
  ClientHeight = 565
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Comercial\Win32\Debug\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 88
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 88
    Top = 112
  end
  object qryCliente: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 88
    Top = 168
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CLI_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CLI_NOME'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CLI_ENDERECO'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CLI_CPF'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CLI_TELEFONE'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CLI_EMAIL'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CLI_SEXO'
        DataType = ftInteger
      end
      item
        Name = 'CLI_ESTADOCIVIL'
        DataType = ftInteger
      end
      item
        Name = 'CLI_DATANASCIMENTO'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'CLIENTE'
    UniDirectional = False
    Left = 144
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 200
    Top = 168
  end
  object qryAux: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 88
    Top = 280
  end
  object qryCommit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 88
    Top = 224
  end
end
