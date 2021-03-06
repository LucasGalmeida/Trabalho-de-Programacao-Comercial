unit Unit_SelecaoDeProdutosFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Unit_Persistencia;

type
  Tfrm_SelecaoDeProdutosFornecedor = class(TForm)
    Grid_Produtos: TStringGrid;
    prod_Panel1: TPanel;
    prod_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaProduto: TComboBox;
    prod_Pesquisa: TMaskEdit;
    Procedure Pinta_Grid;
    Procedure Popula_Grid(Condicao : String);
    procedure prod_PesquisaChange(Sender: TObject);
    procedure Grid_ProdutosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btn_Fechar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbx_PesquisaProdutoChange(Sender: TObject);
    Procedure Grid_ProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelecaoDeProdutosFornecedor: Tfrm_SelecaoDeProdutosFornecedor;
  Linha : Integer;

implementation

uses Unit_Venda, Unit_Compra;

Procedure Tfrm_SelecaoDeProdutosFornecedor.Popula_Grid(Condicao : String);
Var
  Produtos_Atuais : Produtos_Cadastrados;
  I : Integer;
Begin
  SetLength(Produtos_Atuais,0);
  Grid_Produtos.RowCount := 2;
  Grid_Produtos.Cells[0,1] := '';
  Grid_Produtos.Cells[1,1] := '';
  Grid_Produtos.Cells[2,1] := '';
  Grid_Produtos.Cells[3,1] := '';
  Grid_Produtos.Cells[4,1] := '';
  Grid_Produtos.Cells[5,1] := '';

  Produtos_Atuais := Retorna_Produtos_Cadastrados(Condicao);

  For I := 0 To Length(Produtos_Atuais)-1 Do
    Begin
      Grid_Produtos.RowCount := Grid_Produtos.RowCount + 1;
      Grid_Produtos.Cells[0,I+1] := IntToStr(Produtos_Atuais[I].Prod_Codigo);
      Grid_Produtos.Cells[1,I+1] := Produtos_Atuais[I].Prod_Descricao;
      Grid_Produtos.Cells[2,I+1] := IntToStr(Produtos_Atuais[I].Prod_Estoque);
      Grid_Produtos.Cells[3,I+1] := IntToStr(Produtos_Atuais[I].Prod_EstoqueMinimo);
      Grid_Produtos.Cells[4,I+1] := Produtos_Atuais[I].Prod_PrecoCusto;
      Grid_Produtos.Cells[5,I+1] := Produtos_Atuais[I].Prod_PrecoVenda;
    End;
  Grid_Produtos.RowCount := Grid_Produtos.RowCount - 1;
End;

Procedure Tfrm_SelecaoDeProdutosFornecedor.Pinta_Grid;
begin
  Grid_Produtos.Cells[0,0] := 'C?d.';
  Grid_Produtos.Cells[1,0] := 'Descri??o';
  Grid_Produtos.Cells[2,0] := 'Estoque';
  Grid_Produtos.Cells[3,0] := 'Estoque Minimo';
  Grid_Produtos.Cells[4,0] := 'Pre?o de Custo';
  Grid_Produtos.Cells[5,0] := 'Pre?o de Venda';
  Grid_Produtos.ColWidths[0] := 50;
  Grid_Produtos.ColWidths[1] := 300;
  Grid_Produtos.ColWidths[2] := 100;
  Grid_Produtos.ColWidths[3] := 100;
  Grid_Produtos.ColWidths[4] := 150;
  Grid_Produtos.ColWidths[5] := 150;
end;

 procedure Tfrm_SelecaoDeProdutosFornecedor.prod_PesquisaChange(Sender: TObject);
