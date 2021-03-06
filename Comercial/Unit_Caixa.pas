unit Unit_Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Unit_Persistencia, System.DateUtils;

type
  Tfrm_Caixa = class(TForm)
    cai_panel: TPanel;
    GRID_Caixa: TStringGrid;
    cai_Label: TLabel;
    cai_Fechar: TBitBtn;
    cai_Lancamento: TBitBtn;
    cai_ValorTotal: TLabeledEdit;
    cai_ValorDisponivel: TLabeledEdit;
    btn_Debug: TBitBtn;
    procedure cai_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Pinta_Grid;
    Procedure Popula_Grid(Condicao : String);
    Procedure Calcula_Valor_Total;
    Procedure Calcula_Valor_Disponivel;
    procedure cai_LancamentoClick(Sender: TObject);
    procedure Insere_Caixa(Descricao: String; Valor: String; CodigoNota: Integer);
    procedure btn_DebugClick(Sender: TObject);
    procedure GRID_CaixaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GRID_CaixaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Caixa: Tfrm_Caixa;
  Linha : Integer;

implementation

{$R *.dfm}

uses Unit_DM, Unit_NotaVenda, Unit_NotaCompra;

procedure Tfrm_Caixa.btn_DebugClick(Sender: TObject);
begin
With DM.qryNotaVenda Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Delete From NotaVenda');
       ExecSQL;
       Unit_Persistencia.Commit;
     End;
With DM.qryCaixa Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Delete From Caixa');
       ExecSQL;
       Unit_Persistencia.Commit;
     End;

Popula_Grid('');
end;

procedure Tfrm_Caixa.cai_FecharClick(Sender: TObject);
begin
  frm_Caixa.Close;
end;

Procedure Tfrm_Caixa.Pinta_Grid;
begin
  GRID_Caixa.Cells[0,0] := 'C?d.';
  GRID_Caixa.Cells[1,0] := 'Descricao';
  GRID_Caixa.Cells[2,0] := 'Valor';
  GRID_Caixa.Cells[3,0] := 'Data';
  GRID_Caixa.Cells[4,0] := 'Nota';
  GRID_Caixa.ColWidths[0] := 50;
  GRID_Caixa.ColWidths[1] := 200;
  GRID_Caixa.ColWidths[2] := 75;
  GRID_Caixa.ColWidths[3] := 125;
  GRID_Caixa.ColWidths[4] := 100;
end;

Procedure Tfrm_Caixa.Popula_Grid(Condicao : String);
Var
  Transacoes_Atuais : Transacoes_Realizadas;
  I : Integer;
  aux : String;
Begin
  SetLength(Transacoes_Atuais,0);
  GRID_Caixa.RowCount := 2;
  GRID_Caixa.Cells[0,1] := '';
  GRID_Caixa.Cells[1,1] := '';
  GRID_Caixa.Cells[2,1] := '';
  GRID_Caixa.Cells[3,1] := '';
  GRID_Caixa.Cells[4,1] := '';

  Transacoes_Atuais := Retorna_Transacoes_Realizadas(Condicao);

  For I := 0 To Length(Transacoes_Atuais)-1 Do
    Begin
      GRID_Caixa.RowCount := GRID_Caixa.RowCount + 1;
      GRID_Caixa.Cells[0,I+1] := IntToStr(Transacoes_Atuais[I].Cai_Codigo);
      GRID_Caixa.Cells[1,I+1] := Transacoes_Atuais[I].Cai_Descricao;
      GRID_Caixa.Cells[2,I+1] := Transacoes_Atuais[I].Cai_Valor;
      GRID_Caixa.Cells[3,I+1] := Transacoes_Atuais[I].Cai_Data;
      if IntToStr(Transacoes_Atuais[I].Cai_CodigoNota) = '-1' then
      begin
        aux := '-/-';
      end
      else begin
        aux := IntToStr(Transacoes_Atuais[I].Cai_CodigoNota);
      end;
      GRID_Caixa.Cells[4,I+1] := aux;
    End;
  GRID_Caixa.RowCount := GRID_Caixa.RowCount - 1;

