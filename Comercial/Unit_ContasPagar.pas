unit Unit_ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Unit_DM, Unit_Persistencia;

type
  Tfrm_ContasPagar = class(TForm)
    cp_Panel1: TPanel;
    cp_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaCliente: TComboBox;
    cp_Pesquisa: TMaskEdit;
    btn_debug: TBitBtn;
    GRID_ContasPagar: TStringGrid;
    btn_Pagar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Pinta_Grid;
    procedure Popula_Grid(Condicao : String);
    procedure btn_debugClick(Sender: TObject);
    procedure btn_Fechar1Click(Sender: TObject);
    procedure Insere_ContaPagar(CodigoFornecedor :Integer; Descricao: String; Valor: String; CodigoNota: Integer);
    procedure GRID_ContasPagarDblClick(Sender: TObject);
    procedure btn_PagarClick(Sender: TObject);
    procedure GRID_ContasPagarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ContasPagar: Tfrm_ContasPagar;
  Linha : Integer;

implementation

{$R *.dfm}

uses Unit_NotaCompra, Unit_Caixa;

Procedure Tfrm_ContasPagar.Pinta_Grid;
begin
  GRID_ContasPagar.Cells[0,0] := 'C?d.';
  GRID_ContasPagar.Cells[1,0] := 'C?d. Fornecedor';
  GRID_ContasPagar.Cells[2,0] := 'Descricao';
  GRID_ContasPagar.Cells[3,0] := 'Valor';
  GRID_ContasPagar.Cells[4,0] := 'Data';
  GRID_ContasPagar.Cells[5,0] := 'Nota';
  GRID_ContasPagar.ColWidths[0] := 50;
  GRID_ContasPagar.ColWidths[1] := 100;
  GRID_ContasPagar.ColWidths[2] := 200;
  GRID_ContasPagar.ColWidths[3] := 75;
  GRID_ContasPagar.ColWidths[4] := 125;
  GRID_ContasPagar.ColWidths[5] := 100;
end;

Procedure Tfrm_ContasPagar.Popula_Grid(Condicao : String);
Var
  Contas : Contas_Pagar;
  I : Integer;
  aux : String;
Begin
  SetLength(Contas,0);
  GRID_ContasPagar.RowCount := 2;
  GRID_ContasPagar.Cells[0,1] := '';
  GRID_ContasPagar.Cells[1,1] := '';
  GRID_ContasPagar.Cells[2,1] := '';
  GRID_ContasPagar.Cells[3,1] := '';
  GRID_ContasPagar.Cells[4,1] := '';
  GRID_ContasPagar.Cells[5,1] := '';

  Contas := Retorna_Contas_Pagar(Condicao);

  For I := 0 To Length(Contas)-1 Do
    Begin
      GRID_ContasPagar.RowCount := GRID_ContasPagar.RowCount + 1;
      GRID_ContasPagar.Cells[0,I+1] := IntToStr(Contas[I].Cp_Codigo);
      GRID_ContasPagar.Cells[1,I+1] := IntToStr(Contas[I].Cp_CodigoFornecedor);
      GRID_ContasPagar.Cells[2,I+1] := Contas[I].Cp_Descricao;
      GRID_ContasPagar.Cells[3,I+1] := Contas[I].Cp_Valor;
      GRID_ContasPagar.Cells[4,I+1] := Contas[I].Cp_Data;
      if IntToStr(Contas[I].Cp_CodigoNota) = '-1' then
      begin
        aux := '-/-';
      end
      else begin
        aux := IntToStr(Contas[I].Cp_CodigoNota);
      end;
      GRID_ContasPagar.Cells[5,I+1] := aux;
    End;
  GRID_ContasPagar.RowCount := GRID_ContasPagar.RowCount - 1;

End;

procedure Tfrm_ContasPagar.Insere_ContaPagar(CodigoFornecedor :Integer; Descricao: String; Valor: String; CodigoNota: Integer);
var Dados_Form : Dados_ContasPagar;
var I : Integer;
var parcela : String;
var Data : TDateTime;
begin
  Dados_Form.Cp_Codigo := StrToInt(Retorna_Proximo_Codigo_ContaPagar);
  Dados_Form.Cp_CodigoFornecedor := CodigoFornecedor;
  Dados_Form.Cp_Descricao := Descricao;
  Dados_Form.Cp_Valor := Valor;
  parcela := Descricao[9];
  Data := StrToDateTime(FormatDateTime('dd/mm/yyyy', Now));
  for I := 0 to StrToInt(parcela)-1 do
      Data := IncMonth(Data);
  Dados_Form.Cp_Data := DateToStr(Data);
  Dados_Form.Cp_CodigoNota := CodigoNota;
  Grava_Dados_ContaPagar(Dados_Form);
end;

procedure Tfrm_ContasPagar.btn_debugClick(Sender: TObject);
begin
With DM.qryContasPagar Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Delete From ContasPagar');
       ExecSQL;
       Unit_Persistencia.Commit;
     End;
Popula_Grid('');
end;

procedure Tfrm_ContasPagar.btn_Fechar1Click(Sender: TObject);
begin
  frm_ContasPagar.Close;
end;

procedure GRID_ContasPagarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
begin
  Linha := Arow;
end;

procedure Tfrm_ContasPagar.GRID_ContasPagarDblClick(Sender: TObject);
begin

  Application.CreateForm(Tfrm_NotaCompra, frm_NotaCompra);
  frm_NotaCompra.pegaCodigoNota(GRID_ContasPagar.Cells[5,Linha]);
  frm_NotaCompra.ShowModal;
  frm_NotaCompra.Destroy;

end;

procedure Tfrm_ContasPagar.GRID_ContasPagarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Linha := ARow;
end;

procedure Tfrm_ContasPagar.btn_PagarClick(Sender: TObject);
var
codigo : String;
indice: Integer;
I: Integer;

begin
  codigo := InputBox('Digite o c?digo da conta a ser paga.','Digite o c?digo da conta a ser paga.', '0');

  try
    indice := 0;
    for I := 0 to GRID_ContasPagar.RowCount - 1 do
    begin
      if GRID_ContasPagar.Cells[0,I] = codigo then
      begin
        indice := I;
      end;
    end;
    frm_Caixa.Insere_Caixa('Compra', GRID_ContasPagar.Cells[3, indice], StrToInt(GRID_ContasPagar.Cells[5, indice]));
    With DM.qryContasPagar Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Delete From ContasPagar');
         SQL.Add('Where Cp_Codigo =' + codigo);
         ExecSQL;
         Unit_Persistencia.Commit;
       End;
    Popula_Grid('');
    ShowMessage('Parcela Paga!');
  except
    ShowMessage('Codigo Invalido');
  end;

end;

procedure Tfrm_ContasPagar.FormShow(Sender: TObject);
begin
  Pinta_Grid;
  Popula_Grid('');
end;

end.
