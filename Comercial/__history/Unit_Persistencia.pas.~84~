unit Unit_Persistencia;

interface

uses Unit_DM, Vcl.Dialogs, System.SysUtils, System.Variants;

// Definicoes do Cliente
Type
  Dados_Cliente = Record   //struct
                    Cli_Codigo   : Integer;
                    Cli_Nome     : String;
                    Cli_Endereco : String;
                    Cli_CPF      : String;
                    Cli_Telefone : String;
                    Cli_Email    : String;
                    Cli_Sexo     : Integer;
                    Cli_EstadoCivil: Integer;
                    Cli_DataNascimento: String;
                  End;
  Clientes_Cadastrados = Array of Dados_Cliente;
  Procedure Grava_Dados_Cliente(Dados_Form : Dados_Cliente;Alterando:Boolean);
  Procedure Remove_Cliente(Codigo : Integer);
  Function Retorna_Proximo_Codigo:String;
  Function Retorna_Dados_Cliente(Codigo : Integer) : Dados_Cliente;
  Function Retorna_Clientes_Cadastrados(Condicao:String) : Clientes_Cadastrados;

// Definicoes do Supermercado
Type
  Dados_Supermercado = Record
                        Sup_NomeFantasia : String;
                        Sup_RazaoSocial : String;
                        Sup_InscricaoEstadual : String;
                        Sup_CNPJ : String;
                        Sup_Endereco : String;
                        Sup_Lucro : String;
                        Sup_Telefone : String;
                        Sup_Email : String;
                        Sup_NomeResponsavel : String;
                        Sup_TelefoneResponsavel : String;
                      End;

Procedure Grava_Dados_Supermercado(Dados_Form : Dados_Supermercado);
Function Recupera_Dados_Supermercado: Dados_Supermercado;


// Definicoes do Produto
Type
  Dados_Produto = Record
                    Prod_Codigo : Integer;
                    Prod_Descricao : String;
                    Prod_Estoque : Integer;
                    Prod_EstoqueMinimo : Integer;
                    Prod_PrecoCusto : String;
                    Prod_PrecoVenda : String;
                  End;

Produtos_Cadastrados = Array of Dados_Produto;
Function Retorna_Proximo_Codigo_Produto : String;
Procedure Grava_Dados_Produto(Dados_Form : Dados_Produto; Alterando:Boolean);
Function Retorna_Produtos_Cadastrados(Condicao:String) : Produtos_Cadastrados;
Function Retorna_Dados_Produto(Codigo : Integer) : Dados_Produto;
Procedure Remove_Produto(Codigo : Integer);

// Definicoes do Fornecedor
Type
  Dados_Fornecedor =  Record
                        For_Codigo : Integer;
                        For_NomeFantasia : String;
                        For_RazaoSocial : String;
                        For_InscricaoEstadual: String;
                        For_CNPJ : String;
                        For_Endereco : String;
                        For_Telefone : String;
                        For_Email: String;
                      End;

Fornecedores_Cadastrados = Array of Dados_Fornecedor;
Function Retorna_Proximo_Codigo_Fornecedor : String;
Procedure Grava_Dados_Fornecedor(Dados_Form : Dados_Fornecedor; Alterando:Boolean);
Function Retorna_Fornecedores_Cadastrados(Condicao:String) : Fornecedores_Cadastrados;
Function Retorna_Dados_Fornecedor(Codigo : Integer) : Dados_Fornecedor;
Procedure Remove_Fornecedor(Codigo : Integer);

implementation


Procedure Commit;
Begin
  With DM.qryCommit Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Commit');
       Open;
       Close;
     End;
End;

