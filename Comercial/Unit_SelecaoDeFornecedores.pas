unit Unit_SelecaoDeFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids;

type
  Tfrm_SelecaoDeFornecedores = class(TForm)
    for_Panel1: TPanel;
    for_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaFornecedor: TComboBox;
    for_Pesquisa: TMaskEdit;
    Grid_Fornecedores: TStringGrid;
    Procedure Pinta_Grid;
    Procedure Popula_Grid(Condicao : String);
    procedure FormShow(Sender: TObject);
    procedure Grid_FornecedoresSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
    Procedure Grid_FornecedoresDblClick(Sender: TObject);
    procedure btn_Fechar1Click(Sender: TObject);
    procedure Calcula_Valor_Disponivel;
    procedure SetCompraVista;
    procedure SetCompraPrazo;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelecaoDeFornecedores: Tfrm_SelecaoDeFornecedores;
  Linha : Integer;
  ValorDisponivel : String;
  tipoCompra : String;


implementation

{$R *.dfm}

uses Unit_Persistencia, Unit_Compra, Unit_Caixa, Unit_ContasPagar;

Procedure Tfrm_SelecaoDeFornecedores.Pinta_Grid;
begin
  Grid_Fornecedores.Cells[0,0] := 'C?d.';
  Grid_Fornecedores.Cells[1,0] := 'Nome Fantasia';
  Grid_Fornecedores.Cells[2,0] := 'Raz?o Social';
  Grid_Fornecedores.Cells[3,0] := 'Inscri??o Estadual';
  Grid_Fornecedores.Cells[4,0] := 'CNPJ';
  Grid_Fornecedores.Cells[5,0] := 'Endere?o';
  Grid_Fornecedores.Cells[6,0] := 'Telefone';
  Grid_Fornecedores.Cells[7,0] := 'Email';
  Grid_Fornecedores.ColWidths[0] := 50;
  Grid_Fornecedores.ColWidths[1] := 150;
  Grid_Fornecedores.ColWidths[2] := 150;
  Grid_Fornecedores.ColWidths[3] := 150;
  Grid_Fornecedores.ColWidths[4] := 100;
  Grid_Fornecedores.ColWidths[5] := 100;
  Grid_Fornecedores.ColWidths[6] := 100;
  Grid_Fornecedores.ColWidths[7] := 100;
end;

Procedure Tfrm_SelecaoDeFornecedores.Popula_Grid(Condicao : String);
Var
  Fornecedores_Atuais : Fornecedores_Cadastrados;
  I : Integer;
Begin
  SetLength(Fornecedores_Atuais,0);
  Grid_Fornecedores.RowCount := 2;
  Grid_Fornecedores.Cells[0,1] := '';
  Grid_Fornecedores.Cells[1,1] := '';
  Grid_Fornecedores.Cells[2,1] := '';
  Grid_Fornecedores.Cells[3,1] := '';
  Grid_Fornecedores.Cells[4,1] := '';
  Grid_Fornecedores.Cells[5,1] := '';
  Grid_Fornecedores.Cells[6,1] := '';

  Fornecedores_Atuais := Retorna_Fornecedores_Cadastrados(Condicao);
  For I := 0 To Length(Fornecedores_Atuais)-1 Do
    Begin
      Grid_Fornecedores.RowCount := Grid_Fornecedores.RowCount + 1;
      Grid_Fornecedores.Cells[0,I+1] := IntToStr(Fornecedores_Atuais[I].For_Codigo);
      Grid_Fornecedores.Cells[1,I+1] := Fornecedores_Atuais[I].For_NomeFantasia;
      Grid_Fornecedores.Cells[2,I+1] := Fornecedores_Atuais[I].For_RazaoSocial;
      Grid_Fornecedores.Cells[3,I+1] := Fornecedores_Atuais[I].For_InscricaoEstadual;
      Grid_Fornecedores.Cells[4,I+1] := Fornecedores_Atuais[I].For_CNPJ;
      Grid_Fornecedores.Cells[5,I+1] := Fornecedores_Atuais[I].For_Endereco;
      Grid_Fornecedores.Cells[6,I+1] := Fornecedores_Atuais[I].For_Telefone;
      Grid_Fornecedores.Cells[7,I+1] := Fornecedores_Atuais[I].For_Email;
    End;
  Grid_Fornecedores.RowCount := Grid_Fornecedores.RowCount - 1;