begin
  if prod_Pesquisa.Text = ''
    then Begin
           Popula_Grid('');
           Exit;
         End;
  case cbx_PesquisaProduto.ItemIndex of
    0 : Popula_Grid('Where Prod_Codigo = '+prod_Pesquisa.Text) ;
    1 : Popula_Grid('Where Prod_Descricao Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;
    2 : Popula_Grid('Where Prod_Estoque = '+prod_Pesquisa.Text) ;
    3 : Popula_Grid('Where Prod_EstoqueMinimo = '+prod_Pesquisa.Text) ;
    4 : Popula_Grid('Where Prod_PrecoCusto Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;
    5 : Popula_Grid('Where Prod_PrecoVenda Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;

  end;
end;

procedure Tfrm_SelecaoDeProdutosFornecedor.btn_Fechar1Click(Sender: TObject);
begin
  frm_SelecaoDeProdutosFornecedor.Close;
end;

procedure Tfrm_SelecaoDeProdutosFornecedor.cbx_PesquisaProdutoChange(Sender: TObject);
begin
  prod_Pesquisa.Enabled := True;
  prod_Pesquisa.Text := '';
end;

procedure Tfrm_SelecaoDeProdutosFornecedor.FormShow(Sender: TObject);
begin
   Pinta_Grid;
   Popula_Grid('');
end;

Function Preco_Total() : String;
var
  I : Integer;
  count : Extended;
  TotalDeLinhas : Integer;
  aux : String;
Begin
  count := 0;
  TotalDeLinhas := frm_Compra.GRID_Carrinho.RowCount - 2;
  For I := 1 To TotalDeLinhas Do
    Begin
       aux := frm_Compra.GRID_Carrinho.Cells[5, I];
       count := count + StrToFloat(aux);
    End;
  Result := FloatToStr(count);
end;

Procedure Tfrm_SelecaoDeProdutosFornecedor.Grid_ProdutosDblClick(Sender: TObject);
var Temp : Dados_Produto;
var Qtd  : String;
var aux1  : Extended;
var aux2  : Integer;
begin
  if Grid_Produtos.Cells[0,Linha] = ''
      then Exit;

  Temp := Retorna_Dados_Produto(StrToInt(Grid_Produtos.Cells[0,Linha]));

  Qtd := InputBox('Digite a Quantidade','Digite a Quantidade', '0');
  if Qtd = '0' then
       begin
         ShowMessage('Quantidade n?o pode ser igual a 0.');
       end
  else begin

    aux1 := StrToFloat(Temp.Prod_PrecoVenda);
    aux2 := StrToInt(Qtd);

    // GRID COMPRA
    frm_Compra.GRID_Carrinho.RowCount := frm_Compra.GRID_Carrinho.RowCount + 1;
    frm_Compra.GRID_Carrinho.Cells[0, frm_Compra.GRID_Carrinho.RowCount - 2] := IntToStr(Temp.Prod_Codigo);
    frm_Compra.GRID_Carrinho.Cells[1, frm_Compra.GRID_Carrinho.RowCount - 2] := Temp.Prod_Descricao;
    frm_Compra.GRID_Carrinho.Cells[2, frm_Compra.GRID_Carrinho.RowCount - 2] := Qtd;
    frm_Compra.GRID_Carrinho.Cells[3, frm_Compra.GRID_Carrinho.RowCount - 2] := IntToStr(Temp.Prod_Estoque);
    frm_Compra.GRID_Carrinho.Cells[4, frm_Compra.GRID_Carrinho.RowCount - 2] := Temp.Prod_PrecoVenda;
    frm_Compra.GRID_Carrinho.Cells[5, frm_Compra.GRID_Carrinho.RowCount - 2] := FloatToStr(aux1 * aux2);
    frm_Compra.GRID_Carrinho.Cells[4, frm_Compra.GRID_Carrinho.RowCount - 1] := 'Total da Compra:';
    frm_Compra.GRID_Carrinho.Cells[5, frm_Compra.GRID_Carrinho.RowCount - 1] := Preco_Total;
    frm_SelecaoDeProdutosFornecedor.Close;
  end;

end;

procedure Tfrm_SelecaoDeProdutosFornecedor.Grid_ProdutosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

{$R *.dfm}

end.
