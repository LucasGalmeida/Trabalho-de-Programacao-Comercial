unit Unit_Compra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  Tfrm_Compra = class(TForm)
    panel_Compra: TPanel;
    panel_CompraBotoes: TPanel;
    btn_Fechar: TBitBtn;
    btn_add: TBitBtn;
    btn_Prazo: TBitBtn;
    btn_Vista: TBitBtn;
    GRID_Carrinho: TStringGrid;
    procedure btn_addClick(Sender: TObject);
    procedure Limpa_Carrinho;
    procedure btn_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pinta_Grid;
    procedure btn_VistaClick(Sender: TObject);
    procedure btn_PrazoClick(Sender: TObject);
    procedure AtualizaEstoque(frete, imposto : String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Compra: Tfrm_Compra;

implementation

{$R *.dfm}

uses Unit_SelecaoDeProdutosFornecedor, Unit_Caixa, Unit_Persistencia, Unit_DM,
  Unit_Principal, Unit_SelecaoDeFornecedores;

procedure Tfrm_Compra.btn_addClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SelecaoDeProdutosFornecedor, frm_SelecaoDeProdutosFornecedor);
  frm_SelecaoDeProdutosFornecedor.ShowModal;
  frm_SelecaoDeProdutosFornecedor.Destroy;
end;

procedure Tfrm_Compra.btn_FecharClick(Sender: TObject);
begin
  frm_Compra.Close;
end;

procedure Tfrm_Compra.Pinta_Grid;
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

procedure Tfrm_Compra.Limpa_Carrinho;
begin
  frm_Compra.GRID_Carrinho.RowCount := 2;
  frm_Compra.GRID_Carrinho.Cells[0,1] := '';
  frm_Compra.GRID_Carrinho.Cells[1,1] := '';
  frm_Compra.GRID_Carrinho.Cells[2,1] := '';
  frm_Compra.GRID_Carrinho.Cells[3,1] := '';
  frm_Compra.GRID_Carrinho.Cells[4,1] := '';
  frm_Compra.GRID_Carrinho.Cells[5,1] := '';
end;

procedure Tfrm_Compra.AtualizaEstoque(frete, imposto : String);
var
I : Integer;
Temp : Dados_Produto;
aux, aux2 : String;
begin
  aux := '';
  aux2 := '';
  for I := 1 to frm_Compra.GRID_Carrinho.RowCount-2 do
  begin
     Temp := Retorna_Dados_Produto(StrToInt(frm_Compra.GRID_Carrinho.Cells[0,I]));
     With DM.qryProduto Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Update Produto Set');

       aux := FloatToStr(
                          StrToFloat(Temp.Prod_PrecoCusto) +
                          StrToFloat(frete) +
                          StrToFloat(imposto)
                        );
       aux := FloatToStr(
                          StrToFloat(aux)
                          /
                          StrToFloat(SuperMercadoDEF.label_lucro.Caption)
                        );

       SQL.Add('Prod_PrecoVenda = ' + QuotedStr(aux) + ',');

       aux2 := IntToStr(Temp.Prod_Estoque + StrToInt(frm_Compra.GRID_Carrinho.Cells[2,I]));

       SQL.Add('Prod_Estoque = ' + QuotedStr(aux2));
       SQL.Add('Where Prod_Codigo = '+ QuotedStr(frm_Compra.GRID_Carrinho.Cells[0,I]));
       ShowMessage(SQL.Text);
       ExecSQL;
       Commit;
     End;
  end;
end;

procedure Tfrm_Compra.btn_PrazoClick(Sender: TObject);
begin
   if GRID_Carrinho.RowCount = 2
   then begin
          showMessage('Insira pelo menos um produto para realiar a compra.');
        end
   else begin
     if Application.MessageBox('Confirmar compra a prazo?',
                            'Confirmar compra a prazo',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
     then begin
            Application.CreateForm(Tfrm_SelecaoDeFornecedores, frm_SelecaoDeFornecedores);
            frm_SelecaoDeFornecedores.SetCompraPrazo;
            frm_SelecaoDeFornecedores.ShowModal;
            frm_SelecaoDeFornecedores.Destroy;
          end;
   end;

end;

procedure Tfrm_Compra.btn_VistaClick(Sender: TObject);
begin
   if GRID_Carrinho.RowCount = 2
   then begin
          showMessage('Insira pelo menos um produto para realiar a compra.');
        end
   else begin
         if Application.MessageBox('Confirmar Compra a vista?',
                                  'Confirmar compra a vista',
                                  MB_ICONQUESTION + MB_YESNO) = mrYes
         then begin

                Application.CreateForm(Tfrm_SelecaoDeFornecedores, frm_SelecaoDeFornecedores);
                frm_SelecaoDeFornecedores.SetCompraVista;
                frm_SelecaoDeFornecedores.ShowModal;
                frm_SelecaoDeFornecedores.Destroy;

               end;
   end
end;

procedure Tfrm_Compra.FormShow(Sender: TObject);
begin
    Pinta_Grid;
end;


end.



