object frm_ExibeGrafico: Tfrm_ExibeGrafico
  Left = 0
  Top = 0
  Caption = 'frm_ExibeGrafico'
  ClientHeight = 660
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 1034
    Height = 585
    Title.Text.Strings = (
      'Gr'#225'fico')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      ExplodeBiggest = 30
      OtherSlice.Legend.Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 585
    Width = 1034
    Height = 75
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 120
      Height = 19
      Caption = 'Selecione o Ano:'
    end
    object ComboBox1: TComboBox
      Left = 144
      Top = 16
      Width = 145
      Height = 27
      ItemIndex = 0
      TabOrder = 0
      Text = '2021'
      OnChange = FormShow
      Items.Strings = (
        '2021'
        '2022'
        '2023'
        '2024')
    end
  end
end
