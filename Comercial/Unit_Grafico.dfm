object frm_Grafico: Tfrm_Grafico
  Left = 0
  Top = 0
  Caption = 'Gr'#225'ficos'
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
  object Bitbtn5: TBitBtn
    Left = 89
    Top = 149
    Width = 256
    Height = 50
    Caption = 'Vendas &totais por m'#234's'
    TabOrder = 0
    OnClick = Bitbtn5Click
  end
  object Bitbtn4: TBitBtn
    Left = 625
    Top = 149
    Width = 256
    Height = 50
    Caption = 'Vendas totais por produto por m'#234's'
    TabOrder = 1
  end
  object Bitbtn6: TBitBtn
    Left = 625
    Top = 621
    Width = 256
    Height = 50
    Caption = 'Fechar'
    TabOrder = 2
  end
  object panel_Graficos: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 105
    Align = alTop
    Caption = 'Gr'#225'ficos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 89
    Top = 365
    Width = 256
    Height = 50
    Caption = 'Vendas por &dia'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 625
    Top = 365
    Width = 256
    Height = 50
    Caption = 'Vendas por &m'#234's'
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 89
    Top = 621
    Width = 256
    Height = 50
    Caption = 'Vendas por produto por &m'#234's'
    TabOrder = 6
  end
end
