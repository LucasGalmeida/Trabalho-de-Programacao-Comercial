unit Unit_NotaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, System.StrUtils;

type
  Tfrm_NotaVenda = class(TForm)
    ControlePaginasNotaVenda: TPageControl;
    Visualiza??o: TTabSheet;
    Grid_NotasVenda: TStringGrid;
    nv_Panel1: TPanel;
    nv_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaNota: TComboBox;
    nv_Pesquisa: TMaskEdit;
    NotaVenda: TTabSheet;
    nv_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Imprimir: TBitBtn;
    nv_Codigo: TLabeledEdit;
    nv_CodigoCliente: TLabeledEdit;
    nv_Data: TLabeledEdit;
    GRID_ProdutosNotaVenda: TStringGrid;
    nv_ValorTotal: TLabeledEdit;
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
  frm_NotaVenda: Tfrm_NotaVenda;
  codigoNota: String;

implementation

{$R *.dfm}

uses Unit_Persistencia;

procedure Tfrm_NotaVenda.pegaCodigoNota(codigo : String);
begin
  codigoNota := codigo
end;

procedure Tfrm_NotaVenda.btn_Fechar1Click(Sender: TObject);
begin
  frm_NotaVenda.Close;
end;

Procedure Tfrm_NotaVenda.Pinta_Grid;
begin
  GRID_ProdutosNotaVenda.Cells[0,0] := 'C?digo Produto';
  GRID_ProdutosNotaVenda.Cells[1,0] := 'Descricao';
  GRID_ProdutosNotaVenda.Cells[2,0] := 'Quantidade';
  GRID_ProdutosNotaVenda.Cells[3,0] := 'Valor Unidade';
  GRID_ProdutosNotaVenda.Cells[4,0] := 'Valor Total';
  GRID_ProdutosNotaVenda.ColWidths[0] := 180;
  GRID_ProdutosNotaVenda.ColWidths[1] := 250;
  GRID_ProdutosNotaVenda.ColWidths[2] := 120;
  GRID_ProdutosNotaVenda.ColWidths[3] := 150;
  GRID_ProdutosNotaVenda.ColWidths[4] := 150;
end;

procedure Tfrm_NotaVenda.Preenche_Componentes;
Var
  Temp : Dados_NotaVenda;
  aux : String;

  Lista : TStringList;
  Produtos : TStringList;
  I : Integer;
  Linha : Integer;

Begin
  if codigoNota = '-/-' then
  begin
    ShowMessage('N?o h? nota fiscal para essa venda');
    Exit;
  end;

  Temp := Retorna_NotaVenda(StrToInt(codigoNota));
  nv_Codigo.Text := intToStr(Temp.Nv_Codigo);

  aux :=  intToStr(Temp.Nv_CodigoCliente);
  if aux = '-1' then
  begin
      nv_CodigoCliente.Text := '-/-';
  end
  else begin
      nv_CodigoCliente.Text := aux
  end;
  nv_Data.Text := Temp.Nv_Data;
  nv_ValorTotal.Text := Temp.Nv_ValorTotal;

  Lista := TStringList.Create;
  Produtos := TStringList.Create;

  Lista.Text := ReplaceStr(Temp.Nv_ProdutosVendidos, '\n', #13#10);

  Linha := 1;
  for I := 0 to Lista.Count-1 do
  begin
  Produtos.Text := ReplaceStr(Lista[I],':', #13#10);
  GRID_ProdutosNotaVenda.Cells[0, Linha] := Produtos[0];
  GRID_ProdutosNotaVenda.Cells[1, Linha] := Produtos[1];
  GRID_ProdutosNotaVenda.Cells[2, Linha] := Produtos[2];
  GRID_ProdutosNotaVenda.Cells[3, Linha] := Produtos[3];
  GRID_ProdutosNotaVenda.Cells[4, Linha] := Produtos[4];
  Linha := Linha + 1;
  GRID_ProdutosNotaVenda.RowCount := GRID_ProdutosNotaVenda.RowCount + 1;
  end;


end;

procedure Tfrm_NotaVenda.FormShow(Sender: TObject);
begin
    frm_NotaVenda.ControlePaginasNotaVenda.ActivePageIndex := 1;
    Pinta_Grid;
    Preenche_Componentes;
end;

end.