// Funcoes do Cliente
Function Retorna_Proximo_Codigo:String;
  Begin
    With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Cli_Codigo');
        SQL.Add('From Cliente');
        SQL.Add('Order By Cli_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Cli_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Cli_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
  End;

Function Retorna_Clientes_Cadastrados(Condicao:String) : Clientes_Cadastrados;
Var
  I : Integer;
Begin
  With DM.qryCliente Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Cliente');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryCliente.RecordCount > 0
         then Begin
                for I := 1 to DM.qryCliente.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryCliente['Cli_Codigo'] <> Null
                    then Result[I-1].Cli_Codigo := DM.qryCliente['Cli_Codigo']
                    else Result[I-1].Cli_Codigo := -1;
                  if DM.qryCliente['Cli_Nome'] <> Null
                    then Result[I-1].Cli_Nome := DM.qryCliente['Cli_Nome']
                    else Result[I-1].Cli_Nome := '';
                  if DM.qryCliente['Cli_Endereco'] <> Null
                    then Result[I-1].Cli_Endereco := DM.qryCliente['Cli_Endereco']
                    else Result[I-1].Cli_Endereco := '';
                  if DM.qryCliente['Cli_CPF'] <> Null
                    then Result[I-1].Cli_CPF := DM.qryCliente['Cli_CPF']
                    else Result[I-1].Cli_CPF := '';
                  if DM.qryCliente['Cli_Telefone'] <> Null
                    then Result[I-1].Cli_Telefone := DM.qryCliente['Cli_Telefone']
                    else Result[I-1].Cli_Telefone := '';
                  if DM.qryCliente['Cli_Email'] <> Null
                    then Result[I-1].Cli_Email := DM.qryCliente['Cli_Email']
                    else Result[I-1].Cli_Email := '';
                  if DM.qryCliente['Cli_Sexo'] <> Null
                    then Result[I-1].Cli_Sexo := DM.qryCliente['Cli_Sexo']
                    else Result[I-1].Cli_Sexo := -1;
                  if DM.qryCliente['Cli_EstadoCivil'] <> Null
                    then Result[I-1].Cli_EstadoCivil := DM.qryCliente['Cli_EstadoCivil']
                    else Result[I-1].Cli_EstadoCivil := -1;
                  if DM.qryCliente['Cli_DataNascimento'] <> Null
                    then Result[I-1].Cli_DataNascimento := DM.qryCliente['Cli_DataNascimento']
                    else Result[I-1].Cli_DataNascimento := '';
                  Next;
                End;
              End;
     End;
End;

Procedure Grava_Dados_Cliente(Dados_Form : Dados_Cliente; Alterando:Boolean);
Begin
  if Not(Alterando)
    then Begin
            With DM.qryCliente Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Insert Into Cliente Values(');
                 SQL.Add(IntToStr(Dados_Form.Cli_Codigo)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_Nome)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_Endereco)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_CPF)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_Telefone)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_Email)+',');
                 SQL.Add(IntToStr(Dados_Form.Cli_Sexo)+',');
                 SQL.Add(IntToStr(Dados_Form.Cli_EstadoCivil)+',');
                 SQL.Add(QuotedStr(Dados_Form.Cli_DataNascimento)+')');

                 //ShowMessage(SQL.Text);
                 ExecSQL;
                 Commit;
               End;
         End
    Else Begin
            With DM.qryCliente Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Update Cliente Set');
                 SQL.Add('Cli_Nome = '+QuotedStr(Dados_Form.Cli_Nome)+',');
                 SQL.Add('Cli_Endereco = '+QuotedStr(Dados_Form.Cli_Endereco)+',');
                 SQL.Add('Cli_CPF = '+QuotedStr(Dados_Form.Cli_CPF)+',');
                 SQL.Add('Cli_Telefone = '+QuotedStr(Dados_Form.Cli_Telefone)+',');
                 SQL.Add('Cli_Email = '+QuotedStr(Dados_Form.Cli_Email)+',');
                 SQL.Add('Cli_Sexo = '+IntToStr(Dados_Form.Cli_Sexo)+',');
                 SQL.Add('Cli_EstadoCivil = '+IntToStr(Dados_Form.Cli_EstadoCivil)+',');
                 SQL.Add('Cli_DataNascimento = '+QuotedStr(Dados_Form.Cli_DataNascimento));
                 SQL.Add('Where Cli_Codigo = '+IntToStr(Dados_Form.Cli_Codigo));
                 ExecSQL;
                 Commit;
               End;
         End;
End;

Procedure Remove_Cliente(Codigo : Integer);
Begin
   With DM.qryCliente Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Delete From Cliente ');
      SQL.Add('Where Cli_Codigo = '+IntToStr(Codigo));
      ExecSQL;
      Commit;
    End;
End;

Function Retorna_Dados_Cliente(Codigo : Integer) : Dados_Cliente;
Var
  I : Integer;
Begin
  With DM.qryCliente Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Cliente');
       SQL.Add('Where Cli_Codigo = '+IntToStr(Codigo));
