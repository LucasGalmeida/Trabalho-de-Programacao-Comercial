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
  Unit_SelecaoDeProdutos in 'Unit_SelecaoDeProdutos.pas' {frm_SelecaoDeProdutos},
  Unit_SelecaoDeClientes in 'Unit_SelecaoDeClientes.pas' {frm_SelecaoDeClientes},
  Unit_Caixa in 'Unit_Caixa.pas' {frm_Caixa},
  Unit_ContasReceber in 'Unit_ContasReceber.pas' {frm_ContasReceber},
  Unit_ContasPagar in 'Unit_ContasPagar.pas' {frm_ContasPagar},
  Unit_Compra in 'Unit_Compra.pas' {frm_Compra},
  Unit_SelecaoDeProdutosFornecedor in 'Unit_SelecaoDeProdutosFornecedor.pas' {frm_SelecaoDeProdutosFornecedor},
  Unit_NotaVenda in 'Unit_NotaVenda.pas' {frm_NotaVenda},
  Unit_NotaCompra in 'Unit_NotaCompra.pas' {frm_NotaCompra},
  Unit_SelecaoDeFornecedores in 'Unit_SelecaoDeFornecedores.pas' {frm_SelecaoDeFornecedores},
  Unit_Relatorio in 'Unit_Relatorio.pas' {frm_Relatorio},
  Unit_RelatorioClientes in 'Unit_RelatorioClientes.pas' {frm_RelatorioClientes},
  Unit_RelatorioClientesTela in 'Unit_RelatorioClientesTela.pas' {frm_RelatorioClientesTela},
  Unit_Grafico in 'Unit_Grafico.pas' {frm_Grafico},
  Unit_ExibeGrafico in 'Unit_ExibeGrafico.pas' {frm_ExibeGrafico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSuperMercadoDEF, SuperMercadoDEF);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Supermercado, frm_Supermercado);
  Application.CreateForm(Tfrm_Caixa, frm_Caixa);
  Application.CreateForm(Tfrm_Clientes, frm_Clientes);
  Application.CreateForm(Tfrm_Produtos, frm_Produtos);
  Application.CreateForm(Tfrm_Fornecedores, frm_Fornecedores);
  Application.CreateForm(Tfrm_Venda, frm_Venda);
  Application.CreateForm(Tfrm_SelecaoDeProdutos, frm_SelecaoDeProdutos);
  Application.CreateForm(Tfrm_SelecaoDeClientes, frm_SelecaoDeClientes);
  Application.CreateForm(Tfrm_SelecaoDeProdutosFornecedor, frm_SelecaoDeProdutosFornecedor);
  Application.CreateForm(Tfrm_SelecaoDeFornecedores, frm_SelecaoDeFornecedores);
  Application.CreateForm(Tfrm_ContasReceber, frm_ContasReceber);
  Application.CreateForm(Tfrm_ContasPagar, frm_ContasPagar);
  Application.CreateForm(Tfrm_Compra, frm_Compra);
  Application.CreateForm(Tfrm_NotaVenda, frm_NotaVenda);
  Application.CreateForm(Tfrm_NotaCompra, frm_NotaCompra);
  Application.CreateForm(Tfrm_Relatorio, frm_Relatorio);
  Application.CreateForm(Tfrm_RelatorioClientes, frm_RelatorioClientes);
  Application.CreateForm(Tfrm_RelatorioClientesTela, frm_RelatorioClientesTela);
  Application.CreateForm(Tfrm_Grafico, frm_Grafico);
  Application.CreateForm(Tfrm_ExibeGrafico, frm_ExibeGrafico);
  Application.Run;
end.
