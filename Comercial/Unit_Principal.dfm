object SuperMercadoDEF: TSuperMercadoDEF
  Left = 0
  Top = 0
  Caption = 'SuperMercadoDEF'
  ClientHeight = 710
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MenuPrincipal
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 710
    Align = alClient
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object label_NomeFantasia: TLabel
      Left = 685
      Top = 448
      Width = 115
      Height = 16
      Caption = 'label_NomeFantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_RazaoSocial: TLabel
      Left = 96
      Top = 113
      Width = 284
      Height = 45
      Caption = 'label_RazaoSocial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_InscricaoEstadual: TLabel
      Left = 685
      Top = 470
      Width = 133
      Height = 16
      Caption = 'label_InscricaoEstadual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_CNPJ: TLabel
      Left = 685
      Top = 492
      Width = 62
      Height = 16
      Caption = 'label_CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_Endereco: TLabel
      Left = 685
      Top = 96
      Width = 160
      Height = 29
      Caption = 'label_Endereco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_Telefone: TLabel
      Left = 685
      Top = 131
      Width = 121
      Height = 23
      Caption = 'label_Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_Email: TLabel
      Left = 685
      Top = 160
      Width = 94
      Height = 23
      Caption = 'label_Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_NomeResponsavel: TLabel
      Left = 685
      Top = 514
      Width = 138
      Height = 16
      Caption = 'label_NomeResponsavel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_TelefoneResponsavel: TLabel
      Left = 685
      Top = 536
      Width = 155
      Height = 16
      Caption = 'label_TelefoneResponsavel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_Lucro: TLabel
      Left = 145
      Top = 481
      Width = 120
      Height = 29
      Caption = 'label_Lucro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PanelPrincipalInferior: TPanel
      Left = 1
      Top = 619
      Width = 1006
      Height = 90
      Align = alBottom
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 0
      object btn_Fechar: TBitBtn
        Left = 818
        Top = 22
        Width = 140
        Height = 50
        Caption = '&Fechar'
        TabOrder = 0
        OnClick = btn_FecharClick
      end
      object BitBtn1: TBitBtn
        Left = 50
        Top = 22
        Width = 140
        Height = 50
        Caption = '&Editar'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
  object MenuPrincipal: TMainMenu
    Left = 16
    Top = 576
    object Cadastro: TMenuItem
      Caption = 'C&adastros'
      object Clientes: TMenuItem
        Caption = '&Clientes'
        OnClick = ClientesClick
      end
      object Fornecedores: TMenuItem
        Caption = '&Fornecedores'
        OnClick = FornecedoresClick
      end
      object Produtos: TMenuItem
        Caption = '&Produtos'
        OnClick = ProdutosClick
      end
    end
    object ransaesFiscais1: TMenuItem
      Caption = '&Transa'#231#245'es Fiscais'
      object SaidadeProdutosvenda1: TMenuItem
        Caption = 'Saida de Produtos (&Venda)'
        OnClick = SaidadeProdutosvenda1Click
      end
      object ContasaReceber1: TMenuItem
        Caption = 'Contas a &Receber'
      end
      object ContasaPagar1: TMenuItem
        Caption = 'Contas a &Pagar'
      end
      object Caixa1: TMenuItem
        Caption = '&Caixa'
        OnClick = Caixa1Click
      end
      object EntradadeProdutos1: TMenuItem
        Caption = '&Entrada de Produtos'
      end
    end
    object BussinessIntelligence1: TMenuItem
      Caption = '&Bussiness Intelligence'
      object Relatrios1: TMenuItem
        Caption = '&Relat'#243'rios'
      end
      object Grficos1: TMenuItem
        Caption = '&Gr'#225'ficos'
      end
    end
  end
end