//       ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryCliente.RecordCount > 0
         then Begin
                for I := 1 to DM.qryCliente.RecordCount Do
                Begin
                  if DM.qryCliente['Cli_Codigo'] <> Null
                    then Result.Cli_Codigo := DM.qryCliente['Cli_Codigo']
                    else Result.Cli_Codigo := -1;
                  if DM.qryCliente['Cli_Nome'] <> Null
                    then Result.Cli_Nome := DM.qryCliente['Cli_Nome']
                    else Result.Cli_Nome := '';
                  if DM.qryCliente['Cli_Endereco'] <> Null
                    then Result.Cli_Endereco := DM.qryCliente['Cli_Endereco']
                    else Result.Cli_Endereco := '';
                  if DM.qryCliente['Cli_CPF'] <> Null
                    then Result.Cli_CPF := DM.qryCliente['Cli_CPF']
                    else Result.Cli_CPF := '';
                  if DM.qryCliente['Cli_Telefone'] <> Null
                    then Result.Cli_Telefone := DM.qryCliente['Cli_Telefone']
                    else Result.Cli_Telefone := '';
                  if DM.qryCliente['Cli_Email'] <> Null
                    then Result.Cli_Telefone := DM.qryCliente['Cli_Email']
                    else Result.Cli_Telefone := '';
                  if DM.qryCliente['Cli_Sexo'] <> Null
                    then Result.Cli_Sexo := DM.qryCliente['Cli_Sexo']
                    else Result.Cli_Sexo := -1;
                  if DM.qryCliente['Cli_EstadoCivil'] <> Null
                    then Result.Cli_Sexo := DM.qryCliente['Cli_EstadoCivil']
                    else Result.Cli_Sexo := -1;
                  if DM.qryCliente['Cli_DataNascimento'] <> Null
                    then Result.Cli_Telefone := DM.qryCliente['Cli_DataNascimento']
                    else Result.Cli_Telefone := '';
                  Next;
                End;
              End;
     End;
End;

// Funcoes do Supermercado
Procedure Grava_Dados_Supermercado(Dados_Form : Dados_Supermercado);
begin
  With DM.qrySupermercado Do
    Begin
      Close;
      SQL.Clear;

      SQL.Add('Update Supermercado Set');
      SQL.Add('Sup_NomeFantasia = '+QuotedStr(Dados_Form.Sup_NomeFantasia)+',');
      SQL.Add('Sup_RazaoSocial = '+QuotedStr(Dados_Form.Sup_RazaoSocial)+',');
      SQL.Add('Sup_InscricaoEstadual = '+QuotedStr(Dados_Form.Sup_InscricaoEstadual)+',');
      SQL.Add('Sup_CNPJ = '+QuotedStr(Dados_Form.Sup_CNPJ)+',');
      SQL.Add('Sup_Endereco = '+QuotedStr(Dados_Form.Sup_Endereco)+',');
      SQL.Add('Sup_Lucro = '+QuotedStr(Dados_Form.Sup_Lucro)+',');
      SQL.Add('Sup_Telefone = '+QuotedStr(Dados_Form.Sup_Telefone)+',');
      SQL.Add('Sup_Email = '+QuotedStr(Dados_Form.Sup_Email)+',');
      SQL.Add('Sup_NomeResponsavel = '+QuotedStr(Dados_Form.Sup_NomeResponsavel)+',');
      SQL.Add('Sup_TelefoneResponsavel = '+QuotedStr(Dados_Form.Sup_TelefoneResponsavel));
      SQL.Add('where Sup_CNPJ = '+QuotedStr(Dados_Form.Sup_CNPJ));

//      ShowMessage(SQL.Text);
      ExecSQL;
      Commit;
    End;
end;

Function Recupera_Dados_Supermercado;
begin
  With DM.qrySupermercado Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Supermercado');
