object frm_Supermercado: Tfrm_Supermercado
  Left = 0
  Top = 0
  Caption = 'Edi'#231#227'o de dados do Supermercado'
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object PanelSupermercado: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 730
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object label_Telefone: TLabel
      Left = 169
      Top = 399
      Width = 80
      Height = 25
      Caption = 'Telefone'
    end
    object label_TelefoneResponsavel: TLabel
      Left = 18
      Top = 587
      Width = 231
      Height = 25
      Caption = 'Telefone do Respons'#225'vel'
    end
    object label_CNPJ: TLabel
      Left = 193
      Top = 211
      Width = 48
      Height = 25
      Caption = 'CNPJ'
    end
    object label_InscricaoEstadual: TLabel
      Left = 79
      Top = 147
      Width = 170
      Height = 25
      Caption = 'Inscri'#231#227'o Estadual'
    end
    object PanelSupermercadoInferior: TPanel
      Left = 1
      Top = 639
      Width = 1006
      Height = 90
      Align = alBottom
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
      object btn_Limpar: TBitBtn
        Left = 402
        Top = 22
        Width = 140
        Height = 50
        Caption = '&Limpar'
        TabOrder = 1
        OnClick = btn_LimparClick
      end
      object btn_Salvar: TBitBtn
        Left = 42
        Top = 22
        Width = 140
        Height = 50
        Caption = '&Salvar'
        TabOrder = 2
        OnClick = btn_SalvarClick
      end
    end
    object sup_NomeFantasia: TLabeledEdit
      Left = 255
      Top = 21
      Width = 641
      Height = 33
      EditLabel.Width = 138
      EditLabel.Height = 25
      EditLabel.Caption = 'Nome Fantasia'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 1
    end
    object sup_RazaoSocial: TLabeledEdit
      Left = 255
      Top = 83
      Width = 641
      Height = 33
      EditLabel.Width = 116
      EditLabel.Height = 25
      EditLabel.Caption = 'Raz'#227'o Social'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 2
    end
    object sup_Endereco: TLabeledEdit
      Left = 255
      Top = 271
      Width = 641
      Height = 33
      EditLabel.Width = 87
      EditLabel.Height = 25
      EditLabel.Caption = 'Endere'#231'o'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 3
    end
    object sup_Email: TLabeledEdit
      Left = 255
      Top = 458
      Width = 641
      Height = 33
      EditLabel.Width = 57
      EditLabel.Height = 25
      EditLabel.Caption = 'E-Mail'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 4
    end
    object sup_NomeResponsavel: TLabeledEdit
      Left = 255
      Top = 521
      Width = 641
      Height = 33
      EditLabel.Width = 205
      EditLabel.Height = 25
      EditLabel.Caption = 'Nome do Respons'#225'vel'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 5
    end
    object sup_Telefone: TMaskEdit
      Left = 255
      Top = 396
      Width = 161
      Height = 33
      EditMask = '(99)99999-9999'
      MaxLength = 14
      TabOrder = 6
      Text = '(  )     -    '
    end
    object sup_TelefoneResponsavel: TMaskEdit
      Left = 255
      Top = 584
      Width = 161
      Height = 33
      EditMask = '(99)99999-9999'
      MaxLength = 14
      TabOrder = 7
      Text = '(  )     -    '
    end
    object sup_CNPJ: TMaskEdit
      Left = 255
      Top = 208
      Width = 194
      Height = 33
      Enabled = False
      EditMask = '99.999.999/9999-99'
      MaxLength = 18
      TabOrder = 8
      Text = '  .   .   /    -  '
    end
    object sup_Lucro: TLabeledEdit
      Left = 255
      Top = 333
      Width = 641
      Height = 33
      EditLabel.Width = 164
      EditLabel.Height = 25
      EditLabel.Caption = 'Margem de Lucro'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 9
    end
    object sup_InscricaoEstadual: TMaskEdit
      Left = 255
      Top = 144
      Width = 161
      Height = 33
      EditMask = '999.999.999.999'
      MaxLength = 15
      TabOrder = 10
      Text = '   .   .   .   '
    end
  end
end
