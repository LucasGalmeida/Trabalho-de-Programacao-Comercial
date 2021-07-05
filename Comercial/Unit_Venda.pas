unit Unit_Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Unit_SelecaoDeProdutos;

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

procedure Tfrm_Venda.btn_PrazoClick(Sender: TObject);
begin
    if Application.MessageBox('Comfirmar venda a prazo?',
                            'Confirmar venda a prazo',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
   then begin
        ShowMessage('realiza Venda a prazo');
        end;
end;

procedure Tfrm_Venda.btn_VistaClick(Sender: TObject);
begin
   if Application.MessageBox('Comfirmar venda a vista?',
                            'Confirmar venda a vista',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
   then begin
        ShowMessage('realiza Venda a vista');
        end;

end;

Procedure Tfrm_Venda.Pinta_Grid;
begin
  GRID_Carrinho.Cells[0,0] := 'Produto';
  GRID_Carrinho.Cells[1,0] := 'Quantidade';
  GRID_Carrinho.Cells[2,0] := 'Quantidade dispon�vel';
  GRID_Carrinho.Cells[3,0] := 'Pre�o Unidade';
  GRID_Carrinho.Cells[4,0] := 'Pre�o Total';
  GRID_Carrinho.ColWidths[0] := 300;
  GRID_Carrinho.ColWidths[1] := 175;
  GRID_Carrinho.ColWidths[2] := 175;
  GRID_Carrinho.ColWidths[3] := 150;
  GRID_Carrinho.ColWidths[4] := 150;
end;

procedure Tfrm_Venda.FormShow(Sender: TObject);
begin
  Pinta_Grid;
end;

end.
