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
    Visualização: TTabSheet;
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
    btn_Fechar1: TBitBtn;
    cbx_PesquisaCliente: TComboBox;
    PopupGridClientes: TPopupMenu;
    PopupEditarCliente: TMenuItem;
    cli_Pesquisa: TMaskEdit;
    PopupExcluirCliente: TMenuItem;
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
    procedure cbx_PesquisaClienteChange(Sender: TObject);
    procedure cli_PesquisaChange(Sender: TObject);
    procedure PopupEditarClienteClick(Sender: TObject);
    procedure Preenche_Componentes;
    procedure ControlePaginasClienteChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Grid_ClientesKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_ClientesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupExcluirClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Clientes: Tfrm_Clientes;
  Alterando : Boolean;
  Linha : Integer;

implementation

{$R *.dfm}


Function Tfrm_Clientes.Validado : Boolean;
Var
  Temp_CPF : String;
begin
  Result := False;
  if Trim(cli_Nome.Text) = ''
    then Begin
           Application.MessageBox('O campo de Nome é obrigatório',
                                  'Informe o nome',
                                  MB_ICONERROR + MB_OK);
           cli_Nome.SetFocus;
           Exit;
         End;
  if Trim(cli_Endereco.Text) = ''
    then Begin
           Application.MessageBox('O campo de Endereço é obrigatório',
                                  'Informe o endereço',
                                  MB_ICONERROR + MB_OK);
           cli_Endereco.SetFocus;
           Exit;
         End;
  Temp_CPF := cli_CPF.Text;
  Temp_CPF := AnsiReplaceStr(Temp_CPF,'.','');
  Temp_CPF := AnsiReplaceStr(Temp_CPF,'-','');
  if Not(isCPF(Temp_CPF))
    then Begin
           Application.MessageBox('O CPF é inválido. Digite um CPF correto e tente novamente!',
                                  'Informe um CPF correto',
                                  MB_ICONERROR + MB_OK);
           cli_CPF.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',cli_Telefone.Text) <> 0
    then Begin
           Application.MessageBox('O telefone é inválido. Digite um telefone correto e tente novamente!',
                                  'Informe um telefone correto',
                                  MB_ICONERROR + MB_OK);
           cli_Telefone.SetFocus;
           Exit;
         End;
  if Trim(cli_Email.Text) = ''
    then Begin
           Application.MessageBox('O campo de Email é obrigatório',
                                  'Informe o email',
                                  MB_ICONERROR + MB_OK);
           cli_Email.SetFocus;
           Exit;
         End;
  if cli_Sexo.ItemIndex = -1
    then Begin
           Application.MessageBox('O campo de Sexo é obrigatório',
                                  'Selecione um sexo',
                                  MB_ICONERROR + MB_OK);
           cli_Sexo.SetFocus;
           Exit;
         End;
  if cli_EstadoCivil.ItemIndex = -1
    then Begin
           Application.MessageBox('O campo de Estado Civil é obrigatório',
                                  'Selecione um Estado Civil',
                                  MB_ICONERROR + MB_OK);
           cli_EstadoCivil.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',cli_DataNascimento.Text) <> 0
    then Begin
           Application.MessageBox('A data de nascimento é inválida. Digite uma data válida e tente novamente!',
                                  'Informe uma data válida',
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
  Grid_Clientes.Cells[0,0] := 'Cód.';
  Grid_Clientes.Cells[1,0] := 'Nome';
  Grid_Clientes.Cells[2,0] := 'Endereço';
  Grid_Clientes.Cells[3,0] := 'CPF';
  Grid_Clientes.Cells[4,0] := 'Telefone';
  Grid_Clientes.Cells[5,0] := 'Email';
  Grid_Clientes.Cells[6,0] := 'Sexo';
  Grid_Clientes.Cells[7,0] := 'Estado Civil';
  Grid_Clientes.Cells[8,0] := 'Data de Nascimento';
  Grid_Clientes.ColWidths[0] := 50;
  Grid_Clientes.ColWidths[1] := 150;
  Grid_Clientes.ColWidths[2] := 150;
  Grid_Clientes.ColWidths[3] := 100;
  Grid_Clientes.ColWidths[4] := 100;
  Grid_Clientes.ColWidths[5] := 100;
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
        3 : Grid_Clientes.Cells[7,I+1] := 'Viúvo(a)';
      end;
      Grid_Clientes.Cells[8,I+1] := Clientes_Atuais[I].Cli_DataNascimento;

    End;
  Grid_Clientes.RowCount := Grid_Clientes.RowCount - 1;
End;

Procedure Tfrm_Clientes.Preenche_Componentes;
Var
  Temp : Dados_Cliente;
Begin
  if Grid_Clientes.Cells[0,Linha] = ''
    then Exit;

  Temp := Retorna_Dados_Cliente(StrToInt(Grid_Clientes.Cells[0,Linha]));
//  ShowMessage(IntToStr(Temp.Cli_Codigo) + Temp.Cli_Nome + Temp.Cli_Endereco + Temp.Cli_CPF + Temp.Cli_Telefone + Temp.Cli_Email + IntToStr(Temp.Cli_Sexo) + IntToStr(Temp.Cli_EstadoCivil) + Temp.Cli_DataNascimento);
  cli_Codigo.Text := IntToStr(Temp.Cli_Codigo);
  cli_Nome.Text := Temp.Cli_Nome;
  cli_Endereco.Text := Temp.Cli_Endereco;
  cli_CPF.Text := Temp.Cli_CPF;
  cli_Telefone.Text := Temp.Cli_Telefone;
  cli_Email.Text := Temp.Cli_Email;
  cli_Sexo.ItemIndex := Temp.Cli_Sexo;
  cli_EstadoCivil.ItemIndex := Temp.Cli_EstadoCivil;
  cli_DataNascimento.Text := Temp.Cli_DataNascimento;
End;

procedure Tfrm_Clientes.PopupEditarClienteClick(Sender: TObject);
begin
    Preenche_Componentes;
    if cli_Codigo.Text = ''
      then Exit;
    ControlePaginasCliente.ActivePageIndex := 1;
    Alterando := True;
    Habilita_Botoes('01110');
    Habilita_Tela(True);
end;

procedure Tfrm_Clientes.PopupExcluirClienteClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja realmente excluir o Cliente? Essa opção não pode ser desfeita.',
                            'Excluir cliente?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then begin
      Preenche_Componentes;
      if cli_Codigo.Text = ''
        then Exit;
      Remove_Cliente(StrToInt(Grid_Clientes.Cells[0,Linha]));
      Limpa_Componentes;
      Popula_Grid('');
    end;
end;

procedure Tfrm_Clientes.cbx_PesquisaClienteChange(Sender: TObject);
begin
  cli_Pesquisa.Enabled := True;
  cli_Pesquisa.Text := '';
  case cbx_PesquisaCliente.ItemIndex of
    0..2: cli_Pesquisa.EditMask := '';
    3 : cli_Pesquisa.EditMask := '999.999.999-99';
    4 : cli_Pesquisa.EditMask := '(99)99999-9999';
    5..7 : cli_Pesquisa.EditMask := '';
    8 : cli_Pesquisa.EditMask := '99/99/9999';
  end;
  cli_Pesquisa.SetFocus;
end;

procedure Tfrm_Clientes.cli_PesquisaChange(Sender: TObject);
begin
  if cli_Pesquisa.Text = ''
    then Begin
           Popula_Grid('');
           Exit;
         End;
  case cbx_PesquisaCliente.ItemIndex of
    0 : Popula_Grid('Where Cli_Codigo = '+cli_Pesquisa.Text) ;
    1 : Popula_Grid('Where Cli_Nome Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    2 : Popula_Grid('Where Cli_Endereco Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    3 : Popula_Grid('Where Cli_CPF Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    4 : Popula_Grid('Where Cli_Telefone Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    5 : Popula_Grid('Where Cli_Email Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
    6 : Popula_Grid('Where Cli_Sexo = '+cli_Pesquisa.Text) ;
    7 : Popula_Grid('Where Cli_EstadoCivil = '+cli_Pesquisa.Text) ;
    8 : Popula_Grid('Where Cli_DataNascimento Like '+QuotedStr(cli_Pesquisa.Text+'%')) ;
  end;
end;

procedure Tfrm_Clientes.ControlePaginasClienteChanging(Sender: TObject;
  var AllowChange: Boolean);
Var
 msg : string;

begin
  if Alterando
    then msg := 'alteração de um registro existente?'
    else msg := 'inclusão de um novo registro?';
  if btn_Gravar.Enabled
    then Begin
           AllowChange := False;
           if Application.MessageBox(PChar('Deseja realmente cancelar a '+msg),'Deseja cancelar?',MB_ICONQUESTION + MB_YESNO) = mrYes
            Then Begin
                   btn_Cancelar.Click;
                   AllowChange := True;
                 End;
         End;
end;

procedure Tfrm_Clientes.Grid_ClientesKeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(27)
  then btn_Fechar.Click;
end;

procedure Tfrm_Clientes.Grid_ClientesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

procedure Tfrm_Clientes.FormShow(Sender: TObject);
begin
  Pinta_Grid;
  Popula_Grid('');
end;



end.
