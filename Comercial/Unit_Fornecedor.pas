unit Unit_Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, Unit_Persistencia, Unit_Utils, Vcl.Menus, StrUtils;

type
  Tfrm_Fornecedores = class(TForm)
    ControlePaginasFornecedor: TPageControl;
    Visualização: TTabSheet;
    Grid_Fornecedores: TStringGrid;
    for_Panel1: TPanel;
    for_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaFornecedor: TComboBox;
    for_Pesquisa: TMaskEdit;
    CRUD_Fornecedor: TTabSheet;
    cli_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Gravar: TBitBtn;
    btn_Limpar: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Novo: TBitBtn;
    label_CNPJ: TLabel;
    label_InscricaoEstadual: TLabel;
    label_Telefone: TLabel;
    for_CNPJ: TMaskEdit;
    for_Email: TLabeledEdit;
    for_Endereco: TLabeledEdit;
    for_InscricaoEstadual: TMaskEdit;
    for_NomeFantasia: TLabeledEdit;
    for_RazaoSocial: TLabeledEdit;
    for_Telefone: TMaskEdit;
    for_Codigo: TLabeledEdit;
    PopupGridFornecedores: TPopupMenu;
    PopupEditarFornecedor: TMenuItem;
    PopupExcluirFornecedor: TMenuItem;
    procedure btn_FecharClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    Procedure Limpa_Componentes;
    procedure btn_CancelarClick(Sender: TObject);
    Procedure Habilita_Tela(Habilitado:Boolean);
    Procedure Habilita_Botoes(Quais:String);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
    Procedure Popula_Grid(Condicao : String);
    Procedure Preenche_Componentes;
    procedure PopupExcluirFornecedorClick(Sender: TObject);
    procedure PopupEditarFornecedorClick(Sender: TObject);
    Function Validado : Boolean;
    procedure FormShow(Sender: TObject);
    Procedure Pinta_Grid;
    procedure for_PesquisaChange(Sender: TObject);
    procedure ControlePaginasFornecedorChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Grid_FornecedoresSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure Grid_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure cbx_PesquisaFornecedorChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Fornecedores: Tfrm_Fornecedores;
  Alterando : Boolean;
  Linha : Integer;

implementation

{$R *.dfm}

procedure Tfrm_Fornecedores.btn_FecharClick(Sender: TObject);
begin
  frm_Fornecedores.Close;
end;

Procedure Tfrm_Fornecedores.Limpa_Componentes;
  Begin
    for_NomeFantasia.Clear;
    for_RazaoSocial.Clear;
    for_InscricaoEstadual.Clear;
    for_CNPJ.Clear;
    for_Endereco.Clear;
    for_Telefone.Clear;
    for_Email.Clear;
  End;

procedure Tfrm_Fornecedores.btn_LimparClick(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente limpar todos os campos? Tem certeza?',
                            'Limpar todos os campos?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then Limpa_Componentes;
end;

Procedure Tfrm_Fornecedores.Habilita_Tela(Habilitado:Boolean);
  Begin
    for_NomeFantasia.Enabled := Habilitado;
    for_RazaoSocial.Enabled := Habilitado;
    for_InscricaoEstadual.Enabled := Habilitado;
    for_CNPJ.Enabled := Habilitado;
    for_Endereco.Enabled := Habilitado;
    for_Telefone.Enabled := Habilitado;
    for_Email.Enabled := Habilitado;
  End;

Procedure Tfrm_Fornecedores.Habilita_Botoes(Quais:String);
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

procedure Tfrm_Fornecedores.btn_CancelarClick(Sender: TObject);
begin
  Habilita_Tela(False);
  Limpa_Componentes;
  Habilita_Botoes('10001');
end;

procedure Tfrm_Fornecedores.btn_NovoClick(Sender: TObject);
begin
  Habilita_Tela(True);
  for_NomeFantasia.SetFocus;
  Limpa_Componentes;
  for_Codigo.Text := Retorna_Proximo_Codigo_Fornecedor;
  Habilita_Botoes('01110');
  Alterando := False;
end;

procedure Tfrm_Fornecedores.cbx_PesquisaFornecedorChange(Sender: TObject);
begin
  for_Pesquisa.Enabled := True;
  for_Pesquisa.Text := '';
end;

/// Falta controlar que apenas NUMEROS possam ser digitados nos campos de preco e estoque
Function Tfrm_Fornecedores.Validado : Boolean;
Var
  Temp_CNPJ : String;
begin
  Result := False;
  if Trim(for_NomeFantasia.Text) = ''
    then Begin
           Application.MessageBox('O campo de Nome Fantasia é obrigatório',
                                  'Informe o nome fantasia',
                                  MB_ICONERROR + MB_OK);
           for_NomeFantasia.SetFocus;
           Exit;
         End;
  if Trim(for_RazaoSocial.Text) = ''
    then Begin
           Application.MessageBox('O campo de Razão Social é obrigatório',
                                  'Informe a Razão Social',
                                  MB_ICONERROR + MB_OK);
           for_RazaoSocial.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',for_InscricaoEstadual.Text) <> 0
    then Begin
           Application.MessageBox('O campo de Inscrição Estadual é obrigatório',
                                  'Informe a Inscrição Estadual',
                                  MB_ICONERROR + MB_OK);
           for_InscricaoEstadual.SetFocus;
           Exit;
         End;

  Temp_CNPJ := for_CNPJ.Text;
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'.','');
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'-','');
  Temp_CNPJ := AnsiReplaceStr(Temp_CNPJ,'/','');
  if Not(isCNPJ(Temp_CNPJ))
    then Begin
           Application.MessageBox('O CNPJ é inválido. Digite um CNPJ válido e tente novamente!',
                                  'Informe um CNPJ válido',
                                  MB_ICONERROR + MB_OK);
           for_CNPJ.SetFocus;
           Exit;
         End;
  if Trim(for_Endereco.Text) = ''
    then Begin
           Application.MessageBox('O campo de Endereço é obrigatório',
                                  'Informe o Endereço',
                                  MB_ICONERROR + MB_OK);
           for_Endereco.SetFocus;
           Exit;
         End;
  if AnsiPos(' ',for_Telefone.Text) <> 0
    then Begin
           Application.MessageBox('O telefone é inválido. Digite um telefone correto e tente novamente!',
                                  'Informe um telefone correto',
                                  MB_ICONERROR + MB_OK);
           for_Telefone.SetFocus;
           Exit;
         End;
  if Trim(for_Email.Text) = ''
    then Begin
           Application.MessageBox('O campo de Email é obrigatório',
                                  'Informe o email',
                                  MB_ICONERROR + MB_OK);
           for_Email.SetFocus;
           Exit;
         End;
  Result := True;
