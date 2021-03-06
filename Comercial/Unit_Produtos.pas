unit Unit_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, Unit_Persistencia;

type
  Tfrm_Produtos = class(TForm)
    ControlePaginasProduto: TPageControl;
    Visualização: TTabSheet;
    Grid_Produtos: TStringGrid;
    cli_Panel1: TPanel;
    prod_ComboBox: TLabel;
    label_Pesquisa: TLabel;
    btn_Fechar1: TBitBtn;
    cbx_PesquisaProduto: TComboBox;
    prod_Pesquisa: TMaskEdit;
    CRUD_Produto: TTabSheet;
    PopupGridProdutos: TPopupMenu;
    PopupEditarProduto: TMenuItem;
    PopupExcluirProduto: TMenuItem;
    cli_Panel2: TPanel;
    btn_Fechar: TBitBtn;
    btn_Gravar: TBitBtn;
    btn_Limpar: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Novo: TBitBtn;
    prod_Codigo: TLabeledEdit;
    prod_Descricao: TLabeledEdit;
    prod_Estoque: TLabeledEdit;
    prod_EstoqueMinimo: TLabeledEdit;
    prod_PrecoCusto: TLabeledEdit;
    prod_PrecoVenda: TLabeledEdit;
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
    procedure PopupExcluirProdutoClick(Sender: TObject);
    procedure PopupEditarProdutoClick(Sender: TObject);
    Function Validado : Boolean;
    procedure FormShow(Sender: TObject);
    Procedure Pinta_Grid;
    procedure prod_PesquisaChange(Sender: TObject);
    procedure ControlePaginasProdutoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Grid_ProdutosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure Grid_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure cbx_PesquisaProdutoChange(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Produtos: Tfrm_Produtos;
  Alterando : Boolean;
  Linha : Integer;

implementation

{$R *.dfm}

procedure Tfrm_Produtos.btn_FecharClick(Sender: TObject);
begin
  frm_Produtos.Close;
end;

Procedure Tfrm_Produtos.Limpa_Componentes;
  Begin
    prod_Descricao.Clear;
    prod_Estoque.Clear;
    prod_EstoqueMinimo.Clear;
    prod_PrecoCusto.Clear;
    prod_PrecoVenda.Clear;
  End;

procedure Tfrm_Produtos.btn_LimparClick(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente limpar todos os campos? Tem certeza?',
                            'Limpar todos os campos?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then Limpa_Componentes;
end;

Procedure Tfrm_Produtos.Habilita_Tela(Habilitado:Boolean);
  Begin
    prod_Descricao.Enabled := Habilitado;
    prod_Estoque.Enabled := Habilitado;
    prod_EstoqueMinimo.Enabled := Habilitado;
    prod_PrecoCusto.Enabled := Habilitado;
    prod_PrecoVenda.Enabled := Habilitado;
  End;

Procedure Tfrm_Produtos.Habilita_Botoes(Quais:String);
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

procedure Tfrm_Produtos.btn_CancelarClick(Sender: TObject);
begin
  Habilita_Tela(False);
  Limpa_Componentes;
  Habilita_Botoes('10001');
end;

procedure Tfrm_Produtos.btn_NovoClick(Sender: TObject);
begin
  Habilita_Tela(True);
  prod_Descricao.SetFocus;
  Limpa_Componentes;
  prod_Codigo.Text := Retorna_Proximo_Codigo_Produto;
  Habilita_Botoes('01110');
  Alterando := False;
end;

procedure Tfrm_Produtos.cbx_PesquisaProdutoChange(Sender: TObject);
begin
  prod_Pesquisa.Enabled := True;
  prod_Pesquisa.Text := '';
end;

/// Falta controlar que apenas NUMEROS possam ser digitados nos campos de preco e estoque
Function Tfrm_Produtos.Validado : Boolean;
begin
  Result := False;
  if Trim(prod_Descricao.Text) = ''
    then Begin
           Application.MessageBox('O campo de Descrição é obrigatório',
                                  'Informe a descrição do produto.',
                                  MB_ICONERROR + MB_OK);
           prod_Descricao.SetFocus;
           Exit;
         End;
  if Trim(prod_Estoque.Text) = ''
    then Begin
           Application.MessageBox('O campo de Estoque é obrigatório',
                                  'Informe o estoque',
                                  MB_ICONERROR + MB_OK);
           prod_Estoque.SetFocus;
           Exit;
         End;      
  if Trim(prod_EstoqueMinimo.Text) = ''
    then Begin
           Application.MessageBox('O campo de Estoque Mínimo é obrigatório',
                                  'Informe o estoque mínimo',
                                  MB_ICONERROR + MB_OK);
           prod_EstoqueMinimo.SetFocus;
           Exit;
         End; 
  if Trim(prod_PrecoCusto.Text) = ''
    then Begin
           Application.MessageBox('O campo de Preço do Custo é obrigatório',
                                  'Informe o preço do custo.',
                                  MB_ICONERROR + MB_OK);
           prod_PrecoCusto.SetFocus;
           Exit;
         End;
  if Trim(prod_PrecoVenda.Text) = ''
    then Begin
           Application.MessageBox('O campo de Preço de Venda é obrigatório',
                                  'Informe o preço de Venda.',
                                  MB_ICONERROR + MB_OK);
           prod_PrecoVenda.SetFocus;
           Exit;
         End;  
  Result := True;
end;

Procedure Tfrm_Produtos.Popula_Grid(Condicao : String);
Var
  Produtos_Atuais : Produtos_Cadastrados;
  I : Integer;
Begin
  SetLength(Produtos_Atuais,0);
  Grid_Produtos.RowCount := 2;
  Grid_Produtos.Cells[0,1] := '';
  Grid_Produtos.Cells[1,1] := '';
  Grid_Produtos.Cells[2,1] := '';
  Grid_Produtos.Cells[3,1] := '';
  Grid_Produtos.Cells[4,1] := '';
  Grid_Produtos.Cells[5,1] := '';

  Produtos_Atuais := Retorna_Produtos_Cadastrados(Condicao);
  if Length(Produtos_Atuais) = 0
    then Begin
           PopupEditarProduto.Enabled := False;
           Exit;
         End;
  PopupEditarProduto.Enabled := True;
  For I := 0 To Length(Produtos_Atuais)-1 Do
    Begin
      Grid_Produtos.RowCount := Grid_Produtos.RowCount + 1;
      Grid_Produtos.Cells[0,I+1] := IntToStr(Produtos_Atuais[I].Prod_Codigo);
      Grid_Produtos.Cells[1,I+1] := Produtos_Atuais[I].Prod_Descricao;
      Grid_Produtos.Cells[2,I+1] := IntToStr(Produtos_Atuais[I].Prod_Estoque);
      Grid_Produtos.Cells[3,I+1] := IntToStr(Produtos_Atuais[I].Prod_EstoqueMinimo);
      Grid_Produtos.Cells[4,I+1] := Produtos_Atuais[I].Prod_PrecoCusto;
      Grid_Produtos.Cells[5,I+1] := Produtos_Atuais[I].Prod_PrecoVenda; 
    End;
  Grid_Produtos.RowCount := Grid_Produtos.RowCount - 1;
End;

procedure Tfrm_Produtos.btn_GravarClick(Sender: TObject);
var
  Temp : Dados_Produto;
begin
  if Validado
  then Begin

         if prod_Codigo.Text <> ''
           then Temp.prod_Codigo := StrToInt(prod_Codigo.Text);
         if prod_Descricao.Text <> ''
           then Temp.prod_Descricao := prod_Descricao.Text;
         if prod_Estoque.Text <> ''
           then Temp.prod_Estoque := StrToInt(prod_Estoque.Text);
         if prod_EstoqueMinimo.Text <> ''
           then Temp.prod_EstoqueMinimo := StrToInt(prod_EstoqueMinimo.Text);
         if prod_PrecoCusto.Text <> ''
           then Temp.prod_PrecoCusto := prod_PrecoCusto.Text;
         if prod_PrecoVenda.Text <> ''
           then Temp.prod_PrecoVenda := prod_PrecoVenda.Text;
         Grava_Dados_Produto(Temp, Alterando);
         Habilita_Tela(False);
         Habilita_Botoes('10001');
         Limpa_Componentes;
         Popula_Grid('');
         Alterando := False;     
        End;

end;

Procedure Tfrm_Produtos.Preenche_Componentes;
Var
  Temp : Dados_Produto;
Begin
  if Grid_Produtos.Cells[0,Linha] = ''
    then Exit;
  Temp := Retorna_Dados_Produto(StrToInt(Grid_Produtos.Cells[0,Linha]));
  prod_Codigo.Text := IntToStr(Temp.prod_Codigo);
  prod_Descricao.Text := Temp.prod_Descricao;
  prod_Estoque.Text := IntToStr(Temp.prod_Estoque);
  prod_EstoqueMinimo.Text := IntToStr(Temp.prod_EstoqueMinimo);
  prod_PrecoCusto.Text := Temp.prod_PrecoCusto;
  prod_PrecoVenda.Text := Temp.prod_PrecoVenda;          
  
End;



procedure Tfrm_Produtos.PopupEditarProdutoClick(Sender: TObject);
begin
    Preenche_Componentes;
    if Prod_Codigo.Text = ''
      then Exit;
    ControlePaginasProduto.ActivePageIndex := 1;
    Alterando := True;
    Habilita_Botoes('01110');
    Habilita_Tela(True);
end;

procedure Tfrm_Produtos.PopupExcluirProdutoClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja realmente excluir o Produto? Essa opção não pode ser desfeita.',
                            'Excluir Produto?',
                            MB_ICONQUESTION + MB_YESNO) = mrYes
    then begin
      Preenche_Componentes;
      if Prod_Codigo.Text = ''
        then Exit;
      Remove_Produto(StrToInt(Grid_Produtos.Cells[0,Linha]));
      Limpa_Componentes;
      Popula_Grid('');
    end;
end;

Procedure Tfrm_Produtos.Pinta_Grid;
begin
  Grid_Produtos.Cells[0,0] := 'Cód.';
  Grid_Produtos.Cells[1,0] := 'Descrição';
  Grid_Produtos.Cells[2,0] := 'Estoque';
  Grid_Produtos.Cells[3,0] := 'Estoque Minimo';
  Grid_Produtos.Cells[4,0] := 'Preço de Custo';
  Grid_Produtos.Cells[5,0] := 'Preço de Venda';
  Grid_Produtos.ColWidths[0] := 50;
  Grid_Produtos.ColWidths[1] := 300;
  Grid_Produtos.ColWidths[2] := 100;
  Grid_Produtos.ColWidths[3] := 100;
  Grid_Produtos.ColWidths[4] := 150;
  Grid_Produtos.ColWidths[5] := 150;
end;

procedure Tfrm_Produtos.prod_PesquisaChange(Sender: TObject);
begin
  if prod_Pesquisa.Text = ''
    then Begin
           Popula_Grid('');
           Exit;
         End;
  case cbx_PesquisaProduto.ItemIndex of
    0 : Popula_Grid('Where Prod_Codigo = '+prod_Pesquisa.Text) ;
    1 : Popula_Grid('Where Prod_Descricao Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;
    2 : Popula_Grid('Where Prod_Estoque = '+prod_Pesquisa.Text) ;
    3 : Popula_Grid('Where Prod_EstoqueMinimo = '+prod_Pesquisa.Text) ;
    4 : Popula_Grid('Where Prod_PrecoCusto Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;
    5 : Popula_Grid('Where Prod_PrecoVenda Like '+QuotedStr(prod_Pesquisa.Text+'%')) ;
    
  end;
end;
                
procedure Tfrm_Produtos.ControlePaginasProdutoChanging(Sender: TObject;
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

procedure Tfrm_Produtos.Grid_ProdutosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Linha := ARow;
end;

procedure Tfrm_Produtos.Grid_ProdutosKeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(27)
  then btn_Fechar.Click;
end;

procedure Tfrm_Produtos.FormShow(Sender: TObject);
begin
  Pinta_Grid;
  Popula_Grid('');
end;

end.
