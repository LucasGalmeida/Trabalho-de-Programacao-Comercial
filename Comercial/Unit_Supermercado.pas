unit Unit_Supermercado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, StrUtils, Unit_Persistencia, Unit_Utils;

type
  Tfrm_Supermercado = class(TForm)
    PanelSupermercado: TPanel;
    PanelSupermercadoInferior: TPanel;
    sup_NomeFantasia: TLabeledEdit;
    btn_Fechar: TBitBtn;
    sup_RazaoSocial: TLabeledEdit;
    sup_Endereco: TLabeledEdit;
    sup_Email: TLabeledEdit;
    sup_NomeResponsavel: TLabeledEdit;
    sup_Telefone: TMaskEdit;
    sup_TelefoneResponsavel: TMaskEdit;
    label_Telefone: TLabel;
    label_TelefoneResponsavel: TLabel;
    label_CNPJ: TLabel;
    sup_CNPJ: TMaskEdit;
    sup_Lucro: TLabeledEdit;
    btn_Limpar: TBitBtn;
    btn_Salvar: TBitBtn;
    sup_InscricaoEstadual: TMaskEdit;
    label_InscricaoEstadual: TLabel;
    procedure btn_FecharClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    function ValidaDadosSupermercado: boolean;
    procedure btn_SalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Supermercado: Tfrm_Supermercado;

implementation

{$R *.dfm}

uses Unit_Principal;

procedure Tfrm_Supermercado.btn_FecharClick(Sender: TObject);
begin
  frm_Supermercado.Close;
end;

procedure Tfrm_Supermercado.btn_LimparClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente limpar todos os campos? Tem certeza?',
                            'Limpar todos os campos?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then begin
      sup_NomeFantasia.Text := '';
      sup_RazaoSocial.Text := '';
      sup_InscricaoEstadual.Text := '';
      sup_CNPJ.Text := '';
      sup_Endereco.Text := '';
      sup_Lucro.Text := '';
      sup_Telefone.Text := '';
      sup_Email.Text := '';
      sup_NomeResponsavel.Text := '';
      sup_TelefoneResponsavel.Text := '';
    end;
end;

Function Tfrm_Supermercado.ValidaDadosSupermercado : Boolean;
Var
  Temp_CNPJ : String;
begin
  Result := False;
  if Trim(sup_NomeFantasia.Text) = ''
    then Begin
           Application.MessageBox('O campo de Nome Fantasia ? obrigat?rio',
                                  'Informe o nome fantasia',
                                  MB_ICONERROR + MB_OK);
           sup_NomeFantasia.SetFocus;
           Exit;
         End;
  if Trim(sup_RazaoSocial.Text) = ''
    then Begin
           Application.MessageBox('O campo de Raz?o Social ? obrigat?rio',
                                  'Informe a Raz?o Social',
                                  MB_ICONERROR + MB_OK);
           sup_RazaoSocial.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',sup_InscricaoEstadual.Text) <> 0
    then Begin
           Application.MessageBox('O campo de Inscri??o Estadual ? obrigat?rio',
                                  'Informe a Inscri??o Estadual',
                                  MB_ICONERROR + MB_OK);
           sup_InscricaoEstadual.SetFocus;
           Exit;
         End;

  Temp_CNPJ := sup_CNPJ.Text;
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'.','');
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'-','');
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'/','');
  if Not(isCNPJ(Temp_CNPJ))
    then Begin
           Application.MessageBox('O CNPJ ? inv?lido. Digite um CNPJ v?lido e tente novamente!',
                                  'Informe um CNPJ v?lido',
                                  MB_ICONERROR + MB_OK);
           sup_CNPJ.SetFocus;
           Exit;
         End;
  if Trim(sup_Endereco.Text) = ''
    then Begin
           Application.MessageBox('O campo de Endere?o ? obrigat?rio',
                                  'Informe o Endere?o',
                                  MB_ICONERROR + MB_OK);
           sup_Endereco.SetFocus;
           Exit;
         End;
  if Trim(sup_Lucro.Text) = ''
    then Begin
           Application.MessageBox('O campo de Lucro ? obrigat?rio',
                                  'Informe o Lucro',
                                  MB_ICONERROR + MB_OK);
           sup_Lucro.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',sup_Telefone.Text) <> 0
    then Begin
           Application.MessageBox('O telefone ? inv?lido. Digite um telefone correto e tente novamente!',
                                  'Informe um telefone correto',
                                  MB_ICONERROR + MB_OK);
           sup_Telefone.SetFocus;
           Exit;
         End;
  if Trim(sup_Email.Text) = ''
    then Begin
           Application.MessageBox('O campo de Email ? obrigat?rio',
                                  'Informe o email',
                                  MB_ICONERROR + MB_OK);
           sup_Email.SetFocus;
           Exit;
         End;
   if Trim(sup_NomeResponsavel.Text) = ''
    then Begin
           Application.MessageBox('O campo de Nome do Respons?vel ? obrigat?rio',
                                  'Informe o nome do respons?vel',
                                  MB_ICONERROR + MB_OK);
           sup_NomeResponsavel.SetFocus;
           Exit;
         End;
   if AnsiPos(' ',sup_TelefoneResponsavel.Text) <> 0
    then Begin
           Application.MessageBox('O telefone do respons?vel ? inv?lido. Digite um telefone correto e tente novamente!',
                                  'Informe o telefone do respons?vel corretamente',
                                  MB_ICONERROR + MB_OK);
           sup_TelefoneResponsavel.SetFocus;
           Exit;
         End;

  Result := True;
