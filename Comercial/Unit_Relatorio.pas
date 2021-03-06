unit Unit_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_Relatorio = class(TForm)
    panel_Relatorio: TPanel;
    btn_Clientes: TBitBtn;
    btn_Estoque: TBitBtn;
    btn_Caixa: TBitBtn;
    btn_Receber: TBitBtn;
    btn_Produtos: TBitBtn;
    btn_Vendas: TBitBtn;
    btn_Voltar: TBitBtn;
    btn_Pagar: TBitBtn;
    procedure btn_VoltarClick(Sender: TObject);
    procedure btn_ClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Relatorio: Tfrm_Relatorio;

implementation

{$R *.dfm}

uses Unit_RelatorioClientes, Unit_RelatorioClientesTela;

procedure Tfrm_Relatorio.btn_ClientesClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_RelatorioClientesTela, frm_RelatorioClientesTela);
  frm_RelatorioClientesTela.ShowModal;
  frm_RelatorioClientesTela.Destroy;
end;

procedure Tfrm_Relatorio.btn_VoltarClick(Sender: TObject);
begin
  frm_Relatorio.Close
end;

end.
