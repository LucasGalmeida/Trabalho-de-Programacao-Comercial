unit Unit_ExibeGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.DBChart, VCLTee.TeeDBCrossTab, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Unit_Caixa, Unit_Persistencia, Vcl.StdCtrls;

type
  Tfrm_ExibeGrafico = class(TForm)
    Chart1: TChart;
    Series1: TPieSeries;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure insereGrafico(Vendas : Array of Dados_Transacao);
    procedure RecuperaVendas();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExibeGrafico: Tfrm_ExibeGrafico;

implementation

{$R *.dfm}

procedure Tfrm_ExibeGrafico.RecuperaVendas();
Var
  Transacoes_Atuais : Transacoes_Realizadas;
  Vendas : Array of Dados_Transacao;
  I, aux : Integer;
  Tamanho : Integer;
begin
  Transacoes_Atuais := Retorna_Transacoes_Realizadas('');
  Tamanho := Length(Transacoes_Atuais)-1;
  SetLength(Vendas, Tamanho);
  aux := 0;
  for I := 0 to Tamanho do
  begin
      if Transacoes_Atuais[I].Cai_Descricao = 'Venda' then
      begin
        Vendas[aux] := Transacoes_Atuais[I];
        aux := aux + 1;
      end;
  end;
  insereGrafico(Vendas);
end;

procedure Tfrm_ExibeGrafico.insereGrafico(Vendas : Array of Dados_Transacao);
var
I : Integer;
//R, B, G : Byte;
jan, fev, mar, abr, mai,
jun, jul, ago, setem,
outu, nov, dez : Integer;
begin

  jan := 0;
  fev := 0;
  mar := 0;
  abr := 0;
  mai := 0;
  jun := 0;
  jul := 0;
  ago := 0;
  setem := 0;
  outu := 0;
  nov := 0;
  dez := 0;

  for I := 0 to Length(Vendas)-1 do
  begin
      if(ComboBox1.Text[4] = Vendas[I].Cai_Data[10]) then
      begin
        if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '1')) then
        begin
          jan := jan + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '2')) then
        begin
          fev := fev + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '3')) then
        begin
          mar := mar + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '4')) then
        begin
          abr := abr + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '5')) then
        begin
          mai := mai + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '6')) then
        begin
          jun := jun + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '7')) then
        begin
          jul := jul + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '8')) then
        begin
          ago := ago + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '0') and (Vendas[I].Cai_Data[5] = '9')) then
        begin
          setem := setem + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '1') and (Vendas[I].Cai_Data[5] = '0')) then
        begin
          outu := outu + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '1') and (Vendas[I].Cai_Data[5] = '1')) then
        begin
          nov := nov + 1;
        end
        else if ((Vendas[I].Cai_Data[4] = '1') and (Vendas[I].Cai_Data[5] = '2')) then
        begin
          dez := dez + 1;
        end
      end;
  end;

  Chart1.Series[0].Visible := True;
  Chart1.Series[0].Clear;
  Chart1.Series[0].Add(jan,'Janeiro', clBlack);
  Chart1.Series[0].Add(fev,'Fevereiro', clGreen);
  Chart1.Series[0].Add(mar,'Março', clNavy);
  Chart1.Series[0].Add(abr,'Abril', clTeal);
  Chart1.Series[0].Add(mai,'Maio', clSilver);
  Chart1.Series[0].Add(jun,'Junho', clRed);
  Chart1.Series[0].Add(jul,'Julho', clLime);
  Chart1.Series[0].Add(ago,'Agosto', clYellow);
  Chart1.Series[0].Add(setem,'Setembro', clBlue);
  Chart1.Series[0].Add(outu,'Outrubro', clAqua);
  Chart1.Series[0].Add(nov,'Novembro', clWhite);
  Chart1.Series[0].Add(dez,'Dezembro', clSkyBlue);


end;

procedure Tfrm_ExibeGrafico.FormShow(Sender: TObject);
begin

   RecuperaVendas();

end;

end.