end;

procedure Tfrm_Fornecedores.btn_GravarClick(Sender: TObject);
var
  Temp : Dados_Fornecedor;
begin
  if Validado
  then Begin
         if for_Codigo.Text <> ''
           then Temp.for_Codigo := StrToInt(for_Codigo.Text);
         if for_NomeFantasia.Text <> ''
           then Temp.for_NomeFantasia := for_NomeFantasia.Text;
         if for_RazaoSocial.Text <> ''
           then Temp.for_RazaoSocial := for_RazaoSocial.Text;
         if for_InscricaoEstadual.Text <> ''
           then Temp.for_InscricaoEstadual := for_InscricaoEstadual.Text;
         if for_CNPJ.Text <> ''
           then Temp.for_CNPJ := for_CNPJ.Text;
         if for_Endereco.Text <> ''
           then Temp.for_Endereco := for_Endereco.Text;
         if for_Telefone.Text <> ''
           then Temp.for_Telefone := for_Telefone.Text;
         if for_Email.Text <> ''
           then Temp.for_Email := for_Email.Text;
         Grava_Dados_Fornecedor(Temp, Alterando);
         Habilita_Tela(False);
         Habilita_Botoes('10001');
         Limpa_Componentes;
         Popula_Grid('');
         Alterando := False;
        End;

end;

Procedure Tfrm_Fornecedores.Preenche_Componentes;
Var
  Temp : Dados_Fornecedor;
Begin
  if Grid_Fornecedores.Cells[0,Linha] = ''
    then Exit;
  Temp := Retorna_Dados_Fornecedor(StrToInt(Grid_Fornecedores.Cells[0,Linha]));
  for_Codigo.Text := IntToStr(Temp.for_Codigo);
  for_NomeFantasia.Text := Temp.for_NomeFantasia;
  for_RazaoSocial.Text := Temp.for_RazaoSocial;
  for_InscricaoEstadual.Text := Temp.for_InscricaoEstadual;
  for_CNPJ.Text := Temp.for_CNPJ;
  for_Endereco.Text := Temp.for_Endereco;
  for_Telefone.Text := Temp.for_Telefone;
  for_Email.Text := Temp.for_Email;
End;



procedure Tfrm_Fornecedores.PopupEditarFornecedorClick(Sender: TObject);
begin
    Preenche_Componentes;
    if For_Codigo.Text = ''
      then Exit;
    ControlePaginasFornecedor.ActivePageIndex := 1;
    Alterando := True;
    Habilita_Botoes('01110');
    Habilita_Tela(True);
end;

procedure Tfrm_Fornecedores.PopupExcluirFornecedorClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja realmente excluir o Fornecedor? Essa opção não pode ser desfeita.',
                            'Excluir Fornecedor?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then begin
      Preenche_Componentes;
      if For_Codigo.Text = ''
        then Exit;
      Remove_Fornecedor(StrToInt(Grid_Fornecedores.Cells[0,Linha]));
      Limpa_Componentes;
      Popula_Grid('');
    end;
