unit Unit_SelecaoDeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Unit_Persistencia;

type
  Tfrm_SelecaoDeClientes = class(TForm)
    Grid_Clientes: TStringGrid;
    cli_Panel1: TPanel;
    cli_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaCliente: TComboBox;
    cli_Pesquisa: TMaskEdit;
    Procedure Popula_Grid(Condicao : String);
    Procedure Pinta_Grid;
    procedure cbx_PesquisaClienteChange(Sender: TObject);
    procedure cli_PesquisaChange(Sender: TObject);
    procedure btn_Fechar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Grid_ClientesDblClick(Sender: TObject);
    procedure Grid_ClientesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelecaoDeClientes: Tfrm_SelecaoDeClientes;
  Linha : Integer;

implementation

{$R *.dfm}

uses Unit_Venda, Unit_ContasReceber, Unit_SelecaoDeProdutos;

Procedure Tfrm_SelecaoDeClientes.Popula_Grid(Condicao : String);
Var
  Clientes_Atuais : Clientes_Cadastrados;
  I : Integer;
Begin
  SetLength(Clientes_Atuais,0);
  Grid_Clientes.RowCount := 2;
  Grid_Clientes.Cells[0,1] := '';
  Grid_Clientes.Cells[1,1] := '';
  Grid_Clientes.Cells[2,1] := '';
  Grid_Clientes.Cells[3,1] := '';
  Grid_Clientes.Cells[4,1] := '';
  Grid_Clientes.Cells[5,1] := '';
  Grid_Clientes.Cells[6,1] := '';
  Grid_Clientes.Cells[7,1] := '';
  Grid_Clientes.Cells[8,1] := '';

  Clientes_Atuais := Retorna_Clientes_Cadastrados(Condicao);
  For I := 0 To Length(Clientes_Atuais)-1 Do
    Begin
      Grid_Clientes.RowCount := Grid_Clientes.RowCount + 1;
      Grid_Clientes.Cells[0,I+1] := IntToStr(Clientes_Atuais[I].Cli_Codigo);
      Grid_Clientes.Cells[1,I+1] := Clientes_Atuais[I].Cli_Nome;
      Grid_Clientes.Cells[2,I+1] := Clientes_Atuais[I].Cli_Endereco;
      Grid_Clientes.Cells[3,I+1] := Clientes_Atuais[I].Cli_CPF;
      Grid_Clientes.Cells[4,I+1] := Clientes_Atuais[I].Cli_Telefone;
      Grid_Clientes.Cells[5,I+1] := Clientes_Atuais[I].Cli_Email;
      Case Clientes_Atuais[I].Cli_Sexo of
        0 : Grid_Clientes.Cells[6,I+1] := 'Masculino';
        1 : Grid_Clientes.Cells[6,I+1] := 'Feminino';
        2 : Grid_Clientes.Cells[6,I+1] := 'Outro';
      end;
      Case Clientes_Atuais[I].Cli_EstadoCivil of
        0 : Grid_Clientes.Cells[7,I+1] := 'Solteiro(a)';
        1 : Grid_Clientes.Cells[7,I+1] := 'Casado(a)';
        2 : Grid_Clientes.Cells[7,I+1] := 'Divorciado(a)';
        3 : Grid_Clientes.Cells[7,I+1] := 'Viúvo(a)';
      end;
      Grid_Clientes.Cells[8,I+1] := Clientes_Atuais[I].Cli_DataNascimento;

    End;
  Grid_Clientes.RowCount := Grid_Clientes.RowCount - 1;
End;

Procedure Tfrm_SelecaoDeClientes.Pinta_Grid;
begin
  Grid_Clientes.Cells[0,0] := 'Cód.';
  Grid_Clientes.Cells[1,0] := 'Nome';
  Grid_Clientes.Cells[2,0] := 'Endereço';
  Grid_Clientes.Cells[3,0] := 'CPF';
  Grid_Clientes.Cells[4,0] := 'Telefone';
  Grid_Clientes.Cells[5,0] := 'Email';
  Grid_Clientes.Cells[6,0] := 'Sexo';
  Grid_Clientes.Cells[7,0] := 'Estado Civil';
  Grid_Clientes.Cells[8,0] := 'Data de Nascimento';
  Grid_Clientes.ColWidths[0] := 50;
  Grid_Clientes.ColWidths[1] := 150;
  Grid_Clientes.ColWidths[2] := 150;
  Grid_Clientes.ColWidths[3] := 100;
  Grid_Clientes.ColWidths[4] := 100;
  Grid_Clientes.ColWidths[5] := 100;
  Grid_Clientes.ColWidths[6] := 100;
  Grid_Clientes.ColWidths[7] := 100;
  Grid_Clientes.ColWidths[8] := 130;
end;

