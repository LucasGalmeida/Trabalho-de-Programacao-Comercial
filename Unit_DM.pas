unit Unit_DM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase;

type
  TDM = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qryCliente: TIBQuery;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    qryAux: TIBQuery;
    qryCommit: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.