object frm_Clientes: Tfrm_Clientes
  Left = 0
  Top = 0
  ActiveControl = ControlePaginasCliente
  Caption = 'Gest'#227'o de Clientes'
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
  object ControlePaginasCliente: TPageControl
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
    OnChanging = ControlePaginasClienteChanging
    object Visualização: TTabSheet
      Caption = 'Visualiza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Grid_Clientes: TStringGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 600
        Align = alClient
        ColCount = 9
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupGridClientes
        TabOrder = 0
        OnDblClick = PopupEditarClienteClick
        OnKeyPress = Grid_ClientesKeyPress
        OnSelectCell = Grid_ClientesSelectCell
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
          OnClick = btn_FecharClick
          OnKeyPress = Grid_ClientesKeyPress
        end
        object cbx_PesquisaCliente: TComboBox
          Left = 8
          Top = 37
          Width = 218
          Height = 33
          TabOrder = 1
          OnChange = cbx_PesquisaClienteChange
          OnKeyPress = Grid_ClientesKeyPress
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
          OnChange = cli_PesquisaChange
        end
      end
    end
    object CRUD_Cliente: TTabSheet
      Caption = 'Cadastro/Edi'#231#227'o'
      ImageIndex = 1
      object label_Telefone: TLabel
        Left = 134
        Top = 239
        Width = 80
        Height = 25
        Caption = 'Telefone'
        Enabled = False
      end
      object label_CPF: TLabel
        Left = 178
        Top = 186
        Width = 36
        Height = 25
        Caption = 'CPF'
        Enabled = False
      end
      object label_DataNascimento: TLabel
        Left = 26
        Top = 507
        Width = 188
        Height = 25
        Caption = 'Data de Nascimento'
        Enabled = False
      end
      object cli_Codigo: TLabeledEdit
        Left = 223
        Top = 24
        Width = 158
        Height = 33
        EditLabel.Width = 64
        EditLabel.Height = 25
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 0
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_Nome: TLabeledEdit
        Left = 223
        Top = 77
        Width = 641
        Height = 33
        EditLabel.Width = 54
        EditLabel.Height = 25
        EditLabel.Caption = 'Nome'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 1
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_Endereco: TLabeledEdit
        Left = 223
        Top = 130
        Width = 641
        Height = 33
        EditLabel.Width = 87
        EditLabel.Height = 25
        EditLabel.Caption = 'Endere'#231'o'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 2
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_Email: TLabeledEdit
        Left = 220
        Top = 289
        Width = 644
        Height = 33
        EditLabel.Width = 57
        EditLabel.Height = 25
        EditLabel.Caption = 'E-Mail'
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 3
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_Sexo: TRadioGroup
        Left = 220
        Top = 328
        Width = 644
        Height = 73
        Caption = 'Sexo'
        Columns = 3
        Enabled = False
        Items.Strings = (
          'Masculino'
          'Feminino'
          'Outro')
        TabOrder = 4
      end
      object cli_Telefone: TMaskEdit
        Left = 220
        Top = 236
        Width = 161
        Height = 33
        Enabled = False
        EditMask = '(99)99999-9999'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_CPF: TMaskEdit
        Left = 223
        Top = 183
        Width = 158
        Height = 33
        Enabled = False
        EditMask = '999.999.999-99'
        MaxLength = 14
        TabOrder = 6
        Text = '   .   .   -  '
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_DataNascimento: TMaskEdit
        Left = 220
        Top = 504
        Width = 118
        Height = 33
        Enabled = False
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '  /  /    '
        OnKeyPress = Grid_ClientesKeyPress
      end
      object cli_Panel2: TPanel
        Left = 0
        Top = 600
        Width = 1000
        Height = 90
        Align = alBottom
        ParentBackground = False
        TabOrder = 8
        object btn_Fechar: TBitBtn
          Left = 818
          Top = 22
          Width = 140
          Height = 50
          Caption = '&Fechar'
          TabOrder = 0
          OnClick = btn_FecharClick
          OnKeyPress = Grid_ClientesKeyPress
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
          OnKeyPress = Grid_ClientesKeyPress
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
          OnKeyPress = Grid_ClientesKeyPress
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
          OnKeyPress = Grid_ClientesKeyPress
        end
        object btn_Novo: TBitBtn
          Left = 26
          Top = 20
          Width = 140
          Height = 50
          Caption = '&Novo'
          TabOrder = 4
          OnClick = btn_NovoClick
          OnKeyPress = Grid_ClientesKeyPress
        end
      end
      object cli_EstadoCivil: TRadioGroup
        Left = 220
        Top = 407
        Width = 644
        Height = 77
        Caption = 'Estado Civil'
        Columns = 4
        Enabled = False
        Items.Strings = (
          'Solteiro(a)'
          'Casado(a)'
          'Divorciado(a)'
          'Vi'#250'vo(a)')
        TabOrder = 9
      end
    end
  end
  object PopupGridClientes: TPopupMenu
    Left = 668
    Top = 84
    object PopupEditarCliente: TMenuItem
      Caption = 'Editar Cliente'
      OnClick = PopupEditarClienteClick
    end
    object PopupExcluirCliente: TMenuItem
      Caption = 'Excluir Cliente'
      OnClick = PopupExcluirClienteClick
    end
  end
end