procedure Tfrm_SelecaoDeClientes.cbx_PesquisaClienteChange(Sender: TObject);
begin
  cli_Pesquisa.Enabled := True;
  cli_Pesquisa.Text := '';
  case cbx_PesquisaCliente.ItemIndex of
    0..2: cli_Pesquisa.EditMask := '';
    3 : cli_Pesquisa.EditMask := '999.999.999-99';
    4 : cli_Pesquisa.EditMask := '(99)99999-9999';
    5..7 : cli_Pesquisa.EditMask := '';
    8 : cli_Pesquisa.EditMask := '99/99/9999';
  end;
  cli_Pesquisa.SetFocus;
end;

procedure Tfrm_SelecaoDeClientes.cli_PesquisaChange(Sender: TObject);
begin
  if cli_Pesquisa.Text = ''
    then Begin
           Popula_Grid('');
           Exit;
         End;
  case cbx_PesquisaCliente.ItemIndex of
    0 : Popula_Grid('Where Cli_Codigo = '+cli_Pesquisa.Text) ;
    1 : Popula_Grid('Where Cli_Nome Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    2 : Popula_Grid('Where Cli_Endereco Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    3 : Popula_Grid('Where Cli_CPF Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    4 : Popula_Grid('Where Cli_Telefone Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    5 : Popula_Grid('Where Cli_Email Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    6 : Popula_Grid('Where Cli_Sexo = '+cli_Pesquisa.Text) ;
    7 : Popula_Grid('Where Cli_EstadoCivil = '+cli_Pesquisa.Text) ;
    8 : Popula_Grid('Where Cli_DataNascimento Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
  end;
end;

procedure Tfrm_SelecaoDeClientes.btn_Fechar1Click(Sender: TObject);
begin
  frm_SelecaoDeClientes.Close;
end;

procedure Tfrm_SelecaoDeClientes.FormShow(Sender: TObject);
begin
   Pinta_Grid;
   Popula_Grid('');
end;

Procedure Tfrm_SelecaoDeClientes.Grid_ClientesDblClick(Sender: TObject);
var
Temp : Dados_Cliente;
Entrada : String;
QtdParcelas : String;
ValorAPagar : String;
I, J : Integer;
Temp2 : Dados_NotaVenda;
aux : String;
Data : TDateTime;

begin
    Temp := Retorna_Dados_Cliente(StrToInt(Grid_Clientes.Cells[0,Linha]));
    Entrada := InputBox('Digite o valor de entrada','Digite a entrada', '0');
    ValorAPagar := frm_Venda.GRID_Carrinho.Cells[5, frm_Venda.GRID_Carrinho.RowCount - 1];
    ValorAPagar := FloatToStr(StrToFloat(ValorAPagar) - StrToFloat(Entrada));
    QtdParcelas := InputBox('Digite a quantidade de Parcelas.','Digite a quantidade de Parcelas.', '0');
    if QtdParcelas = '0' then
       begin
         ShowMessage('Quantidade não pode ser igual a 0.');
       end
    else if QtdParcelas > '6' then
       begin
         ShowMessage('Máximo de 6 parcelas.');
       end
    else begin
      For I := 0 To StrToInt(QtdParcelas)-1 Do
      begin

          aux := '';
          Temp2.Nv_ProdutosVendidos := '';

          // Gera nota
          Temp2.Nv_Codigo := StrToInt(Retorna_Proximo_Codigo_NotaVenda);
          Temp2.Nv_CodigoCliente := Temp.Cli_Codigo;

          for J := 1 to frm_Venda.GRID_Carrinho.RowCount-2 do
          begin
             aux := (
                      frm_Venda.GRID_Carrinho.Cells[0, J]+':'+frm_Venda.GRID_Carrinho.Cells[1, J]+':'+
                      frm_Venda.GRID_Carrinho.Cells[2, J]+':'+frm_Venda.GRID_Carrinho.Cells[4, J]+':'+
                      frm_Venda.GRID_Carrinho.Cells[5, J]+'\n'
                     );
             Temp2.Nv_ProdutosVendidos := Temp2.Nv_ProdutosVendidos + aux;
          end;

          // Gera data
          Data := StrToDateTime(FormatDateTime('dd/mm/yyyy', Now));
          for J := 0 to I+1 do
              Data := IncMonth(Data);
          Temp2.Nv_Data := DateToStr(Data);


          Temp2.Nv_ValorTotal := FloatToStr(StrToFloat(ValorAPagar)/StrToInt(QtdParcelas));
          Grava_Dados_NotaVenda(Temp2);

          frm_ContasReceber.Insere_ContaReceber(
              Temp.Cli_Codigo,
              'Parcela '+ IntToStr(I+1)+'/'+ QtdParcelas,
              FloatToStr(StrToFloat(ValorAPagar)/StrToInt(QtdParcelas)),
              Temp2.Nv_Codigo
              );
      end;
      frm_Venda.DiminuiEstoque;
      ShowMessage('Venda realizada.');
      frm_Venda.limpa_Carrinho;
      frm_SelecaoDeClientes.Close;
    end;

end;

procedure Tfrm_SelecaoDeClientes.Grid_ClientesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

end.
