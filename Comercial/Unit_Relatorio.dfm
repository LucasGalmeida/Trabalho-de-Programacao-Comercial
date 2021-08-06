object frm_Relatorio: Tfrm_Relatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 730
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object panel_Relatorio: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 105
    Align = alTop
    Caption = 'Relat'#243'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btn_Clientes: TBitBtn
    Left = 65
    Top = 149
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de &Clientes'
    TabOrder = 1
    OnClick = btn_ClientesClick
  end
  object btn_Estoque: TBitBtn
    Left = 65
    Top = 306
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de &Estoque M'#237'nimo'
    TabOrder = 2
  end
  object btn_Caixa: TBitBtn
    Left = 65
    Top = 621
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de &Fluxo do Caixa'
    TabOrder = 3
  end
  object btn_Receber: TBitBtn
    Left = 65
    Top = 463
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de Contas a Receber'
    TabOrder = 4
  end
  object btn_Produtos: TBitBtn
    Left = 689
    Top = 149
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de &Produtos'
    TabOrder = 5
  end
  object btn_Vendas: TBitBtn
    Left = 689
    Top = 306
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de &Vendas'
    TabOrder = 6
  end
  object btn_Voltar: TBitBtn
    Left = 689
    Top = 621
    Width = 256
    Height = 50
    Caption = 'Fechar'
    TabOrder = 7
    OnClick = btn_VoltarClick
  end
  object btn_Pagar: TBitBtn
    Left = 689
    Top = 463
    Width = 256
    Height = 50
    Caption = 'Relat'#243'rio de Contas a Pagar'
    TabOrder = 8
  end
end
