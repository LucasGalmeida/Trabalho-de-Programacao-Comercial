object frm_Produto: Tfrm_Produto
  Left = 0
  Top = 0
  Caption = 'frm_Produto'
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ControlePaginasProduto: TPageControl
    Left = 0
    Top = 0
    Width = 1008
    Height = 730
    ActivePage = CRUD_Produto
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 300
    object Visualização: TTabSheet
      Caption = 'Visualiza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 993
      ExplicitHeight = 650
      object Grid_Produtos: TStringGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 600
        Align = alClient
        ColCount = 9
        FixedCols = 0
        RowCount = 2
        PopupMenu = PopupGridProdutos
        TabOrder = 0
      end
      object cli_Panel1: TPanel
        Left = 0
        Top = 600
        Width = 1000
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
        ExplicitTop = 560
        ExplicitWidth = 993
        object cli_ComboBox: TLabel
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
          Caption = 'Fechar'
          TabOrder = 0
        end
        object cbx_PesquisaProduto: TComboBox
          Left = 8
          Top = 37
          Width = 218
          Height = 33
          TabOrder = 1
          Items.Strings = (
            'C'#243'digo'
            'Nome'
            'Endere'#231'o'
            'CPF'
            'Telefone'
            'E-Mail'
            'Sexo'
            'Estado Civil'
            'Data de Nascimento')
        end
        object cli_Pesquisa: TMaskEdit
          Left = 232
          Top = 37
          Width = 561
          Height = 33
          Enabled = False
          TabOrder = 2
          Text = ''
        end
      end
    end
    object CRUD_Produto: TTabSheet
      Caption = 'Cadastro/Edi'#231#227'o'
      ImageIndex = 1
      object cli_Panel2: TPanel
        Left = 0
        Top = 600
        Width = 1000
        Height = 90
        Align = alBottom
        ParentBackground = False
        TabOrder = 0
        object btn_Fechar: TBitBtn
          Left = 818
          Top = 22
          Width = 140
          Height = 50
          Caption = '&Fechar'
          TabOrder = 0
        end
        object btn_Gravar: TBitBtn
          Left = 620
          Top = 23
          Width = 140
          Height = 50
          Caption = '&Gravar'
          Enabled = False
          TabOrder = 1
        end
        object btn_Limpar: TBitBtn
          Left = 422
          Top = 24
          Width = 140
          Height = 50
          Caption = '&Limpar'
          Enabled = False
          TabOrder = 2
        end
        object btn_Cancelar: TBitBtn
          Left = 224
          Top = 21
          Width = 140
          Height = 50
          Caption = '&Cancelar'
          Enabled = False
          TabOrder = 3
        end
        object btn_Novo: TBitBtn
          Left = 26
          Top = 20
          Width = 140
          Height = 50
          Caption = '&Novo'
          TabOrder = 4
        end
      end
      object prod_Codigo: TLabeledEdit
        Left = 223
        Top = 48
        Width = 158
        Height = 33
        EditLabel.Width = 64
        EditLabel.Height = 25
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 1
      end
      object prod_Descricao: TLabeledEdit
        Left = 223
        Top = 112
        Width = 634
        Height = 74
        EditLabel.Width = 89
        EditLabel.Height = 25
        EditLabel.Caption = 'Descri'#231#227'o'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 2
      end
      object prod_Estoque: TLabeledEdit
        Left = 223
        Top = 224
        Width = 158
        Height = 33
        EditLabel.Width = 74
        EditLabel.Height = 25
        EditLabel.Caption = 'Estoque'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 3
      end
      object prod_EstoqueMinimo: TLabeledEdit
        Left = 223
        Top = 312
        Width = 158
        Height = 33
        EditLabel.Width = 148
        EditLabel.Height = 25
        EditLabel.Caption = 'Estoque M'#237'nimo'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 4
      end
      object prod_PrecoCusto: TLabeledEdit
        Left = 223
        Top = 400
        Width = 158
        Height = 33
        EditLabel.Width = 111
        EditLabel.Height = 25
        EditLabel.Caption = 'Pre'#231'o Custo'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 5
      end
      object prod_PrecoVenda: TLabeledEdit
        Left = 223
        Top = 488
        Width = 158
        Height = 33
        EditLabel.Width = 118
        EditLabel.Height = 25
        EditLabel.Caption = 'Pre'#231'o Venda'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 6
      end
    end
  end
  object PopupGridProdutos: TPopupMenu
    Left = 927
    Top = 60
    object PopupEditarProduto: TMenuItem
      Caption = 'Editar Produto'
    end
    object PopupExcluirProduto: TMenuItem
      Caption = 'Excluir Produto'
    end
  end
end