//       ShowMessage(SQL.Text);
       //ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória

        if DM.qrySupermercado['Sup_NomeFantasia'] <> Null
          then Result.Sup_NomeFantasia := DM.qrySupermercado['Sup_NomeFantasia']
          else Result.Sup_NomeFantasia := '';
        if DM.qrySupermercado['Sup_RazaoSocial'] <> Null
          then Result.Sup_RazaoSocial := DM.qrySupermercado['Sup_RazaoSocial']
          else Result.Sup_RazaoSocial := '';
        if DM.qrySupermercado['Sup_InscricaoEstadual'] <> Null
          then Result.Sup_InscricaoEstadual := DM.qrySupermercado['Sup_InscricaoEstadual']
          else Result.Sup_InscricaoEstadual := '';
        if DM.qrySupermercado['Sup_CNPJ'] <> Null
          then Result.Sup_CNPJ := DM.qrySupermercado['Sup_CNPJ']
          else Result.Sup_CNPJ := '';
        if DM.qrySupermercado['Sup_Endereco'] <> Null
          then Result.Sup_Endereco := DM.qrySupermercado['Sup_Endereco']
          else Result.Sup_Endereco := '';
        if DM.qrySupermercado['Sup_Lucro'] <> Null
          then Result.Sup_Lucro := DM.qrySupermercado['Sup_Lucro']
          else Result.Sup_Lucro := '';
        if DM.qrySupermercado['Sup_Telefone'] <> Null
          then Result.Sup_Telefone := DM.qrySupermercado['Sup_Telefone']
          else Result.Sup_Telefone := '';
        if DM.qrySupermercado['Sup_Email'] <> Null
          then Result.Sup_Email := DM.qrySupermercado['Sup_Email']
          else Result.Sup_Email := '';
        if DM.qrySupermercado['Sup_NomeResponsavel'] <> Null
          then Result.Sup_NomeResponsavel := DM.qrySupermercado['Sup_NomeResponsavel']
          else Result.Sup_NomeResponsavel := '';
        if DM.qrySupermercado['Sup_TelefoneResponsavel'] <> Null
          then Result.Sup_TelefoneResponsavel := DM.qrySupermercado['Sup_TelefoneResponsavel']
          else Result.Sup_TelefoneResponsavel := '';

     End;

end;

// Funcoes Produto

