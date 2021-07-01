unit Unit_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls;

type
  Tfrm_Produto = class(TForm)
    ControlePaginasProduto: TPageControl;
    Visualização: TTabSheet;
    Grid_Produtos: TStringGrid;
    cli_Panel1: TPanel;
    cli_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaProduto: TComboBox;
    cli_Pesquisa: TMaskEdit;
    CRUD_Produto: TTabSheet;
    PopupGridProdutos: TPopupMenu;
    PopupEditarProduto: TMenuItem;
    PopupExcluirProduto: TMenuItem;
    cli_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Gravar: TBitBtn;
    btn_Limpar: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Novo: TBitBtn;
    prod_Codigo: TLabeledEdit;
    prod_Descricao: TLabeledEdit;
    prod_Estoque: TLabeledEdit;
    prod_EstoqueMinimo: TLabeledEdit;
    prod_PrecoCusto: TLabeledEdit;
    prod_PrecoVenda: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Produto: Tfrm_Produto;

implementation

{$R *.dfm}

end.
