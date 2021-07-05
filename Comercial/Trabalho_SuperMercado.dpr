program Trabalho_SuperMercado;

uses
  Vcl.Forms,
  Unit_Principal in 'Unit_Principal.pas' {SuperMercadoDEF},
  Unit_Clientes in 'Unit_Clientes.pas' {frm_Clientes},
  Unit_DM in 'Unit_DM.pas' {DM},
  Unit_Persistencia in 'Unit_Persistencia.pas',
  Unit_Utils in 'Unit_Utils.pas',
  Unit_Supermercado in 'Unit_Supermercado.pas' {frm_Supermercado},
  Unit_Produtos in 'Unit_Produtos.pas' {frm_Produtos},
  Unit_Fornecedor in 'Unit_Fornecedor.pas' {frm_Fornecedores},
  Unit_Venda in 'Unit_Venda.pas' {frm_Venda},
  Unit_SelecaoDeProdutos in 'Unit_SelecaoDeProdutos.pas' {frm_SelecaoDeProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSuperMercadoDEF, SuperMercadoDEF);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Produtos, frm_Produtos);
  Application.CreateForm(Tfrm_Fornecedores, frm_Fornecedores);
  Application.CreateForm(Tfrm_Venda, frm_Venda);
  Application.CreateForm(Tfrm_SelecaoDeProdutos, frm_SelecaoDeProdutos);
  Application.Run;
end.
