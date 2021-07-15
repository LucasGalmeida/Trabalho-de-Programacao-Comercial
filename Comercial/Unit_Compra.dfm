object frm_Compra: Tfrm_Compra
  Left = 0
  Top = 0
  Caption = 'Compra de Produtos'
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
  object panel_Compra: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 730
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object panel_CompraBotoes: TPanel
      Left = 1
      Top = 639
      Width = 1006
      Height = 90
      Align = alBottom
      TabOrder = 0
      object btn_Fechar: TBitBtn
        Left = 824
        Top = 22
        Width = 140
        Height = 50
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = btn_FecharClick
      end
      object btn_add: TBitBtn
        Left = 565
        Top = 21
        Width = 140
        Height = 50
        Caption = 'Adicionar Produto'
        TabOrder = 1
        OnClick = btn_addClick
      end
      object btn_Prazo: TBitBtn
        Left = 306
        Top = 23
        Width = 140
        Height = 50
        Caption = 'Compra a Prazo'
        TabOrder = 2
      end
      object btn_Vista: TBitBtn
        Left = 48
        Top = 24
        Width = 140
        Height = 50
        Caption = 'Compra a Vista'
        TabOrder = 3
      end
    end
    object GRID_Carrinho: TStringGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 638
      Align = alClient
      ColCount = 6
      RowCount = 2
      TabOrder = 1
    end
  end
end
