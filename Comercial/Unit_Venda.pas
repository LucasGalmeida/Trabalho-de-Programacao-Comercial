unit Unit_Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Unit_SelecaoDeProdutos, Unit_SelecaoDeClientes, Unit_DM, Unit_Persistencia;

type
  Tfrm_Venda = class(TForm)
    panel_Venda: TPanel;
    panel_VendaBotoes: TPanel;
    btn_Fechar: TBitBtn;
    btn_add: TBitBtn;
    btn_Prazo: TBitBtn;
    btn_Vista: TBitBtn;
    GRID_Carrinho: TStringGrid;
    procedure btn_FecharClick(Sender: TObject);
    Procedure Pinta_Grid;
    Procedure DiminuiEstoque;
    procedure Limpa_Carrinho;
    procedure FormShow(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_VistaClick(Sender: TObject);
    procedure btn_PrazoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Venda: Tfrm_Venda;

implementation

{$R *.dfm}

uses Unit_Caixa, Unit_NotaVenda;

procedure Tfrm_Venda.btn_addClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SelecaoDeProdutos, frm_SelecaoDeProdutos);
  frm_SelecaoDeProdutos.ShowModal;
  frm_SelecaoDeProdutos.Destroy;
end;

procedure Tfrm_Venda.btn_FecharClick(Sender: TObject);
begin
  frm_Venda.Close;
end;

Procedure Tfrm_Venda.DiminuiEstoque;
var I : Integer;
var TotalDeLinhas : Integer;
var aux : String;
begin
  TotalDeLinhas := frm_Venda.GRID_Carrinho.RowCount - 2;
  For I := 1 To TotalDeLinhas Do
    Begin
      With DM.qryProduto Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Update Produto Set');
                 aux := IntToStr(StrToInt(frm_Venda.GRID_Carrinho.Cells[3,I]) - StrToInt(frm_Venda.GRID_Carrinho.Cells[2,I]));
                 SQL.Add('Prod_Estoque = '+ aux);
                 SQL.Add('Where Prod_Codigo = '+ frm_Venda.GRID_Carrinho.Cells[0,I]);
                 ExecSQL;
                 Unit_Persistencia.Commit;
               End;
    End;
end;

procedure Tfrm_Venda.Limpa_Carrinho;
begin
  frm_Venda.GRID_Carrinho.RowCount := 2;
  frm_Venda.GRID_Carrinho.Cells[0,1] := '';
  frm_Venda.GRID_Carrinho.Cells[1,1] := '';
  frm_Venda.GRID_Carrinho.Cells[2,1] := '';
  frm_Venda.GRID_Carrinho.Cells[3,1] := '';
  frm_Venda.GRID_Carrinho.Cells[4,1] := '';
  frm_Venda.GRID_Carrinho.Cells[5,1] := '';
end;

procedure Tfrm_Venda.btn_PrazoClick(Sender: TObject);
begin
   if GRID_Carrinho.RowCount = 2
   then begin
          showMessage('Insira pelo menos um produto para realiar a venda.');
        end
   else begin
     if Application.MessageBox('Confirmar venda a prazo?',
                            'Confirmar venda a prazo',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
     then begin
            Application.CreateForm(Tfrm_SelecaoDeClientes, frm_SelecaoDeClientes);
            frm_SelecaoDeClientes.ShowModal;
            frm_SelecaoDeClientes.Destroy;
          end;
   end;

end;

procedure Tfrm_Venda.btn_VistaClick(Sender: TObject);
var
Temp : Dados_NotaVenda;
I : Integer;
aux : String;
begin
   if GRID_Carrinho.RowCount = 2
   then begin
          showMessage('Insira pelo menos um produto para realiar a venda.');
        end
   else begin
         if Application.MessageBox('Confirmar venda a vista?',
                                  'Confirmar venda a vista',
                                  MB_ICONQUESTION + MB_YESNO) = mrYes
         then begin
              // Gera nota
              Temp.Nv_Codigo := StrToInt(Retorna_Proximo_Codigo_NotaVenda);
              Temp.Nv_CodigoCliente := -1;

              for I := 1 to frm_Venda.GRID_Carrinho.RowCount-2 do
              begin
                 aux := (
                          frm_Venda.GRID_Carrinho.Cells[0, I]+':'+frm_Venda.GRID_Carrinho.Cells[1, I]+':'+
                          frm_Venda.GRID_Carrinho.Cells[2, I]+':'+frm_Venda.GRID_Carrinho.Cells[4, I]+':'+
                          frm_Venda.GRID_Carrinho.Cells[5, I]+'\n'
                         );
                 Temp.Nv_ProdutosVendidos := Temp.Nv_ProdutosVendidos + aux;
              end;

              Temp.Nv_Data := FormatDateTime('dd/mm/yyyy', Now);
              Temp.Nv_ValorTotal := frm_Venda.GRID_Carrinho.Cells[5, frm_Venda.GRID_Carrinho.RowCount - 1];

              Grava_Dados_NotaVenda(Temp);

              frm_Caixa.Insere_Caixa('Venda', frm_Venda.GRID_Carrinho.Cells[5, frm_Venda.GRID_Carrinho.RowCount - 1], Temp.Nv_Codigo);
              DiminuiEstoque;
              ShowMessage('Venda realizada.');
              limpa_Carrinho;
              end;
   end
end;

Procedure Tfrm_Venda.Pinta_Grid;
begin
  GRID_Carrinho.Cells[0,0] := 'C?digo';
  GRID_Carrinho.Cells[1,0] := 'Produto';
  GRID_Carrinho.Cells[2,0] := 'Quantidade';
  GRID_Carrinho.Cells[3,0] := 'Quantidade dispon?vel';
  GRID_Carrinho.Cells[4,0] := 'Pre?o Unidade';
  GRID_Carrinho.Cells[5,0] := 'Pre?o Total';
  GRID_Carrinho.ColWidths[0] := 70;
  GRID_Carrinho.ColWidths[1] := 300;
  GRID_Carrinho.ColWidths[2] := 165;
  GRID_Carrinho.ColWidths[3] := 165;
  GRID_Carrinho.ColWidths[4] := 140;
  GRID_Carrinho.ColWidths[5] := 140;
end;

procedure Tfrm_Venda.FormShow(Sender: TObject);
begin
  Pinta_Grid;
end;

end.
