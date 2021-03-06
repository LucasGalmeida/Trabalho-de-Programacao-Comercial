unit Unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Unit_Persistencia, Unit_Clientes, Unit_Produtos, Unit_Supermercado, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Unit_Fornecedor, Unit_Caixa, Unit_ContasReceber, Unit_ContasPagar;

type
  TSuperMercadoDEF = class(TForm)
    MenuPrincipal: TMainMenu;
    Clientes: TMenuItem;
    Cadastro: TMenuItem;
    Fornecedores: TMenuItem;
    Produtos: TMenuItem;
    PanelPrincipal: TPanel;
    PanelPrincipalInferior: TPanel;
    btn_Fechar: TBitBtn;
    BitBtn1: TBitBtn;
    label_NomeFantasia: TLabel;
    label_RazaoSocial: TLabel;
    label_InscricaoEstadual: TLabel;
    label_CNPJ: TLabel;
    label_Endereco: TLabel;
    label_Telefone: TLabel;
    label_Email: TLabel;
    label_NomeResponsavel: TLabel;
    label_TelefoneResponsavel: TLabel;
    label_Lucro: TLabel;
    ransaesFiscais1: TMenuItem;
    SaidadeProdutosvenda1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Caixa1: TMenuItem;
    ContasaPagar1: TMenuItem;
    EntradadeProdutos1: TMenuItem;
    BussinessIntelligence1: TMenuItem;
    Relatrios1: TMenuItem;
    Grficos1: TMenuItem;
    procedure ClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_FecharClick(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure FornecedoresClick(Sender: TObject);
    procedure SaidadeProdutosvenda1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure EntradadeProdutos1Click(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SuperMercadoDEF: TSuperMercadoDEF;

implementation

{$R *.dfm}

uses Unit_Venda, Unit_Compra, Unit_Relatorio, Unit_Grafico;

procedure TSuperMercadoDEF.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Supermercado, frm_Supermercado);
  frm_Supermercado.ShowModal;
  frm_Supermercado.Destroy;
end;

procedure TSuperMercadoDEF.btn_FecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TSuperMercadoDEF.Caixa1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Caixa, frm_Caixa);
  frm_Caixa.ShowModal;
  frm_Caixa.Destroy;
end;

procedure TSuperMercadoDEF.ClientesClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Clientes, frm_Clientes);
  frm_Clientes.ShowModal;
  frm_Clientes.Destroy;
end;


procedure TSuperMercadoDEF.ContasaPagar1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ContasPagar, frm_ContasPagar);
  frm_ContasPagar.ShowModal;
  frm_ContasPagar.Destroy;
end;

procedure TSuperMercadoDEF.ContasaReceber1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ContasReceber, frm_ContasReceber);
  frm_ContasReceber.ShowModal;
  frm_ContasReceber.Destroy;
end;

procedure TSuperMercadoDEF.EntradadeProdutos1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Compra, frm_Compra);
  frm_Compra.ShowModal;
  frm_Compra.Destroy;
end;

procedure TSuperMercadoDEF.FormCreate(Sender: TObject);
var Temp : Dados_Supermercado;
begin

  try
    Temp := Recupera_Dados_Supermercado;
    label_NomeFantasia.Caption := Temp.Sup_NomeFantasia;
    label_RazaoSocial.Caption := Temp.Sup_RazaoSocial;
    label_InscricaoEstadual.Caption := Temp.sup_InscricaoEstadual;
    label_CNPJ.Caption := Temp.sup_CNPJ;
    label_Endereco.Caption := Temp.sup_Endereco;
    label_Lucro.Caption := Temp.sup_Lucro;
    label_Telefone.Caption := Temp.sup_Telefone;
    label_Email.Caption := Temp.sup_Email;
    label_NomeResponsavel.Caption := Temp.sup_NomeResponsavel;
    label_TelefoneResponsavel.Caption := Temp.Sup_TelefoneResponsavel;
  except

  End;




//    label_NomeFantasia.Caption := Temp.Sup_NomeFantasia;

end;

procedure TSuperMercadoDEF.FornecedoresClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Fornecedores, frm_Fornecedores);
  frm_Fornecedores.ShowModal;
  frm_Fornecedores.Destroy;
end;

procedure TSuperMercadoDEF.Grficos1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Grafico, frm_Grafico);
  frm_Grafico.ShowModal;
  frm_Grafico.Destroy;
end;

procedure TSuperMercadoDEF.ProdutosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Produtos, frm_Produtos);
  frm_Produtos.ShowModal;
  frm_Produtos.Destroy;
end;

procedure TSuperMercadoDEF.Relatrios1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Relatorio, frm_Relatorio);
  frm_Relatorio.ShowModal;
  frm_Relatorio.Destroy;
end;

procedure TSuperMercadoDEF.SaidadeProdutosvenda1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Venda, frm_Venda);
  frm_Venda.ShowModal;
  frm_Venda.Destroy;
end;

end.