End;

procedure Tfrm_SelecaoDeFornecedores.Calcula_Valor_Disponivel;
begin
  Application.CreateForm(Tfrm_Caixa, frm_Caixa);

  frm_Caixa.Pinta_Grid;
  frm_Caixa.Calcula_Valor_Disponivel;
  frm_Caixa.Popula_Grid('');
  frm_Caixa.Calcula_Valor_Total;

  valorDisponivel := frm_Caixa.cai_ValorTotal.Text;

  frm_Caixa.Destroy;
end;

procedure Tfrm_SelecaoDeFornecedores.SetCompraVista;
begin
  tipoCompra := 'Vista';
end;

procedure Tfrm_SelecaoDeFornecedores.SetCompraPrazo;
begin
  tipoCompra := 'Prazo';
end;

procedure Tfrm_SelecaoDeFornecedores.Grid_FornecedoresSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

Procedure Tfrm_SelecaoDeFornecedores.Grid_FornecedoresDblClick(Sender: TObject);
var
Temp : Dados_Fornecedor;
ValorAPagar : String;
I, J : Integer;
Temp2 : Dados_NotaCompra;
aux : String;
Data : TDateTime;
count : String;
entrada : String;
qtdParcelas : String;
frete : String;
imposto : String;

begin

    frete := InputBox('Digite o valor do frete.','Digite o valor do frete.', '0');
    imposto := InputBox('Digite o valor do imposto.','Digite o valor do imposto.', '0');

    Temp := Retorna_Dados_Fornecedor(StrToInt(Grid_Fornecedores.Cells[0,Linha]));
    ValorAPagar := frm_Compra.GRID_Carrinho.Cells[5, frm_Compra.GRID_Carrinho.RowCount - 1];

    aux := '';
    Temp2.Nc_ProdutosComprados := '';
    count := '0';

    if tipoCompra = 'Vista' then
    begin

      Temp2.Nc_Codigo := StrToInt(Retorna_Proximo_Codigo_NotaCompra);
      Temp2.Nc_CodigoFornecedor := Temp.For_Codigo;

      for J := 1 to frm_Compra.GRID_Carrinho.RowCount-2 do
      begin
         count := FloatToStr(StrToFloat(count) + StrToFloat(frm_Compra.GRID_Carrinho.Cells[2, J]));
         aux := (
                  frm_Compra.GRID_Carrinho.Cells[0, J]+':'+frm_Compra.GRID_Carrinho.Cells[1, J]+':'+
                  frm_Compra.GRID_Carrinho.Cells[2, J]+':'+frm_Compra.GRID_Carrinho.Cells[4, J]+':'+
                  frm_Compra.GRID_Carrinho.Cells[5, J]+'\n'
                 );
         Temp2.Nc_ProdutosComprados := Temp2.Nc_ProdutosComprados + aux;
      end;

      Data := StrToDateTime(FormatDateTime('dd/mm/yyyy', Now));
      Temp2.Nc_Data := DateToStr(Data);

      Temp2.Nc_ValorTotal := FloatToStr(
                                        StrToFloat(ValorAPagar) +
                                        StrToFloat(frete) +
                                        StrToFloat(imposto)
                                        );
      Temp2.Nc_Frete := frete;
      Temp2.Nc_Imposto := imposto;


      if StrToFloat(Temp2.Nc_ValorTotal) > StrToFloat(valorDisponivel) then
      begin
            ShowMessage('N?o h? dinheiro suficiente no caixa para realizar esta compra.');
            exit;
      end
      else
        begin
          Grava_Dados_NotaCompra(Temp2);
          frete := FloatToStr(StrToFloat(frete)/StrToFloat(count));
          imposto := FloatToStr(StrToFloat(imposto)/StrToFloat(count));
          frm_Compra.AtualizaEstoque(frete, imposto);
          frm_Caixa.Insere_Caixa('Compra', Temp2.Nc_ValorTotal, Temp2.Nc_Codigo);
          ShowMessage('Compra realizada.');
          frm_Compra.limpa_Carrinho;
          frm_SelecaoDeFornecedores.Close;
        end;

    end
    else if tipoCompra = 'Prazo' then
    begin
      Entrada := InputBox('Digite o valor de entrada','Digite a entrada', '0');
      ValorAPagar := FloatToStr(StrToFloat(ValorAPagar) - StrToFloat(Entrada));
      QtdParcelas := InputBox('Digite a quantidade de Parcelas.','Digite a quantidade de Parcelas.', '0');
      if QtdParcelas = '0' then
       begin
         ShowMessage('Quantidade n?o pode ser igual a 0.');
       end
    else if QtdParcelas > '6' then
       begin
         ShowMessage('M?ximo de 6 parcelas.');
       end
       else begin
            For I := 0 To StrToInt(QtdParcelas)-1 Do
            begin

                aux := '';
                Temp2.Nc_ProdutosComprados := '';

                Temp2.Nc_Codigo := StrToInt(Retorna_Proximo_Codigo_NotaCompra);
                Temp2.Nc_CodigoFornecedor := Temp.For_Codigo;

                for J := 1 to frm_Compra.GRID_Carrinho.RowCount-2 do
                begin

                   count := FloatToStr(StrToFloat(count) + StrToFloat(frm_Compra.GRID_Carrinho.Cells[2, J]));
                   aux := (
                            frm_Compra.GRID_Carrinho.Cells[0, J]+':'+frm_Compra.GRID_Carrinho.Cells[1, J]+':'+
                            frm_Compra.GRID_Carrinho.Cells[2, J]+':'+frm_Compra.GRID_Carrinho.Cells[4, J]+':'+
                            frm_Compra.GRID_Carrinho.Cells[5, J]+'\n'
                           );
                   Temp2.Nc_ProdutosComprados := Temp2.Nc_ProdutosComprados + aux;
                end;

                // Gera data
                Data := StrToDateTime(FormatDateTime('dd/mm/yyyy', Now));
                for J := 0 to I+1 do
                    Data := IncMonth(Data);
                Temp2.Nc_Data := DateToStr(Data);

                Temp2.Nc_Frete := frete;
                Temp2.Nc_Imposto := imposto;

                Temp2.Nc_ValorTotal := FloatToStr(StrToFloat(ValorAPagar)/StrToInt(QtdParcelas));
                Grava_Dados_NotaCompra(Temp2);

                frm_ContasPagar.Insere_ContaPagar(
                    Temp.For_Codigo,
                    'Parcela '+ IntToStr(I+1)+'/'+ QtdParcelas,
                    FloatToStr(StrToFloat(ValorAPagar)/StrToInt(QtdParcelas)),
                    Temp2.Nc_Codigo
                    );
            end;

            frete := FloatToStr(StrToFloat(frete)/StrToFloat(count));
            imposto := FloatToStr(StrToFloat(imposto)/StrToFloat(count));
            frm_Compra.AtualizaEstoque(frete, imposto);

            ShowMessage('Compra realizada.');
            frm_Compra.limpa_Carrinho;
            frm_SelecaoDeFornecedores.Close;
          end;
    end;


end;

procedure Tfrm_SelecaoDeFornecedores.btn_Fechar1Click(Sender: TObject);
begin
  frm_SelecaoDeFornecedores.Close;
end;

procedure Tfrm_SelecaoDeFornecedores.FormShow(Sender: TObject);
begin
   Pinta_Grid;
   Popula_Grid('');
   Calcula_Valor_Disponivel;
end;


end.
