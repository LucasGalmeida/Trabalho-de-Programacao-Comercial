unit Unit_Grafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_Grafico = class(TForm)
    Bitbtn5: TBitBtn;
    Bitbtn4: TBitBtn;
    Bitbtn6: TBitBtn;
    panel_Graficos: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Bitbtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Grafico: Tfrm_Grafico;

implementation

{$R *.dfm}

uses Unit_ExibeGrafico;

procedure Tfrm_Grafico.Bitbtn5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ExibeGrafico, frm_ExibeGrafico);
  frm_ExibeGrafico.ShowModal;
  frm_ExibeGrafico.Destroy;
end;

end.