End;

procedure Tfrm_Caixa.Insere_Caixa(Descricao: String; Valor: String; CodigoNota: Integer);
var Dados_Form : Dados_Transacao;
begin
  Dados_Form.Cai_Codigo := StrToInt(Retorna_Proximo_Codigo_Transacao);
  Dados_Form.Cai_Descricao := Descricao;
  Dados_Form.Cai_Valor := Valor;
  Dados_Form.Cai_Data := FormatDateTime('dd.mm.yyyy hh:MM:ss', Now);
  Dados_Form.Cai_CodigoNota := CodigoNota;
  Grava_Dados_Transacao(Dados_Form);
end;

procedure Tfrm_Caixa.cai_LancamentoClick(Sender: TObject);
var Valor     : String;
var Descricao : String;
begin
  Valor := InputBox('Digite o Valor', 'Digite o valor a ser lan?ado', '0');
  if Valor = '0'
  then begin
     ShowMessage('Quantidade deve ser maior ou inferior a 0.');
  end
  else if StrToFloat(cai_ValorDisponivel.text)+ StrToFloat(Valor) < 0 then
  begin
     ShowMessage('N?o h? dinheiro suficiente no caixa para realizar esta opera??o');
  end
  else begin
    Descricao := InputBox('Digite a Descri??o', 'Digite a Descri??o da Opera??o', '');
    Insere_Caixa(Descricao,Valor, -1);
    Popula_Grid('');
    cai_ValorDisponivel.Text := FloatToStr(StrToFloat(cai_ValorDisponivel.Text) + StrToFloat(Valor));
    cai_ValorTotal.Text := FloatToStr(StrToFloat(cai_ValorTotal.Text) + StrToFloat(Valor));
  end;

end;


Procedure Tfrm_Caixa.Calcula_Valor_Total;
var I : Integer;
var Total : String;
begin
   Total := '0';
   if GRID_Caixa.RowCount > 1 then
   begin
     for I := 1 to GRID_Caixa.RowCount-1 do
     begin
        Total := FloatToStr(StrToFloat(Total) + StrToFloat(GRID_Caixa.Cells[2,I]));
     end;
     cai_ValorTotal.Text := Total;
   end;
end;

Procedure Tfrm_Caixa.Calcula_Valor_Disponivel;
var I : Integer;
var Total : String;
var Data : String;
begin
   Total := '0';
   Data := FormatDateTime('dd.mm.yyyy', Today);
   Popula_Grid('Where Cai_Data Like '+ QuotedStr(Data+ '%'));
   if GRID_Caixa.RowCount > 1 then
   begin
     for I := 1 to GRID_Caixa.RowCount-1 do
     begin
        Total := FloatToStr(StrToFloat(Total) + StrToFloat(GRID_Caixa.Cells[2,I]));
     end;
     cai_ValorDisponivel.Text := Total;
   end;
end;

procedure Tfrm_Caixa.FormShow(Sender: TObject);
begin
   Pinta_Grid;
   Calcula_Valor_Disponivel;
   Popula_Grid('');
   Calcula_Valor_Total;
end;

procedure Tfrm_Caixa.GRID_CaixaDblClick(Sender: TObject);
begin
  if GRID_Caixa.Cells[1,Linha] = 'Venda' then
  begin
    Application.CreateForm(Tfrm_NotaVenda, frm_NotaVenda);
    frm_NotaVenda.pegaCodigoNota(GRID_Caixa.Cells[4,Linha]);
    frm_NotaVenda.ShowModal;
    frm_NotaVenda.Destroy;
  end
  else if GRID_Caixa.Cells[1,Linha] = 'Compra' then
  begin
    Application.CreateForm(Tfrm_NotaCompra, frm_NotaCompra);
    frm_NotaCompra.pegaCodigoNota(GRID_Caixa.Cells[4,Linha]);
    frm_NotaCompra.ShowModal;
    frm_NotaCompra.Destroy;
  end;


end;

procedure Tfrm_Caixa.GRID_CaixaSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Linha := ARow;
end;

end.