Function Retorna_Proximo_Codigo_Produto:String;
  Begin
    With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Prod_Codigo');
        SQL.Add('From Produto');
        SQL.Add('Order By Prod_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Prod_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Prod_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
  End;

Procedure Grava_Dados_Produto(Dados_Form : Dados_Produto; Alterando:Boolean);
Begin
  if Not(Alterando)
    then Begin
            With DM.qryProduto Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Insert Into Produto Values(');
                 SQL.Add(IntToStr(Dados_Form.Prod_Codigo)+',');
                 SQL.Add(QuotedStr(Dados_Form.Prod_Descricao)+',');
                 SQL.Add(IntToStr(Dados_Form.Prod_Estoque)+',');
                 SQL.Add(IntToStr(Dados_Form.Prod_EstoqueMinimo)+',');
                 SQL.Add(QuotedStr(Dados_Form.Prod_PrecoCusto)+',');
                 SQL.Add(QuotedStr(Dados_Form.Prod_PrecoVenda)+')');
                 ExecSQL;
                 Commit;
               End;
         End
    Else Begin
            With DM.qryProduto Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Update Produto Set');
                 SQL.Add('Prod_Descricao = '+QuotedStr(Dados_Form.Prod_Descricao)+',');
                 SQL.Add('Prod_Estoque = '+IntToStr(Dados_Form.Prod_Estoque)+',');
                 SQL.Add('Prod_EstoqueMinimo = '+IntToStr(Dados_Form.Prod_EstoqueMinimo)+',');
                 SQL.Add('Prod_PrecoCusto = '+QuotedStr(Dados_Form.Prod_PrecoCusto)+',');
                 SQL.Add('Prod_PrecoVenda = '+QuotedStr(Dados_Form.Prod_PrecoVenda));
                 SQL.Add('Where Prod_Codigo = '+IntToStr(Dados_Form.Prod_Codigo));
                 ExecSQL;
                 Commit;
               End;
         End;
End;

Function Retorna_Produtos_Cadastrados(Condicao:String) : Produtos_Cadastrados;
Var
  I : Integer;
Begin
  With DM.qryProduto Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Produto');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryProduto.RecordCount > 0
         then Begin
                for I := 1 to DM.qryProduto.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryProduto['Prod_Codigo'] <> Null
                    then Result[I-1].Prod_Codigo := DM.qryProduto['Prod_Codigo']
                    else Result[I-1].Prod_Codigo := -1;
                  if DM.qryProduto['Prod_Descricao'] <> Null
                    then Result[I-1].Prod_Descricao := DM.qryProduto['Prod_Descricao']
                    else Result[I-1].Prod_Descricao := '';
                  if DM.qryProduto['Prod_Estoque'] <> Null
                    then Result[I-1].Prod_Estoque := DM.qryProduto['Prod_Estoque']
                    else Result[I-1].Prod_Estoque := -1;
                  if DM.qryProduto['Prod_EstoqueMinimo'] <> Null
                    then Result[I-1].Prod_EstoqueMinimo := DM.qryProduto['Prod_EstoqueMinimo']
                    else Result[I-1].Prod_EstoqueMinimo := -1;
                  if DM.qryProduto['Prod_PrecoCusto'] <> Null
                    then Result[I-1].Prod_PrecoCusto := DM.qryProduto['Prod_PrecoCusto']
                    else Result[I-1].Prod_PrecoCusto := '';
                  if DM.qryProduto['Prod_PrecoVenda'] <> Null
                    then Result[I-1].Prod_PrecoVenda := DM.qryProduto['Prod_PrecoVenda']
                    else Result[I-1].Prod_PrecoVenda := '';
                  Next;
                End;
              End;
     End;
End;

Function Retorna_Dados_Produto(Codigo : Integer) : Dados_Produto;
Var
  I : Integer;
Begin
  With DM.qryProduto Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Produto');
       SQL.Add('Where Prod_Codigo = '+IntToStr(Codigo));
//       ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryProduto.RecordCount > 0
         then Begin
                for I := 1 to DM.qryProduto.RecordCount Do
                Begin
                  if DM.qryProduto['Prod_Codigo'] <> Null
                    then Result.Prod_Codigo := DM.qryProduto['Prod_Codigo']
                    else Result.Prod_Codigo := -1;
                  if DM.qryProduto['Prod_Descricao'] <> Null
                    then Result.Prod_Descricao := DM.qryProduto['Prod_Descricao']
                    else Result.Prod_Descricao := '';
                  if DM.qryProduto['Prod_Estoque'] <> Null
                    then Result.Prod_Estoque := DM.qryProduto['Prod_Estoque']
                    else Result.Prod_Estoque := -1;
                  if DM.qryProduto['Prod_EstoqueMinimo'] <> Null
                    then Result.Prod_EstoqueMinimo := DM.qryProduto['Prod_EstoqueMinimo']
                    else Result.Prod_EstoqueMinimo := -1;
                  if DM.qryProduto['Prod_PrecoCusto'] <> Null
                    then Result.Prod_PrecoCusto := DM.qryProduto['Prod_PrecoCusto']
                    else Result.Prod_PrecoCusto := '';
                  if DM.qryProduto['Prod_PrecoVenda'] <> Null
                    then Result.Prod_PrecoVenda := DM.qryProduto['Prod_PrecoVenda']
                    else Result.Prod_PrecoVenda := '';
                  Next;
                End;
              End;
     End;
End;

Procedure Remove_Produto(Codigo : Integer);
Begin
   With DM.qryProduto Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Delete From Produto ');
      SQL.Add('Where Prod_Codigo = '+IntToStr(Codigo));
      ExecSQL;
      Commit;
    End;
End;

// Funcoes do Fornecedor

Function Retorna_Proximo_Codigo_Fornecedor:String;
  Begin
    With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 For_Codigo');
        SQL.Add('From Fornecedor');
        SQL.Add('Order By For_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['For_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['For_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
  End;

Procedure Grava_Dados_Fornecedor(Dados_Form : Dados_Fornecedor; Alterando:Boolean);
Begin
  if Not(Alterando)
    then Begin
            With DM.qryFornecedor Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Insert Into Fornecedor Values(');
                 SQL.Add(IntToStr(Dados_Form.For_Codigo)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_NomeFantasia)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_RazaoSocial)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_InscricaoEstadual)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_CNPJ)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_Endereco)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_Telefone)+',');
                 SQL.Add(QuotedStr(Dados_Form.For_Email)+')');
                 ExecSQL;
                 Commit;
               End;
         End
    Else Begin
            With DM.qryFornecedor Do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('Update Fornecedor Set');
                 SQL.Add('For_NomeFantasia = '+QuotedStr(Dados_Form.For_NomeFantasia)+',');
                 SQL.Add('For_RazaoSocial = '+QuotedStr(Dados_Form.For_RazaoSocial)+',');
                 SQL.Add('For_InscricaoEstadual = '+QuotedStr(Dados_Form.For_InscricaoEstadual)+',');
                 SQL.Add('For_CNPJ = '+QuotedStr(Dados_Form.For_CNPJ)+',');
                 SQL.Add('For_Endereco = '+QuotedStr(Dados_Form.For_Endereco)+',');
                 SQL.Add('For_Telefone = '+QuotedStr(Dados_Form.For_Telefone)+',');
                 SQL.Add('For_Email = '+QuotedStr(Dados_Form.For_Email));
                 SQL.Add('Where For_Codigo = '+IntToStr(Dados_Form.For_Codigo));
                 ExecSQL;
                 Commit;
               End;
         End;
End;

