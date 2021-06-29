unit Unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TSuperMercadoDEF = class(TForm)
    MenuPrincipal: TMainMenu;
    Clientes: TMenuItem;
    Cadastro: TMenuItem;
    Supermercado: TMenuItem;
    Fornecedores: TMenuItem;
    Produtos: TMenuItem;
    procedure ClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SuperMercadoDEF: TSuperMercadoDEF;

implementation

{$R *.dfm}

uses Unit_Clientes;


procedure TSuperMercadoDEF.ClientesClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Clientes, frm_Clientes);
  frm_Clientes.ShowModal;
  frm_Clientes.Destroy;
end;

end.
