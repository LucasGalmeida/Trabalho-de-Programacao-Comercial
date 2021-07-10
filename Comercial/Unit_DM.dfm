object DM: TDM
  Left = 0
  Top = 0
  Caption = 'DM'
  ClientHeight = 779
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\Comercial\Win32\Debug\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 104
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 104
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
    Left = 104
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
        Size = 100
      end
      item
        Name = 'CLI_ENDERECO'
        DataType = ftWideString
        Size = 100
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
        Size = 100
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
    Left = 200
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 272
    Top = 168
  end
  object qryAux: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'SELECT * FROM FORNECEDOR'
      'SELECT * FROM PRODUTO'
      'SELECT * FROM SUPERMERCADO'
      'SELECT * FROM CAIXA'
      '')
    Left = 352
    Top = 64
  end
  object qryCommit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 408
    Top = 64
  end
  object qrySupermercado: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM SUPERMERCADO')
    Left = 104
    Top = 224
  end
  object IBTable2: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SUP_NOMEFANTASIA'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_RAZAOSOCIAL'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_INSCRICAOESTADUAL'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_CNPJ'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'SUP_ENDERECO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_LUCRO'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'SUP_TELEFONE'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'SUP_EMAIL'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_NOMERESPONSAVEL'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SUP_TELEFONERESPONSAVEL'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'SUPERMERCADO'
    UniDirectional = False
    Left = 200
    Top = 224
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 272
    Top = 224
  end
  object qryProduto: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 104
    Top = 280
  end
  object IBTable3: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PROD_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'PROD_DESCRICAO'
        DataType = ftWideString
        Size = 300
      end
      item
        Name = 'PROD_ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'PROD_ESTOQUEMINIMO'
        DataType = ftInteger
      end
      item
        Name = 'PROD_PRECOCUSTO'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'PROD_PRECOVENDA'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'PRODUTO'
    UniDirectional = False
    Left = 200
    Top = 280
  end
  object DataSource3: TDataSource
    DataSet = IBTable3
    Left = 272
    Top = 280
  end
  object qryFornecedor: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM FORNECEDOR')
    Left = 104
    Top = 336
  end
  object IBTable4: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'FOR_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'FOR_NOMEFANTASIA'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_RAZAOSOCIAL'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_INSCRICAOESTADUAL'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_CNPJ'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_ENDERECO'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_TELEFONE'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FOR_EMAIL'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'FORNECEDOR'
    UniDirectional = False
    Left = 200
    Top = 336
  end
  object DataSource4: TDataSource
    DataSet = IBTable4
    Left = 272
    Top = 336
  end
  object qryCaixa: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CAIXA')
    Left = 104
    Top = 392
  end
  object IBTable5: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CAI_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CAI_DESCRICAO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'CAI_VALOR'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CAI_DATA'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CAI_CODIGONOTA'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'CAIXA'
    UniDirectional = False
    Left = 200
    Top = 392
  end
  object DataSource5: TDataSource
    DataSet = IBTable5
    Left = 272
    Top = 392
  end
end
