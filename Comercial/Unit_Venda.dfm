object frm_Venda: Tfrm_Venda
  Left = 0
  Top = 0
  Caption = 'Venda de produtos'
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
  object panel_Venda: TPanel
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
    ExplicitLeft = 376
    ExplicitTop = 256
    ExplicitWidth = 185
    ExplicitHeight = 41
    object panel_VendaBotoes: TPanel
      Left = 1
      Top = 639
      Width = 1006
      Height = 90
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 632
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
        Caption = 'Venda a Prazo'
        TabOrder = 2
        OnClick = btn_PrazoClick
      end
      object btn_Vista: TBitBtn
        Left = 48
        Top = 24
        Width = 140
        Height = 50
        Caption = 'Venda a Vista'
        TabOrder = 3
        OnClick = btn_VistaClick
      end
    end
    object GRID_Carrinho: TStringGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 638
      Align = alClient
      RowCount = 2
      TabOrder = 1
      ExplicitLeft = 400
      ExplicitTop = 264
      ExplicitWidth = 320
      ExplicitHeight = 120
    end
  end
end
