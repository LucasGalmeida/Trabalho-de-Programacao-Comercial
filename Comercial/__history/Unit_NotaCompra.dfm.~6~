object frm_NotaCompra: Tfrm_NotaCompra
  Left = 0
  Top = 0
  ActiveControl = ControlePaginasNotaCompra
  Caption = 'Nota Fiscal Compra'
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
  object ControlePaginasNotaCompra: TPageControl
    Left = 0
    Top = 0
    Width = 1008
    Height = 730
    ActivePage = NotaCompra
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Visualização: TTabSheet
      Caption = 'Visualiza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Grid_NotasCompra: TStringGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 600
        Align = alClient
        ColCount = 6
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
      object nv_Panel1: TPanel
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
        object nc_ComboBox: TLabel
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
        object cbx_PesquisaNota: TComboBox
          Left = 8
          Top = 37
          Width = 218
          Height = 33
          TabOrder = 1
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o'
            'Data')
        end
        object nc_Pesquisa: TMaskEdit
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
    object NotaCompra: TTabSheet
      Caption = 'NotaCompra'
      ImageIndex = 1
      object nc_Panel2: TPanel
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
          OnClick = btn_Fechar1Click
        end
        object btn_Imprimir: TBitBtn
          Left = 70
          Top = 24
          Width = 140
          Height = 50
          Caption = '&Imprimir'
          Enabled = False
          TabOrder = 1
        end
      end
      object nc_Codigo: TLabeledEdit
        Left = 231
        Top = 24
        Width = 126
        Height = 33
        EditLabel.Width = 144
        EditLabel.Height = 25
        EditLabel.Caption = 'C'#243'digo da Nota'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 1
      end
      object nc_CodigoFornecedor: TLabeledEdit
        Left = 231
        Top = 63
        Width = 126
        Height = 33
        EditLabel.Width = 206
        EditLabel.Height = 25
        EditLabel.Caption = 'C'#243'digo do Fornecedor'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 2
      end
      object nc_Data: TLabeledEdit
        Left = 499
        Top = 63
        Width = 158
        Height = 33
        EditLabel.Width = 43
        EditLabel.Height = 25
        EditLabel.Caption = 'Data'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 3
      end
      object GRID_ProdutosNotaCompra: TStringGrid
        Left = 0
        Top = 112
        Width = 1000
        Height = 488
        Align = alBottom
        RowCount = 2
        TabOrder = 4
      end
      object nc_ValorTotal: TLabeledEdit
        Left = 818
        Top = 63
        Width = 158
        Height = 33
        EditLabel.Width = 101
        EditLabel.Height = 25
        EditLabel.Caption = 'Valor Total'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 5
      end
      object nc_Frete: TLabeledEdit
        Left = 499
        Top = 24
        Width = 158
        Height = 33
        EditLabel.Width = 103
        EditLabel.Height = 25
        EditLabel.Caption = 'Valor Frete'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 6
      end
      object nc_Imposto: TLabeledEdit
        Left = 818
        Top = 24
        Width = 158
        Height = 33
        EditLabel.Width = 131
        EditLabel.Height = 25
        EditLabel.Caption = 'Valor Imposto'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 7
      end
    end
  end
end
