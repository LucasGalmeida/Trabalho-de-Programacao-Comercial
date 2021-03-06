unit Unit_NotaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, System.StrUtils;

type
  Tfrm_NotaCompra = class(TForm)
    ControlePaginasNotaCompra: TPageControl;
    Visualiza??o: TTabSheet;
    Grid_NotasCompra: TStringGrid;
    nv_Panel1: TPanel;
    nc_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaNota: TComboBox;
    nc_Pesquisa: TMaskEdit;
    NotaCompra: TTabSheet;
    nc_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Imprimir: TBitBtn;
    nc_Codigo: TLabeledEdit;
    nc_CodigoFornecedor: TLabeledEdit;
    nc_Data: TLabeledEdit;
    GRID_ProdutosNotaCompra: TStringGrid;
    nc_ValorTotal: TLabeledEdit;
    nc_Frete: TLabeledEdit;
    nc_Imposto: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_Fechar1Click(Sender: TObject);
    Procedure Preenche_Componentes;
    procedure pegaCodigoNota(codigo : String);
    procedure Pinta_Grid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_NotaCompra: Tfrm_NotaCompra;
  codigoNota : String;

implementation

{$R *.dfm}

uses Unit_Persistencia;

procedure Tfrm_NotaCompra.pegaCodigoNota(codigo : String);
begin
  codigoNota := codigo
end;

procedure Tfrm_NotaCompra.btn_Fechar1Click(Sender: TObject);
begin
  frm_NotaCompra.Close;
end;

Procedure Tfrm_NotaCompra.Pinta_Grid;
begin
  GRID_ProdutosNotaCompra.Cells[0,0] := 'C?digo Produto';
  GRID_ProdutosNotaCompra.Cells[1,0] := 'Descricao';
  GRID_ProdutosNotaCompra.Cells[2,0] := 'Quantidade';
  GRID_ProdutosNotaCompra.Cells[3,0] := 'Valor Unidade';
  GRID_ProdutosNotaCompra.Cells[4,0] := 'Valor Total';
  GRID_ProdutosNotaCompra.ColWidths[0] := 180;
  GRID_ProdutosNotaCompra.ColWidths[1] := 250;
  GRID_ProdutosNotaCompra.ColWidths[2] := 120;
  GRID_ProdutosNotaCompra.ColWidths[3] := 150;
  GRID_ProdutosNotaCompra.ColWidths[4] := 150;
end;

procedure Tfrm_NotaCompra.Preenche_Componentes;
Var
  Temp : Dados_NotaCompra;
  aux : String;

  Lista : TStringList;
  Produtos : TStringList;
  I : Integer;
  Linha : Integer;

Begin
  if codigoNota = '-/-' then
  begin
    ShowMessage('N?o h? nota fiscal para essa compra');
    Exit;
  end;

  Temp := Retorna_NotaCompra(StrToInt(codigoNota));
  nc_Codigo.Text := intToStr(Temp.Nc_Codigo);

  aux :=  intToStr(Temp.Nc_CodigoFornecedor);
  if aux = '-1' then
  begin
      nc_CodigoFornecedor.Text := '-/-';
  end
  else begin
      nc_CodigoFornecedor.Text := aux
  end;
  nc_Data.Text := Temp.Nc_Data;
  nc_Frete.Text := Temp.Nc_Frete;
  nc_Imposto.Text := Temp.Nc_Imposto;
  nc_ValorTotal.Text := Temp.Nc_ValorTotal;

  Lista := TStringList.Create;
  Produtos := TStringList.Create;

  Lista.Text := ReplaceStr(Temp.Nc_ProdutosComprados, '\n', #13#10);

  Linha := 1;
  for I := 0 to Lista.Count-1 do
  begin
  Produtos.Text := ReplaceStr(Lista[I],':', #13#10);
  GRID_ProdutosNotaCompra.Cells[0, Linha] := Produtos[0];
  GRID_ProdutosNotaCompra.Cells[1, Linha] := Produtos[1];
  GRID_ProdutosNotaCompra.Cells[2, Linha] := Produtos[2];
  GRID_ProdutosNotaCompra.Cells[3, Linha] := Produtos[3];
  GRID_ProdutosNotaCompra.Cells[4, Linha] := Produtos[4];
  Linha := Linha + 1;
  GRID_ProdutosNotaCompra.RowCount := GRID_ProdutosNotaCompra.RowCount + 1;
  end;


end;

procedure Tfrm_NotaCompra.FormShow(Sender: TObject);
begin
    frm_NotaCompra.ControlePaginasNotaCompra.ActivePageIndex := 1;
    Pinta_Grid;
    Preenche_Componentes;
end;

end.
