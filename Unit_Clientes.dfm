﻿object frm_Clientes: Tfrm_Clientes
  Left = 0
  Top = 0
  ActiveControl = ControlePaginasCliente
  Caption = 'Gest'#227'o de Clientes'
  ClientHeight = 690
  ClientWidth = 982
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
    Width = 982
    Height = 690
    ActivePage = CRUD_Cliente
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
      object Grid_Clientes: TStringGrid
        Left = 0
        Top = 0
        Width = 974
        Height = 560
        Align = alClient
        ColCount = 9
        FixedCols = 0
        RowCount = 2
        PopupMenu = PopupGridClientes
        TabOrder = 0
      end
      object cli_Panel1: TPanel
        Left = 0
        Top = 560
        Width = 974
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
        object cli_Pesquisa: TEdit
          Left = 232
          Top = 37
          Width = 537
          Height = 33
          TabOrder = 0
        end
        object btn_Fechar1: TBitBtn
          Left = 808
          Top = 21
          Width = 140
          Height = 50
          Caption = 'Fechar'
          TabOrder = 1
          OnClick = btn_FecharClick
        end
        object ComboBox1: TComboBox
          Left = 8
          Top = 37
          Width = 218
          Height = 33
          TabOrder = 2
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
      end
      object cli_Panel2: TPanel
        Left = 0
        Top = 560
        Width = 974
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
        end
        object btn_Novo: TBitBtn
          Left = 26
          Top = 20
          Width = 140
          Height = 50
          Caption = '&Novo'
          TabOrder = 4
          OnClick = btn_NovoClick
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
    end
  end
end
