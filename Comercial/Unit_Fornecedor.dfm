object frm_Fornecedores: Tfrm_Fornecedores
  Left = 0
  Top = 0
  ActiveControl = ControlePaginasFornecedor
  Caption = 'Gest'#227'o de Fornecedores'
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupGridFornecedores
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ControlePaginasFornecedor: TPageControl
    Left = 0
    Top = 0
    Width = 1008
    Height = 730
    ActivePage = Visualização
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChanging = ControlePaginasFornecedorChanging
    object Visualização: TTabSheet
      Caption = 'Visualiza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Grid_Fornecedores: TStringGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 600
        Align = alClient
        ColCount = 8
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        OnDblClick = PopupEditarFornecedorClick
        OnKeyPress = Grid_FornecedoresKeyPress
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
      object for_Panel1: TPanel
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
          OnClick = btn_FecharClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
        object cbx_PesquisaFornecedor: TComboBox
          Left = 8
          Top = 37
          Width = 218
          Height = 33
          TabOrder = 1
          OnChange = cbx_PesquisaFornecedorChange
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
          OnChange = for_PesquisaChange
        end
      end
    end
    object CRUD_Fornecedor: TTabSheet
      Caption = 'Cadastro/Edi'#231#227'o'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object label_CNPJ: TLabel
        Left = 174
        Top = 322
        Width = 48
        Height = 25
        Caption = 'CNPJ'
      end
      object label_InscricaoEstadual: TLabel
        Left = 64
        Top = 250
        Width = 170
        Height = 25
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object label_Telefone: TLabel
        Left = 142
        Top = 468
        Width = 80
        Height = 25
        Caption = 'Telefone'
      end
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
          OnClick = btn_FecharClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
        object btn_Gravar: TBitBtn
          Left = 620
          Top = 23
          Width = 140
          Height = 50
          Caption = '&Gravar'
          Enabled = False
          TabOrder = 1
          OnClick = btn_GravarClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
        object btn_Limpar: TBitBtn
          Left = 422
          Top = 24
          Width = 140
          Height = 50
          Caption = '&Limpar'
          Enabled = False
          TabOrder = 2
          OnClick = btn_LimparClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
        object btn_Cancelar: TBitBtn
          Left = 224
          Top = 21
          Width = 140
          Height = 50
          Caption = '&Cancelar'
          Enabled = False
          TabOrder = 3
          OnClick = btn_CancelarClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
        object btn_Novo: TBitBtn
          Left = 26
          Top = 20
          Width = 140
          Height = 50
          Caption = '&Novo'
          TabOrder = 4
          OnClick = btn_NovoClick
          OnKeyPress = Grid_FornecedoresKeyPress
        end
      end
      object for_CNPJ: TMaskEdit
        Left = 240
        Top = 319
        Width = 191
        Height = 33
        EditMask = '99.999.999/9999-99'
        MaxLength = 18
        TabOrder = 1
        Text = '  .   .   /    -  '
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_Email: TLabeledEdit
        Left = 240
        Top = 538
        Width = 638
        Height = 33
        EditLabel.Width = 57
        EditLabel.Height = 25
        EditLabel.Caption = 'E-Mail'
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 2
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_Endereco: TLabeledEdit
        Left = 240
        Top = 392
        Width = 638
        Height = 33
        EditLabel.Width = 87
        EditLabel.Height = 25
        EditLabel.Caption = 'Endere'#231'o'
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 3
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_InscricaoEstadual: TMaskEdit
        Left = 240
        Top = 247
        Width = 159
        Height = 33
        EditMask = '999.999.999.999'
        MaxLength = 15
        TabOrder = 4
        Text = '   .   .   .   '
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_NomeFantasia: TLabeledEdit
        Left = 240
        Top = 101
        Width = 639
        Height = 33
        EditLabel.Width = 138
        EditLabel.Height = 25
        EditLabel.Caption = 'Nome Fantasia'
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 5
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_RazaoSocial: TLabeledEdit
        Left = 240
        Top = 174
        Width = 639
        Height = 33
        EditLabel.Width = 116
        EditLabel.Height = 25
        EditLabel.Caption = 'Raz'#227'o Social'
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 6
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_Telefone: TMaskEdit
        Left = 240
        Top = 465
        Width = 161
        Height = 33
        EditMask = '(99)99999-9999'
        MaxLength = 14
        TabOrder = 7
        Text = '(  )     -    '
        OnKeyPress = Grid_FornecedoresKeyPress
      end
      object for_Codigo: TLabeledEdit
        Left = 240
        Top = 29
        Width = 140
        Height = 33
        EditLabel.Width = 64
        EditLabel.Height = 25
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 8
        OnKeyPress = Grid_FornecedoresKeyPress
      end
    end
  end
  object PopupGridFornecedores: TPopupMenu
    Left = 927
    Top = 60
    object PopupEditarFornecedor: TMenuItem
      Caption = 'Editar Fornecedor'
      OnClick = PopupEditarFornecedorClick
    end
    object PopupExcluirFornecedor: TMenuItem
      Caption = 'Excluir Fornecedor'
      OnClick = PopupExcluirFornecedorClick
    end
  end
end
