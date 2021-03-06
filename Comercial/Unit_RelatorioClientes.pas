unit Unit_RelatorioClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Unit_Persistencia, Unit_DM;

type
  Tfrm_RelatorioClientes = class(TForm)
    panel_Relatorio: TPanel;
    btn_Voltar: TBitBtn;
    label_CodInicio: TLabeledEdit;
    label_CodFinal: TLabeledEdit;
    btn_Codigo: TBitBtn;
    BitBtn1: TBitBtn;
    cli_Sexo: TRadioGroup;
    procedure btn_VoltarClick(Sender: TObject);
    procedure btn_CodigoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelatorioClientes: Tfrm_RelatorioClientes;

implementation

{$R *.dfm}

uses Unit_RelatorioClientesTela;


procedure Tfrm_RelatorioClientes.btn_CodigoClick(Sender: TObject);
var
condicao : String;
begin
  if (label_CodInicio.Text <> '') or (label_CodInicio.Text <> '') then
  begin
  if (StrToInt(label_CodInicio.Text) < StrToInt(label_CodFinal.Text)) then
    begin
      condicao := 'WHERE CLI_CODIGO BETWEEN '+label_CodInicio.Text+' AND '+label_CodFinal.Text+' ORDER BY CLI_CODIGO';
      //frm_RelatorioClientesTela.Relatorio.previewModal;
      Application.CreateForm(Tfrm_RelatorioClientesTela, frm_RelatorioClientesTela);
      //frm_RelatorioClientesTela.SetaCondicao(condicao);
      frm_RelatorioClientesTela.ShowModal;
      frm_RelatorioClientesTela.Destroy;
    end
  else
    begin
      Application.MessageBox('Valor do primeiro campo maior que o segundo campo!', 'Aten??o', MB_ICONINFORMATION+MB_OK);
      Exit;
    end;
  end
  else
    begin
      Application.MessageBox('Preencha o fitro do c?digo para gerar o relat?rio', 'Aten??o', MB_ICONINFORMATION+MB_OK);
      Exit;
    end;
end;

procedure Tfrm_RelatorioClientes.btn_VoltarClick(Sender: TObject);
begin
  frm_RelatorioClientes.Close;
end;

end.
