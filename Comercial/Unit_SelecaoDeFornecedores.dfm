object frm_SelecaoDeFornecedores: Tfrm_SelecaoDeFornecedores
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o de Fornecedor'
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
  object for_Panel1: TPanel
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
    TabOrder = 0
    object for_ComboBox: TLabel
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
    object cbx_PesquisaFornecedor: TComboBox
      Left = 8
      Top = 37
      Width = 218
      Height = 33
      TabOrder = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Raz'#227'o Social'
        'Inscri'#231#227'o Estadual'
        'CNPJ'
        'Endere'#231'o'
        'Telefone'
        'Email')
    end
    object for_Pesquisa: TMaskEdit
      Left = 232
      Top = 37
      Width = 561
      Height = 33
      Enabled = False
      TabOrder = 2
      Text = ''
    end
  end
  object Grid_Fornecedores: TStringGrid
    Left = 0
    Top = 0
    Width = 1008
    Height = 640
    Align = alClient
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnDblClick = Grid_FornecedoresDblClick
    OnSelectCell = Grid_FornecedoresSelectCell
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64)
  end
end
