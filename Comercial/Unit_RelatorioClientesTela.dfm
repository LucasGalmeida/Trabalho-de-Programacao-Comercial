object frm_RelatorioClientesTela: Tfrm_RelatorioClientesTela
  Left = 0
  Top = 0
  Caption = 'frm_RelatorioClientesTela'
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
  object Relatorio: TRLReport
    Left = 48
    Top = 24
    Width = 794
    Height = 1123
    DataSource = DM.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 295
        Top = 25
        Width = 127
        Height = 16
        Align = faCenter
        Caption = 'LISTA DE CLIENTES'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 24
        Top = 24
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 648
        Top = 26
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object Corpo: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 120
      object Label1: TLabel
        Left = 36
        Top = 11
        Width = 44
        Height = 16
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 132
        Top = 11
        Width = 38
        Height = 16
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 412
        Top = 11
        Width = 30
        Height = 16
        Caption = 'CPF:'
      end
      object Label4: TLabel
        Left = 36
        Top = 33
        Width = 59
        Height = 16
        Caption = 'Endere'#231'o:'
      end
      object Label5: TLabel
        Left = 412
        Top = 33
        Width = 51
        Height = 16
        Caption = 'Telefone:'
      end
      object Label6: TLabel
        Left = 36
        Top = 55
        Width = 37
        Height = 16
        Caption = 'Email:'
      end
      object Label7: TLabel
        Left = 36
        Top = 77
        Width = 34
        Height = 16
        Caption = 'Sexo:'
      end
      object Label8: TLabel
        Left = 196
        Top = 77
        Width = 72
        Height = 16
        Caption = 'Estado Civil:'
      end
      object Label9: TLabel
        Left = 408
        Top = 77
        Width = 122
        Height = 16
        Caption = 'Data de Nascimento:'
      end
      object Cli_Codigo: TRLDBText
        Left = 86
        Top = 11
        Width = 81
        Height = 16
        DataField = 'CLI_CODIGO'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_Nome: TRLDBText
        Left = 176
        Top = 11
        Width = 69
        Height = 16
        DataField = 'CLI_NOME'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_Telefone: TRLDBText
        Left = 469
        Top = 33
        Width = 98
        Height = 16
        DataField = 'CLI_TELEFONE'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_Email: TRLDBText
        Left = 101
        Top = 55
        Width = 69
        Height = 16
        DataField = 'CLI_EMAIL'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_Sexo: TRLDBText
        Left = 79
        Top = 77
        Width = 65
        Height = 16
        DataField = 'CLI_SEXO'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_Endereco: TRLDBText
        Left = 101
        Top = 33
        Width = 103
        Height = 16
        DataField = 'CLI_ENDERECO'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_EstadoCivil: TRLDBText
        Left = 274
        Top = 77
        Width = 114
        Height = 16
        DataField = 'CLI_ESTADOCIVIL'
        DataSource = DM.DataSource1
        Text = ''
      end
      object Cli_DataNascimento: TRLDBText
        Left = 536
        Top = 77
        Width = 149
        Height = 16
        DataField = 'CLI_DATANASCIMENTO'
        DataSource = DM.DataSource1
        Text = ''
      end
      object RLDraw1: TRLDraw
        Left = 24
        Top = 99
        Width = 673
        Height = 9
        DrawKind = dkLine
      end
      object Cli_Cpf: TRLDBText
        Left = 448
        Top = 11
        Width = 56
        Height = 16
        DataField = 'CLI_CPF'
        DataSource = DM.DataSource1
        Text = ''
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 225
      Width = 718
      Height = 29
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 585
        Top = 6
        Width = 49
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 603
        Top = 6
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel7: TRLLabel
        Left = 597
        Top = 6
        Width = 17
        Height = 16
        Caption = '/'
      end
    end
  end
end