end;

procedure Tfrm_Supermercado.btn_SalvarClick(Sender: TObject);
Var
  Temp : Dados_Supermercado;
begin
  if ValidaDadosSupermercado
  then Begin
         if sup_NomeFantasia.Text <> ''
           then Temp.Sup_NomeFantasia := sup_NomeFantasia.Text;
         if sup_RazaoSocial.Text <> ''
           then Temp.Sup_RazaoSocial := sup_RazaoSocial.Text;
         if sup_InscricaoEstadual.Text <> ''
           then Temp.Sup_InscricaoEstadual := sup_InscricaoEstadual.Text;
         if sup_CNPJ.Text <> ''
           then Temp.Sup_CNPJ := sup_CNPJ.Text;
         if sup_Endereco.Text <> ''
           then Temp.Sup_Endereco := sup_Endereco.Text;
         if sup_Lucro.Text <> ''
           then Temp.Sup_Lucro := sup_Lucro.Text;
         if sup_Telefone.Text <> ''
           then Temp.Sup_Telefone := sup_Telefone.Text;
         if sup_Email.Text <> ''
           then Temp.Sup_Email := sup_Email.Text;
         if sup_NomeResponsavel.Text <> ''
           then Temp.Sup_NomeResponsavel := sup_NomeResponsavel.Text;
         if sup_TelefoneResponsavel.Text <> ''
           then Temp.Sup_TelefoneResponsavel := sup_TelefoneResponsavel.Text;
         Grava_Dados_Supermercado(Temp);

         SupermercadoDEF.label_NomeFantasia.Caption := Temp.Sup_NomeFantasia;
         SupermercadoDEF.label_RazaoSocial.Caption := Temp.Sup_RazaoSocial;
         SupermercadoDEF.label_InscricaoEstadual.Caption := Temp.sup_InscricaoEstadual;
         SupermercadoDEF.label_CNPJ.Caption := Temp.sup_CNPJ;
         SupermercadoDEF.label_Endereco.Caption := Temp.sup_Endereco;
         SupermercadoDEF.label_Lucro.Caption := Temp.sup_Lucro;
         SupermercadoDEF.label_Telefone.Caption := Temp.sup_Telefone;
         SupermercadoDEF.label_Email.Caption := Temp.sup_Email;
         SupermercadoDEF.label_NomeResponsavel.Caption := Temp.sup_NomeResponsavel;
         SupermercadoDEF.label_TelefoneResponsavel.Caption := Temp.Sup_TelefoneResponsavel;

         ShowMessage('Salvo com sucesso!');

       End;
end;

procedure Tfrm_Supermercado.FormCreate(Sender: TObject);
var Temp : Dados_Supermercado;
begin
  Temp := Recupera_Dados_Supermercado;
  sup_NomeFantasia.Text := Temp.Sup_NomeFantasia;
  sup_RazaoSocial.Text := Temp.Sup_RazaoSocial;
  sup_InscricaoEstadual.Text := Temp.sup_InscricaoEstadual;
  sup_CNPJ.Text := Temp.sup_CNPJ;
  sup_Endereco.Text := Temp.sup_Endereco;
  sup_Lucro.Text := Temp.sup_Lucro;
  sup_Telefone.Text := Temp.sup_Telefone;
  sup_Email.Text := Temp.sup_Email;
  sup_NomeResponsavel.Text := Temp.sup_NomeResponsavel;
  sup_TelefoneResponsavel.Text := Temp.Sup_TelefoneResponsavel;
end;

end.
