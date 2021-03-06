object DM: TDM
  Left = 0
  Top = 0
  Caption = 'DM'
  ClientHeight = 802
  ClientWidth = 3284
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
    DataSource = DataSource1
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
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CLI_ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CLI_CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CLI_TELEFONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CLI_EMAIL'
        DataType = ftString
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
        DataType = ftString
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
        DataType = ftString
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
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PROD_PRECOVENDA'
        DataType = ftString
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
  object qryContasReceber: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CAIXA')
    Left = 104
    Top = 448
  end
  object IBTable6: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CR_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CR_CODIGOCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CR_DESCRICAO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'CR_VALOR'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CR_DATA'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CR_CODIGONOTA'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'CONTASRECEBER'
    UniDirectional = False
    Left = 200
    Top = 448
  end
  object DataSource6: TDataSource
    DataSet = IBTable6
    Left = 272
    Top = 448
  end
  object qryContasPagar: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CAIXA')
    Left = 104
    Top = 504
  end
  object IBTable7: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CP_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CP_CODIGOFORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'CP_DESCRICAO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'CP_VALOR'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CP_DATA'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CP_CODIGONOTA'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'CONTASPAGAR'
    UniDirectional = False
    Left = 200
    Top = 504
  end
  object DataSource7: TDataSource
    DataSet = IBTable7
    Left = 272
    Top = 504
  end
  object qryNotaVenda: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource8
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM NOTAVENDA')
    Left = 104
    Top = 560
  end
  object IBTable8: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NV_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NV_CODIGOCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'NV_PRODUTOSVENDIDOS'
        DataType = ftWideString
        Size = 32765
      end
      item
        Name = 'NV_DATA'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'NV_VALORTOTAL'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'NOTAVENDA'
    UniDirectional = False
    Left = 200
    Top = 560
  end
  object DataSource8: TDataSource
    DataSet = IBTable8
    Left = 272
    Top = 560
  end
  object qryNotaCompra: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM NOTACOMPRA')
    Left = 104
    Top = 616
  end
  object IBTable9: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NC_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NC_CODIGOFORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'NC_PRODUTOSCOMPRADOS'
        DataType = ftWideString
        Size = 32765
      end
      item
        Name = 'NC_DATA'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'NC_VALORTOTAL'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'NC_FRETE'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'NC_IMPOSTO'
        DataType = ftWideString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'NOTACOMPRA'
    UniDirectional = False
    Left = 200
    Top = 616
  end
  object DataSource9: TDataSource
    DataSet = IBTable9
    Left = 272
    Top = 616
  end
end
