unit Unit_DM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase
  ;


type
  TDM = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qryCliente: TIBQuery;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    qryAux: TIBQuery;
    qryCommit: TIBQuery;
    qrySupermercado: TIBQuery;
    IBTable2: TIBTable;
    DataSource2: TDataSource;
    qryProduto: TIBQuery;
    IBTable3: TIBTable;
    DataSource3: TDataSource;
    qryFornecedor: TIBQuery;
    IBTable4: TIBTable;
    DataSource4: TDataSource;
    qryCaixa: TIBQuery;
    IBTable5: TIBTable;
    DataSource5: TDataSource;
    qryContasReceber: TIBQuery;
    IBTable6: TIBTable;
    DataSource6: TDataSource;
    qryContasPagar: TIBQuery;
    IBTable7: TIBTable;
    DataSource7: TDataSource;
    qryNotaVenda: TIBQuery;
    IBTable8: TIBTable;
    DataSource8: TDataSource;
    qryNotaCompra: TIBQuery;
    IBTable9: TIBTable;
    DataSource9: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

uses Unit_Principal;

procedure TDM.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TSuperMercadoDEF, SuperMercadoDEF);
  SuperMercadoDEF.ShowModal;
  SuperMercadoDEF.Destroy;
end;



end.
