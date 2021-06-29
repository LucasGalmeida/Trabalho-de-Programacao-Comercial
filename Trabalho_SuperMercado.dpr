program Trabalho_SuperMercado;

uses
  Vcl.Forms,
  Unit_Principal in 'Unit_Principal.pas' {SuperMercadoDEF},
  Unit_Clientes in 'Unit_Clientes.pas' {frm_Clientes},
  Unit_DM in 'Unit_DM.pas' {DM},
  Unit_Persistencia in 'Unit_Persistencia.pas',
  Unit_Utils in 'Unit_Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSuperMercadoDEF, SuperMercadoDEF);
  Application.CreateForm(Tfrm_Clientes, frm_Clientes);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
