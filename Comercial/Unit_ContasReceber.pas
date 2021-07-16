unit Unit_ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Unit_Persistencia;

type
  Tfrm_ContasReceber = class(TForm)
    cr_Panel1: TPanel;
    cr_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaCliente: TComboBox;
    cr_Pesquisa: TMaskEdit;
    GRID_ContasReceber: TStringGrid;
    btn_debug: TBitBtn;
    btn_Receber: TBitBtn;
    procedure FormShow(Sender: TObject);
    Procedure Pinta_Grid;
    Procedure Popula_Grid(Condicao : String);
    procedure Insere_ContaReceber(CodigoCliente :Integer; Descricao: String; Valor: String; CodigoNota: Integer);
    procedure btn_Fechar1Click(Sender: TObject);
    procedure btn_debugClick(Sender: TObject);
    procedure GRID_ContasReceberSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GRID_ContasReceberDblClick(Sender: TObject);
    procedure btn_ReceberClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ContasReceber: Tfrm_ContasReceber;
  Linha : Integer;

implementation

{$R *.dfm}

uses Unit_DM, Unit_NotaVenda, Unit_Caixa;

Procedure Tfrm_ContasReceber.Pinta_Grid;
begin
  GRID_ContasReceber.Cells[0,0] := 'Cód.';
  GRID_ContasReceber.Cells[1,0] := 'Cód. Cliente';
  GRID_ContasReceber.Cells[2,0] := 'Descricao';
  GRID_ContasReceber.Cells[3,0] := 'Valor';
  GRID_ContasReceber.Cells[4,0] := 'Data';
  GRID_ContasReceber.Cells[5,0] := 'Nota';
  GRID_ContasReceber.ColWidths[0] := 50;
  GRID_ContasReceber.ColWidths[1] := 100;
  GRID_ContasReceber.ColWidths[2] := 200;
  GRID_ContasReceber.ColWidths[3] := 75;
  GRID_ContasReceber.ColWidths[4] := 125;
  GRID_ContasReceber.ColWidths[5] := 100;
end;

Procedure Tfrm_ContasReceber.Popula_Grid(Condicao : String);
Var
  Contas : Contas_Receber;
  I : Integer;
  aux : String;
Begin
  SetLength(Contas,0);
  GRID_ContasReceber.RowCount := 2;
  GRID_ContasReceber.Cells[0,1] := '';
  GRID_ContasReceber.Cells[1,1] := '';
  GRID_ContasReceber.Cells[2,1] := '';
  GRID_ContasReceber.Cells[3,1] := '';
  GRID_ContasReceber.Cells[4,1] := '';
  GRID_ContasReceber.Cells[5,1] := '';

  Contas := Retorna_Contas_Receber(Condicao);

  For I := 0 To Length(Contas)-1 Do
    Begin
      GRID_ContasReceber.RowCount := GRID_ContasReceber.RowCount + 1;
      GRID_ContasReceber.Cells[0,I+1] := IntToStr(Contas[I].Cr_Codigo);
      GRID_ContasReceber.Cells[1,I+1] := IntToStr(Contas[I].Cr_CodigoCliente);
      GRID_ContasReceber.Cells[2,I+1] := Contas[I].Cr_Descricao;
      GRID_ContasReceber.Cells[3,I+1] := Contas[I].Cr_Valor;
      GRID_ContasReceber.Cells[4,I+1] := Contas[I].Cr_Data;
      if IntToStr(Contas[I].Cr_CodigoNota) = '-1' then
      begin
        aux := '-/-';
      end
      else begin
        aux := IntToStr(Contas[I].Cr_CodigoNota);
      end;
      GRID_ContasReceber.Cells[5,I+1] := aux;
    End;
  GRID_ContasReceber.RowCount := GRID_ContasReceber.RowCount - 1;

End;

procedure Tfrm_ContasReceber.Insere_ContaReceber(CodigoCliente :Integer; Descricao: String; Valor: String; CodigoNota: Integer);
var
Dados_Form : Dados_ContasReceber;
I : Integer;
parcela : String;
Data : TDateTime;

begin
  Dados_Form.Cr_Codigo := StrToInt(Retorna_Proximo_Codigo_ContaReceber);
  Dados_Form.Cr_CodigoCliente := CodigoCliente;
  Dados_Form.Cr_Descricao := Descricao;
  Dados_Form.Cr_Valor := Valor;
  parcela := Descricao[9];
  Data := StrToDateTime(FormatDateTime('dd/mm/yyyy', Now));
  for I := 0 to StrToInt(parcela)-1 do
      Data := IncMonth(Data);
  Dados_Form.Cr_Data := DateToStr(Data);
  Dados_Form.Cr_CodigoNota := CodigoNota;
  Grava_Dados_ContaReceber(Dados_Form);
end;



procedure Tfrm_ContasReceber.btn_debugClick(Sender: TObject);
begin
With DM.qryContasReceber Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Delete From ContasReceber');
       ExecSQL;
       Unit_Persistencia.Commit;
     End;
Popula_Grid('');
end;

procedure Tfrm_ContasReceber.btn_Fechar1Click(Sender: TObject);
begin
  frm_ContasReceber.Close;
end;

procedure Tfrm_ContasReceber.btn_ReceberClick(Sender: TObject);
var
codigo : String;
indice: Integer;
I: Integer;

begin
  codigo := InputBox('Digite o código da conta a ser recebida.','Digite o código da conta a ser recebida.', '0');

  try
    indice := 0;
    for I := 0 to GRID_ContasReceber.RowCount - 1 do
    begin
      if GRID_ContasReceber.Cells[0,I] = codigo then
      begin
        indice := I;
      end;
    end;
    frm_Caixa.Insere_Caixa('Venda', GRID_ContasReceber.Cells[3, indice], StrToInt(GRID_ContasReceber.Cells[5, indice]));
    With DM.qryContasReceber Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Delete From ContasReceber');
         SQL.Add('Where Cr_Codigo =' + codigo);
         ExecSQL;
         Unit_Persistencia.Commit;
       End;
    Popula_Grid('');
    ShowMessage('Parcela Paga!');
  except
    ShowMessage('Codigo Invalido');
  end;

end;

procedure Tfrm_ContasReceber.FormShow(Sender: TObject);
begin
   Pinta_Grid;
   Popula_Grid('');
end;

procedure Tfrm_ContasReceber.GRID_ContasReceberDblClick(Sender: TObject);
begin

  Application.CreateForm(Tfrm_NotaVenda, frm_NotaVenda);
  frm_NotaVenda.pegaCodigoNota(GRID_ContasReceber.Cells[5,Linha]);
  frm_NotaVenda.ShowModal;
  frm_NotaVenda.Destroy;

end;

procedure Tfrm_ContasReceber.GRID_ContasReceberSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Linha := Arow;
end;

end.
