object frm_SelecaoDeProdutos: Tfrm_SelecaoDeProdutos
  Left = 0
  Top = 0
  Caption = 'Selecione o produto'
  ClientHeight = 730
  ClientWidth = 1008
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
  object Grid_Produtos: TStringGrid
    Left = 0
    Top = 0
    Width = 1008
    Height = 640
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    OnDblClick = Grid_ProdutosDblClick
    OnSelectCell = Grid_ProdutosSelectCell
    ExplicitWidth = 908
    ExplicitHeight = 768
  end
  object cli_Panel1: TPanel
    Left = 0
    Top = 640
    Width = 1008
    Height = 90
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 600
    ExplicitWidth = 1000
    object prod_ComboBox: TLabel
      Left = 8
      Top = 6
      Width = 65
      Height = 25
      Caption = 'Campo'
    end
    object label_Pesquisa: TLabel
      Left = 232
      Top = 6
      Width = 178
      Height = 25
      Caption = 'Termo de Pesquisa'
    end
    object btn_Fechar1: TBitBtn
      Left = 824
      Top = 21
      Width = 140
      Height = 50
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btn_Fechar1Click
    end
    object cbx_PesquisaProduto: TComboBox
      Left = 8
      Top = 37
      Width = 218
      Height = 33
      TabOrder = 1
      OnChange = cbx_PesquisaProdutoChange
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'Estoque'
        'Estoque M'#237'nimo'
        'Pre'#231'o Custo'
        'Pre'#231'o Venda')
    end
    object prod_Pesquisa: TMaskEdit
      Left = 232
      Top = 37
      Width = 561
      Height = 33
      Enabled = False
      TabOrder = 2
      Text = ''
      OnChange = prod_PesquisaChange
    end
  end
end
