unit Unit_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls, System.StrUtils,
  Vcl.Grids, Vcl.ComCtrls, Vcl.Buttons,
  Unit_Persistencia, Unit_Utils,
  Vcl.Menus, Data.DB, Vcl.DBGrids, Vcl.DBCtrls;

type
  Tfrm_Clientes = class(TForm)
    ControlePaginasCliente: TPageControl;
    Visualiza��o: TTabSheet;
    CRUD_Cliente: TTabSheet;
    Grid_Clientes: TStringGrid;
    cli_Panel1: TPanel;
    cli_Codigo: TLabeledEdit;
    cli_Nome: TLabeledEdit;
    cli_Endereco: TLabeledEdit;
    cli_Email: TLabeledEdit;
    cli_Sexo: TRadioGroup;
    label_Telefone: TLabel;
    cli_Telefone: TMaskEdit;
    label_CPF: TLabel;
    cli_CPF: TMaskEdit;
    cli_EstadoCivil: TRadioGroup;
    label_DataNascimento: TLabel;
    cli_DataNascimento: TMaskEdit;
    cli_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Gravar: TBitBtn;
    btn_Limpar: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Novo: TBitBtn;
    cli_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    cli_Pesquisa: TEdit;
    btn_Fechar1: TBitBtn;
    ComboBox1: TComboBox;
    PopupGridClientes: TPopupMenu;
    PopupEditarCliente: TMenuItem;
    Function Validado : Boolean;
    procedure btn_FecharClick(Sender: TObject);
    Procedure Habilita_Tela(Habilitado:Boolean);
    procedure Habilita_Botoes(Quais: String);
    procedure Limpa_Componentes;
    Procedure Pinta_Grid;
    Procedure Popula_Grid(Condicao : String);
    procedure FormShow(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Clientes: Tfrm_Clientes;
  Alterando : Boolean;

implementation

{$R *.dfm}


Function Tfrm_Clientes.Validado : Boolean;
Var
  Temp_CPF : String;
begin
  Result := False;
  if Trim(cli_Nome.Text) = ''
    then Begin
           Application.MessageBox('O campo de Nome � obrigat�rio',
                                  'Informe o nome',
                                  MB_ICONERROR + MB_OK);
           cli_Nome.SetFocus;
           Exit;
         End;
  if Trim(cli_Endereco.Text) = ''
    then Begin
           Application.MessageBox('O campo de Endere�o � obrigat�rio',
                                  'Informe o endere�o',
                                  MB_ICONERROR + MB_OK);
           cli_Endereco.SetFocus;
           Exit;
         End;
  Temp_CPF := cli_CPF.Text;
  Temp_CPF := AnsiReplaceStr(Temp_CPF,'.','');
  Temp_CPF := AnsiReplaceStr(Temp_CPF,'-','');
  if Not(isCPF(Temp_CPF))
    then Begin
           Application.MessageBox('O CPF � inv�lido. Digite um CPF correto e tente novamente!',
                                  'Informe um CPF correto',
                                  MB_ICONERROR + MB_OK);
           cli_CPF.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',cli_Telefone.Text) <> 0
    then Begin
           Application.MessageBox('O telefone � inv�lido. Digite um telefone correto e tente novamente!',
                                  'Informe um telefone correto',
                                  MB_ICONERROR + MB_OK);
           cli_Telefone.SetFocus;
           Exit;
         End;
  if Trim(cli_Email.Text) = ''
    then Begin
           Application.MessageBox('O campo de Email � obrigat�rio',
                                  'Informe o email',
                                  MB_ICONERROR + MB_OK);
           cli_Email.SetFocus;
           Exit;
         End;
  if cli_Sexo.ItemIndex = -1
    then Begin
           Application.MessageBox('O campo de Sexo � obrigat�rio',
                                  'Selecione um sexo',
                                  MB_ICONERROR + MB_OK);
           cli_Sexo.SetFocus;
           Exit;
         End;
  if cli_EstadoCivil.ItemIndex = -1
    then Begin
           Application.MessageBox('O campo de Estado Civil � obrigat�rio',
                                  'Selecione um Estado Civil',
                                  MB_ICONERROR + MB_OK);
           cli_EstadoCivil.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',cli_DataNascimento.Text) <> 0
    then Begin
           Application.MessageBox('A data de nascimento � inv�lida. Digite uma data v�lida e tente novamente!',
                                  'Informe uma data v�lida',
                                  MB_ICONERROR + MB_OK);
           cli_Telefone.SetFocus;
           Exit;
         End;

  Result := True;
end;

Procedure Tfrm_Clientes.Habilita_Botoes(Quais:String);
Begin
    if Quais[1] = '0'
      then btn_Novo.Enabled := False
      Else btn_Novo.Enabled := True;
    if Quais[2] = '0'
      then btn_Limpar.Enabled := False
      Else btn_Limpar.Enabled := True;
    if Quais[3] = '0'
      then btn_Cancelar.Enabled := False
      Else btn_Cancelar.Enabled := True;
    if Quais[4] = '0'
      then btn_Gravar.Enabled := False
      Else btn_Gravar.Enabled := True;
    if Quais[5] = '0'
      then btn_Fechar.Enabled := False
      Else btn_Fechar.Enabled := True;
End;

Procedure Tfrm_Clientes.Habilita_Tela(Habilitado:Boolean);
  Begin
    cli_Codigo.Enabled := Habilitado;
    cli_Nome.Enabled := Habilitado;
    cli_Endereco.Enabled := Habilitado;
    cli_CPF.Enabled := Habilitado;
    label_CPF.Enabled := Habilitado;
    cli_Telefone.Enabled := Habilitado;
    label_Telefone.Enabled := Habilitado;
    cli_Email.Enabled := Habilitado;
    cli_Sexo.Enabled := Habilitado;
    cli_EstadoCivil.Enabled := Habilitado;
    label_DataNascimento.Enabled := Habilitado;
    cli_DataNascimento.Enabled := Habilitado;
  End;

Procedure Tfrm_Clientes.Limpa_Componentes;
  Begin
    cli_Codigo.Clear;
    cli_Nome.Clear;
    cli_Endereco.Clear;
    cli_CPF.Clear;
    cli_Telefone.Clear;
    cli_Email.Clear;
    cli_Sexo.ItemIndex := -1;
    cli_EstadoCivil.ItemIndex := -1;
    cli_DataNascimento.Clear;
  End;

procedure Tfrm_Clientes.btn_NovoClick(Sender: TObject);
begin
  Habilita_Tela(True);
  cli_Nome.SetFocus;
  Limpa_Componentes;
  cli_Codigo.Text := Retorna_Proximo_Codigo;
  Habilita_Botoes('01110');
  Alterando := False;
end;

procedure Tfrm_Clientes.btn_CancelarClick(Sender: TObject);
begin
  Habilita_Tela(False);
  Limpa_Componentes;
  Habilita_Botoes('10001');
end;

procedure Tfrm_Clientes.btn_LimparClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente limpar todos os campos? Tem certeza?',
                            'Limpar todos os campos?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then Limpa_Componentes;
end;

procedure Tfrm_Clientes.btn_FecharClick(Sender: TObject);
begin
  frm_Clientes.Close;
end;

procedure Tfrm_Clientes.btn_GravarClick(Sender: TObject);
Var
  Temp : Dados_Cliente;
begin
  if Validado
  then Begin
         ShowMessage('Chegou');
         if cli_Codigo.Text <> ''
           then Temp.Cli_Codigo := StrToInt(cli_Codigo.Text);
         if cli_Nome.Text <> ''
           then Temp.Cli_Nome := cli_Nome.Text;
         if cli_Endereco.Text <> ''
           then Temp.Cli_Endereco := cli_Endereco.Text;
         if cli_CPF.Text <> ''
           then Temp.Cli_CPF := cli_CPF.Text;
         if cli_Telefone.Text <> ''
           then Temp.Cli_Telefone := cli_Telefone.Text;
         if cli_Email.Text <> ''
           then Temp.Cli_Email := cli_Email.Text;
         if cli_Sexo.ItemIndex <> -1
           then Temp.Cli_Sexo := cli_Sexo.ItemIndex;
         if cli_EstadoCivil.ItemIndex <> -1
           then Temp.Cli_EstadoCivil := cli_EstadoCivil.ItemIndex;
         if cli_DataNascimento.Text <> ''
           then Temp.Cli_DataNascimento := cli_DataNascimento.Text;
         Grava_Dados_Cliente(Temp, Alterando);
         Habilita_Tela(False);
         Habilita_Botoes('10001');
         Limpa_Componentes;
         Popula_Grid('');
         Alterando := False;
       End;
end;

Procedure Tfrm_Clientes.Pinta_Grid;
begin
  Grid_Clientes.Cells[0,0] := 'C�d.';
  Grid_Clientes.Cells[1,0] := 'Nome';
  Grid_Clientes.Cells[2,0] := 'Endere�o';
  Grid_Clientes.Cells[3,0] := 'CPF';
  Grid_Clientes.Cells[4,0] := 'Telefone';
  Grid_Clientes.Cells[5,0] := 'Email';
  Grid_Clientes.Cells[6,0] := 'Sexo';
  Grid_Clientes.Cells[7,0] := 'Estado Civil';
  Grid_Clientes.Cells[8,0] := 'Data de Nascimento';
  Grid_Clientes.ColWidths[0] := 60;
  Grid_Clientes.ColWidths[1] := 100;
  Grid_Clientes.ColWidths[2] := 100;
  Grid_Clientes.ColWidths[3] := 80;
  Grid_Clientes.ColWidths[4] := 80;
  Grid_Clientes.ColWidths[5] := 80;
  Grid_Clientes.ColWidths[6] := 100;
  Grid_Clientes.ColWidths[7] := 100;
  Grid_Clientes.ColWidths[8] := 130;
end;

Procedure Tfrm_Clientes.Popula_Grid(Condicao : String);
Var
  Clientes_Atuais : Clientes_Cadastrados;
  I : Integer;
Begin
  SetLength(Clientes_Atuais,0);
  Grid_Clientes.RowCount := 2;
  Grid_Clientes.Cells[0,1] := '';
  Grid_Clientes.Cells[1,1] := '';
  Grid_Clientes.Cells[2,1] := '';
  Grid_Clientes.Cells[3,1] := '';
  Grid_Clientes.Cells[4,1] := '';
  Grid_Clientes.Cells[5,1] := '';
  Grid_Clientes.Cells[6,1] := '';
  Grid_Clientes.Cells[7,1] := '';
  Grid_Clientes.Cells[8,1] := '';

  Clientes_Atuais := Retorna_Clientes_Cadastrados(Condicao);
  if Length(Clientes_Atuais) = 0
    then Begin
           PopupEditarCliente.Enabled := False;
           Exit;
         End;
  PopupEditarCliente.Enabled := True;
  For I := 0 To Length(Clientes_Atuais)-1 Do
    Begin
      Grid_Clientes.RowCount := Grid_Clientes.RowCount + 1;
      Grid_Clientes.Cells[0,I+1] := IntToStr(Clientes_Atuais[I].Cli_Codigo);
      Grid_Clientes.Cells[1,I+1] := Clientes_Atuais[I].Cli_Nome;
      Grid_Clientes.Cells[2,I+1] := Clientes_Atuais[I].Cli_Endereco;
      Grid_Clientes.Cells[3,I+1] := Clientes_Atuais[I].Cli_CPF;
      Grid_Clientes.Cells[4,I+1] := Clientes_Atuais[I].Cli_Telefone;
      Grid_Clientes.Cells[5,I+1] := Clientes_Atuais[I].Cli_Email;
      Case Clientes_Atuais[I].Cli_Sexo of
        0 : Grid_Clientes.Cells[6,I+1] := 'Masculino';
        1 : Grid_Clientes.Cells[6,I+1] := 'Feminino';
        2 : Grid_Clientes.Cells[6,I+1] := 'Outro';
      end;
      Case Clientes_Atuais[I].Cli_EstadoCivil of
        0 : Grid_Clientes.Cells[7,I+1] := 'Solteiro(a)';
        1 : Grid_Clientes.Cells[7,I+1] := 'Casado(a)';
        2 : Grid_Clientes.Cells[7,I+1] := 'Divorciado(a)';
        3 : Grid_Clientes.Cells[7,I+1] := 'Vi�vo(a)';
      end;
      Grid_Clientes.Cells[8,I+1] := Clientes_Atuais[I].Cli_DataNascimento;

    End;
  Grid_Clientes.RowCount := Grid_Clientes.RowCount - 1;
End;

procedure Tfrm_Clientes.FormShow(Sender: TObject);
begin
  Pinta_Grid;
  Popula_Grid('');
end;

end.