end;

Procedure Tfrm_Fornecedores.Pinta_Grid;
begin
  Grid_Fornecedores.Cells[0,0] := 'Cód.';
  Grid_Fornecedores.Cells[1,0] := 'Nome Fantasia';
  Grid_Fornecedores.Cells[2,0] := 'Razão Social';
  Grid_Fornecedores.Cells[3,0] := 'Inscrição Estadual';
  Grid_Fornecedores.Cells[4,0] := 'CNPJ';
  Grid_Fornecedores.Cells[5,0] := 'Endereço';
  Grid_Fornecedores.Cells[6,0] := 'Telefone';
  Grid_Fornecedores.Cells[7,0] := 'Email';
  Grid_Fornecedores.ColWidths[0] := 50;
  Grid_Fornecedores.ColWidths[1] := 150;
  Grid_Fornecedores.ColWidths[2] := 150;
  Grid_Fornecedores.ColWidths[3] := 150;
  Grid_Fornecedores.ColWidths[4] := 100;
  Grid_Fornecedores.ColWidths[5] := 100;
  Grid_Fornecedores.ColWidths[6] := 100;
  Grid_Fornecedores.ColWidths[7] := 100;
end;

Procedure Tfrm_Fornecedores.Popula_Grid(Condicao : String);
Var
  Fornecedores_Atuais : Fornecedores_Cadastrados;
  I : Integer;
Begin
  SetLength(Fornecedores_Atuais,0);
  Grid_Fornecedores.RowCount := 2;
  Grid_Fornecedores.Cells[0,1] := '';
  Grid_Fornecedores.Cells[1,1] := '';
  Grid_Fornecedores.Cells[2,1] := '';
  Grid_Fornecedores.Cells[3,1] := '';
  Grid_Fornecedores.Cells[4,1] := '';
  Grid_Fornecedores.Cells[5,1] := '';
  Grid_Fornecedores.Cells[6,1] := '';

  Fornecedores_Atuais := Retorna_Fornecedores_Cadastrados(Condicao);
  if Length(Fornecedores_Atuais) = 0
    then Begin
           PopupEditarFornecedor.Enabled := False;
           Exit;
         End;
  PopupEditarFornecedor.Enabled := True;
  For I := 0 To Length(Fornecedores_Atuais)-1 Do
    Begin
      Grid_Fornecedores.RowCount := Grid_Fornecedores.RowCount + 1;
      Grid_Fornecedores.Cells[0,I+1] := IntToStr(Fornecedores_Atuais[I].For_Codigo);
      Grid_Fornecedores.Cells[1,I+1] := Fornecedores_Atuais[I].For_NomeFantasia;
      Grid_Fornecedores.Cells[2,I+1] := Fornecedores_Atuais[I].For_RazaoSocial;
      Grid_Fornecedores.Cells[3,I+1] := Fornecedores_Atuais[I].For_InscricaoEstadual;
      Grid_Fornecedores.Cells[4,I+1] := Fornecedores_Atuais[I].For_CNPJ;
      Grid_Fornecedores.Cells[5,I+1] := Fornecedores_Atuais[I].For_Endereco;
      Grid_Fornecedores.Cells[6,I+1] := Fornecedores_Atuais[I].For_Telefone;
      Grid_Fornecedores.Cells[7,I+1] := Fornecedores_Atuais[I].For_Email;
    End;
  Grid_Fornecedores.RowCount := Grid_Fornecedores.RowCount - 1;
End;

procedure Tfrm_Fornecedores.for_PesquisaChange(Sender: TObject);
begin
  if for_Pesquisa.Text = ''
    then Begin
           Popula_Grid('');
           Exit;
         End;
  case cbx_PesquisaFornecedor.ItemIndex of
    0 : Popula_Grid('Where For_Codigo = '+for_Pesquisa.Text) ;
    1 : Popula_Grid('Where For_NomeFantasia Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    2 : Popula_Grid('Where For_RazaoSocial Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    3 : Popula_Grid('Where For_InscricaoEstadual Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    4 : Popula_Grid('Where For_CNPJ Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    5 : Popula_Grid('Where For_Endereco Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    6 : Popula_Grid('Where For_Telefone Like '+QuotedStr(for_Pesquisa.Text+'%')) ;
    7 : Popula_Grid('Where For_Email Like '+QuotedStr(for_Pesquisa.Text+'%')) ;

  end;
end;

procedure Tfrm_Fornecedores.ControlePaginasFornecedorChanging(Sender: TObject;
  var AllowChange: Boolean);
var msg : string;
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

procedure Tfrm_Fornecedores.Grid_FornecedoresSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

procedure Tfrm_Fornecedores.Grid_FornecedoresKeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(27)
  then btn_Fechar.Click;
end;

procedure Tfrm_Fornecedores.FormShow(Sender: TObject);
begin
  Pinta_Grid;
  Popula_Grid('');
end;

end.