Function Retorna_Fornecedores_Cadastrados(Condicao:String) : Fornecedores_Cadastrados;
Var
  I : Integer;
Begin
  With DM.qryFornecedor Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Fornecedor');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryFornecedor.RecordCount > 0
         then Begin
                for I := 1 to DM.qryFornecedor.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryFornecedor['For_Codigo'] <> Null
                    then Result[I-1].For_Codigo := DM.qryFornecedor['For_Codigo']
                    else Result[I-1].For_Codigo := -1;
                  if DM.qryFornecedor['For_NomeFantasia'] <> Null
                    then Result[I-1].For_NomeFantasia := DM.qryFornecedor['For_NomeFantasia']
                    else Result[I-1].For_NomeFantasia := '';
                  if DM.qryFornecedor['For_RazaoSocial'] <> Null
                    then Result[I-1].For_RazaoSocial := DM.qryFornecedor['For_RazaoSocial']
                    else Result[I-1].For_RazaoSocial := '';
                  if DM.qryFornecedor['For_InscricaoEstadual'] <> Null
                    then Result[I-1].For_InscricaoEstadual := DM.qryFornecedor['For_InscricaoEstadual']
                    else Result[I-1].For_InscricaoEstadual := '';
                  if DM.qryFornecedor['For_CNPJ'] <> Null
                    then Result[I-1].For_CNPJ := DM.qryFornecedor['For_CNPJ']
                    else Result[I-1].For_CNPJ := '';
                  if DM.qryFornecedor['For_Endereco'] <> Null
                    then Result[I-1].For_Endereco := DM.qryFornecedor['For_Endereco']
                    else Result[I-1].For_Endereco := '';
                  if DM.qryFornecedor['For_Telefone'] <> Null
                    then Result[I-1].For_Telefone := DM.qryFornecedor['For_Telefone']
                    else Result[I-1].For_Telefone := '';
                  if DM.qryFornecedor['For_Email'] <> Null
                    then Result[I-1].For_Email := DM.qryFornecedor['For_Email']
                    else Result[I-1].For_Email := '';
                  Next;
                End;
              End;
     End;
End;

Function Retorna_Dados_Fornecedor(Codigo : Integer) : Dados_Fornecedor;
Var
  I : Integer;
Begin
  With DM.qryFornecedor Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Fornecedor');
       SQL.Add('Where For_Codigo = '+IntToStr(Codigo));
//       ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra memória
       First;
       if DM.qryFornecedor.RecordCount > 0
         then Begin
                for I := 1 to DM.qryFornecedor.RecordCount Do
                Begin
                  if DM.qryFornecedor['For_Codigo'] <> Null
                    then Result.For_Codigo := DM.qryFornecedor['For_Codigo']
                    else Result.For_Codigo := -1;
                  if DM.qryFornecedor['For_NomeFantasia'] <> Null
                    then Result.For_NomeFantasia := DM.qryFornecedor['For_NomeFantasia']
                    else Result.For_NomeFantasia := '';
                  if DM.qryFornecedor['For_RazaoSocial'] <> Null
                    then Result.For_RazaoSocial := DM.qryFornecedor['For_RazaoSocial']
                    else Result.For_RazaoSocial := '';
                  if DM.qryFornecedor['For_InscricaoEstadual'] <> Null
                    then Result.For_InscricaoEstadual := DM.qryFornecedor['For_InscricaoEstadual']
                    else Result.For_InscricaoEstadual := '';
                  if DM.qryFornecedor['For_CNPJ'] <> Null
                    then Result.For_CNPJ := DM.qryFornecedor['For_CNPJ']
                    else Result.For_CNPJ := '';
                  if DM.qryFornecedor['For_Endereco'] <> Null
                    then Result.For_Endereco := DM.qryFornecedor['For_Endereco']
                    else Result.For_Endereco := '';
                  if DM.qryFornecedor['For_Telefone'] <> Null
                    then Result.For_Telefone := DM.qryFornecedor['For_Telefone']
                    else Result.For_Telefone := '';
                  if DM.qryFornecedor['For_Email'] <> Null
                    then Result.For_Email := DM.qryFornecedor['For_Email']
                    else Result.For_Email := '';
                  Next;
                End;
              End;
     End;
End;

Procedure Remove_Fornecedor(Codigo : Integer);
Begin
   With DM.qryFornecedor Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Delete From Fornecedor ');
      SQL.Add('Where For_Codigo = '+IntToStr(Codigo));
      ExecSQL;
      Commit;
    End;
End;

end.
