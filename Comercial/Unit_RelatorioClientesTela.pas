unit Unit_RelatorioClientesTela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit_DM, Unit_Persistencia, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  IBX.IBTable, IBX.IBCustomDataSet, IBX.IBQuery, RLReport;

type
  Tfrm_RelatorioClientesTela = class(TForm)
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    Corpo: TRLBand;
    Rodape: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel7: TRLLabel;
    Cli_Codigo: TRLDBText;
    Cli_Nome: TRLDBText;
    Cli_Telefone: TRLDBText;
    Cli_Email: TRLDBText;
    Cli_Sexo: TRLDBText;
    Cli_Endereco: TRLDBText;
    Cli_EstadoCivil: TRLDBText;
    Cli_DataNascimento: TRLDBText;
    RLDraw1: TRLDraw;
    Label1: TLabel;
    Label2: TLabel;
    Cli_Cpf: TRLDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    //procedure SetaCondicao(cond : String);
    //procedure Popula_Relatorio();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelatorioClientesTela: Tfrm_RelatorioClientesTela;
  //Condicao : String;

implementation

{$R *.dfm}

//procedure Tfrm_RelatorioClientesTela.SetaCondicao(cond : String);
//begin
//  Condicao := cond;
//end;

//procedure Tfrm_RelatorioClientesTela.Popula_Relatorio();
//Var
  //Clientes_Atuais : Clientes_Cadastrados;
//begin
  //SetLength(Clientes_Atuais,0);
   //Clientes_Atuais := Retorna_Clientes_Cadastrados(Condicao);
   //DM.IBTable1.Open;
//end;

procedure Tfrm_RelatorioClientesTela.FormShow(Sender: TObject);
begin
   //Popula_Relatorio();
   DM.IBTable1.Open;
   Relatorio.previewModal;
end;

end.
