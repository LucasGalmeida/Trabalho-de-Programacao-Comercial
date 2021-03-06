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

// Definicoes do Caixa
Type
  Dados_Transacao = Record   //struct
                    Cai_Codigo     : Integer;
                    Cai_Descricao  : String;
                    Cai_Valor      : String;
                    Cai_Data       : String;
                    Cai_CodigoNota : Integer;
                  End;
  Transacoes_Realizadas = Array of Dados_Transacao;
  Function Retorna_Transacoes_Realizadas(Condicao:String) : Transacoes_Realizadas;
  Function Retorna_Proximo_Codigo_Transacao : String;
  Procedure Grava_Dados_Transacao(Dados_Form : Dados_Transacao);

// Definicoes de Contas a Receber
Type
  Dados_ContasReceber = Record   //struct
                    Cr_Codigo     : Integer;
                    Cr_CodigoCliente : Integer;
                    Cr_Descricao  : String;
                    Cr_Valor      : String;
                    Cr_Data       : String;
                    Cr_CodigoNota : Integer;
                  End;
    Contas_Receber = Array of Dados_ContasReceber;
Function Retorna_Proximo_Codigo_ContaReceber : String;
Function Retorna_Contas_Receber(Condicao:String) : Contas_Receber;
Procedure Grava_Dados_ContaReceber(Dados_Form : Dados_ContasReceber);

// Definicoes de Contas a Pagar
Type
  Dados_ContasPagar = Record   //struct
                    Cp_Codigo     : Integer;
                    Cp_CodigoFornecedor : Integer;
                    Cp_Descricao  : String;
                    Cp_Valor      : String;
                    Cp_Data       : String;
                    Cp_CodigoNota : Integer;
                  End;
    Contas_Pagar = Array of Dados_ContasPagar;
Function Retorna_Proximo_Codigo_ContaPagar : String;
Function Retorna_Contas_Pagar(Condicao:String) : Contas_Pagar;
Procedure Grava_Dados_ContaPagar(Dados_Form : Dados_ContasPagar);

// Definicoes Nota Venda
Type
  Dados_NotaVenda = Record
                      Nv_Codigo : Integer;
                      Nv_CodigoCliente : Integer;
                      Nv_ProdutosVendidos : String;
                      Nv_Data : String;
                      Nv_ValorTotal: String;
                    End;
    Notas_Venda = Array of Dados_NotaVenda;
Function Retorna_Proximo_Codigo_NotaVenda : String;
Function Retorna_NotasVenda(Condicao:String) : Notas_Venda;
Function Retorna_NotaVenda(Codigo:Integer): Dados_NotaVenda;
Procedure Grava_Dados_NotaVenda(Dados_Form : Dados_NotaVenda);

// Definicoes Nota Compra
Type
  Dados_NotaCompra = Record
                      Nc_Codigo : Integer;
                      Nc_CodigoFornecedor : Integer;
                      Nc_ProdutosComprados : String;
                      Nc_Data : String;
                      Nc_ValorTotal: String;
                      Nc_Frete : String;
                      Nc_Imposto : String;
                    End;
        Notas_Compra = Array of Dados_NotaCompra;
Function Retorna_Proximo_Codigo_NotaCompra : String;
Function Retorna_NotasCompra(Condicao:String) : Notas_Compra;
Function Retorna_NotaCompra(Codigo:Integer): Dados_NotaCompra;
Procedure Grava_Dados_NotaCompra(Dados_Form : Dados_NotaCompra);

//Outras
Procedure Commit;


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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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
                    then Result.Cli_Email := DM.qryCliente['Cli_Email']
                    else Result.Cli_Email := '';
                  if DM.qryCliente['Cli_Sexo'] <> Null
                    then Result.Cli_Sexo := DM.qryCliente['Cli_Sexo']
                    else Result.Cli_Sexo := -1;
                  if DM.qryCliente['Cli_EstadoCivil'] <> Null
                    then Result.Cli_EstadoCivil := DM.qryCliente['Cli_EstadoCivil']
                    else Result.Cli_EstadoCivil := -1;
                  if DM.qryCliente['Cli_DataNascimento'] <> Null
                    then Result.Cli_DataNascimento := DM.qryCliente['Cli_DataNascimento']
                    else Result.Cli_DataNascimento := '';
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
       FetchAll; //garante que todos os resultados vieram pra mem?ria

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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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
       FetchAll; //garante que todos os resultados vieram pra mem?ria
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


//  Funcoes do Caixa
Function Retorna_Transacoes_Realizadas(Condicao:String) : Transacoes_Realizadas;
Var
  I : Integer;
Begin
  With DM.qryCaixa Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From Caixa');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem?ria
       First;
       if DM.qryCaixa.RecordCount > 0
         then Begin
                for I := 1 to DM.qryCaixa.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryCaixa['Cai_Codigo'] <> Null
                    then Result[I-1].Cai_Codigo := DM.qryCaixa['Cai_Codigo']
                    else Result[I-1].Cai_Codigo := -1;
                  if DM.qryCaixa['Cai_Descricao'] <> Null
                    then Result[I-1].Cai_Descricao := DM.qryCaixa['Cai_Descricao']
                    else Result[I-1].Cai_Descricao := '';
                  if DM.qryCaixa['Cai_Valor'] <> Null
                    then Result[I-1].Cai_Valor := DM.qryCaixa['Cai_Valor']
                    else Result[I-1].Cai_Valor := '';
                  if DM.qryCaixa['Cai_Data'] <> Null
                    then Result[I-1].Cai_Data := DM.qryCaixa['Cai_Data']
                    else Result[I-1].Cai_Data := '';
                  if DM.qryCaixa['Cai_CodigoNota'] <> Null
                    then Result[I-1].Cai_CodigoNota := DM.qryCaixa['Cai_CodigoNota']
                    else Result[I-1].Cai_CodigoNota := -1;
                  Next;
                End;
              End;
     End;
end;

Function Retorna_Proximo_Codigo_Transacao : String;
begin
 With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Cai_Codigo');
        SQL.Add('From Caixa');
        SQL.Add('Order By Cai_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Cai_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Cai_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
end;

Procedure Grava_Dados_Transacao(Dados_Form : Dados_Transacao);
Begin
    With DM.qryCaixa Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Insert Into Caixa Values(');
         SQL.Add(IntToStr(Dados_Form.Cai_Codigo)+',');
         SQL.Add(QuotedStr(Dados_Form.Cai_Descricao)+',');
         SQL.Add(QuotedStr(Dados_Form.Cai_Valor)+',');
         SQL.Add(QuotedStr(Dados_Form.Cai_Data)+',');
         SQL.Add(IntToStr(Dados_Form.Cai_CodigoNota)+')');
         ExecSQL;
         Commit;
       End;
End;

// Operacoes Contas a Receber
Function Retorna_Contas_Receber(Condicao:String) : Contas_Receber;
Var
  I : Integer;
Begin
  With DM.qryContasReceber Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From ContasReceber');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem?ria
       First;
       if DM.qryContasReceber.RecordCount > 0
         then Begin
                for I := 1 to DM.qryContasReceber.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryContasReceber['Cr_Codigo'] <> Null
                    then Result[I-1].Cr_Codigo := DM.qryContasReceber['Cr_Codigo']
                    else Result[I-1].Cr_Codigo := -1;
                  if DM.qryContasReceber['Cr_CodigoCliente'] <> Null
                    then Result[I-1].Cr_CodigoCliente := DM.qryContasReceber['Cr_CodigoCliente']
                    else Result[I-1].Cr_CodigoCliente := -1;
                  if DM.qryContasReceber['Cr_Descricao'] <> Null
                    then Result[I-1].Cr_Descricao := DM.qryContasReceber['Cr_Descricao']
                    else Result[I-1].Cr_Descricao := '';
                  if DM.qryContasReceber['Cr_Valor'] <> Null
                    then Result[I-1].Cr_Valor := DM.qryContasReceber['Cr_Valor']
                    else Result[I-1].Cr_Valor := '';
                  if DM.qryContasReceber['Cr_Data'] <> Null
                    then Result[I-1].Cr_Data := DM.qryContasReceber['Cr_Data']
                    else Result[I-1].Cr_Data := '';
                  if DM.qryContasReceber['Cr_CodigoNota'] <> Null
                    then Result[I-1].Cr_CodigoNota := DM.qryContasReceber['Cr_CodigoNota']
                    else Result[I-1].Cr_CodigoNota := -1;
                  Next;
                End;
              End;
     End;
end;

Function Retorna_Proximo_Codigo_ContaReceber : String;
begin
 With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Cr_Codigo');
        SQL.Add('From ContasReceber');
        SQL.Add('Order By Cr_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Cr_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Cr_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
end;

Procedure Grava_Dados_ContaReceber(Dados_Form : Dados_ContasReceber);
Begin
    With DM.qryContasReceber Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Insert Into ContasReceber Values(');
         SQL.Add(IntToStr(Dados_Form.Cr_Codigo)+',');
         SQL.Add(IntToStr(Dados_Form.Cr_CodigoCliente)+',');
         SQL.Add(QuotedStr(Dados_Form.Cr_Descricao)+',');
         SQL.Add(QuotedStr(Dados_Form.Cr_Valor)+',');
         SQL.Add(QuotedStr(Dados_Form.Cr_Data)+',');
         SQL.Add(IntToStr(Dados_Form.Cr_CodigoNota)+')');
         ExecSQL;
         Commit;
       End;
End;

// Operacoes Contas a Pagar
Function Retorna_Contas_Pagar(Condicao:String) : Contas_Pagar;
Var
  I : Integer;
Begin
  With DM.qryContasPagar Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From ContasPagar');
       SQL.Add(Condicao);
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem?ria
       First;
       if DM.qryContasPagar.RecordCount > 0
         then Begin
                for I := 1 to DM.qryContasPagar.RecordCount Do
                Begin
                  SetLength(Result,Length(Result)+1);
                  if DM.qryContasPagar['Cp_Codigo'] <> Null
                    then Result[I-1].Cp_Codigo := DM.qryContasPagar['Cp_Codigo']
                    else Result[I-1].Cp_Codigo := -1;
                  if DM.qryContasPagar['Cp_CodigoFornecedor'] <> Null
                    then Result[I-1].Cp_CodigoFornecedor := DM.qryContasPagar['Cp_CodigoFornecedor']
                    else Result[I-1].Cp_CodigoFornecedor := -1;
                  if DM.qryContasPagar['Cp_Descricao'] <> Null
                    then Result[I-1].Cp_Descricao := DM.qryContasPagar['Cp_Descricao']
                    else Result[I-1].Cp_Descricao := '';
                  if DM.qryContasPagar['Cp_Valor'] <> Null
                    then Result[I-1].Cp_Valor := DM.qryContasPagar['Cp_Valor']
                    else Result[I-1].Cp_Valor := '';
                  if DM.qryContasPagar['Cp_Data'] <> Null
                    then Result[I-1].Cp_Data := DM.qryContasPagar['Cp_Data']
                    else Result[I-1].Cp_Data := '';
                  if DM.qryContasPagar['Cp_CodigoNota'] <> Null
                    then Result[I-1].Cp_CodigoNota := DM.qryContasPagar['Cp_CodigoNota']
                    else Result[I-1].Cp_CodigoNota := -1;
                  Next;
                End;
              End;
     End;
end;

Function Retorna_Proximo_Codigo_ContaPagar : String;
begin
 With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Cp_Codigo');
        SQL.Add('From ContasPagar');
        SQL.Add('Order By Cp_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Cp_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Cp_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
end;

Procedure Grava_Dados_ContaPagar(Dados_Form : Dados_ContasPagar);
Begin
    With DM.qryContasPagar Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Insert Into ContasPagar Values(');
         SQL.Add(IntToStr(Dados_Form.Cp_Codigo)+',');
         SQL.Add(IntToStr(Dados_Form.Cp_CodigoFornecedor)+',');
         SQL.Add(QuotedStr(Dados_Form.Cp_Descricao)+',');
         SQL.Add(QuotedStr(Dados_Form.Cp_Valor)+',');
         SQL.Add(QuotedStr(Dados_Form.Cp_Data)+',');
         SQL.Add(IntToStr(Dados_Form.Cp_CodigoNota)+')');
         ExecSQL;
         Commit;
       End;
End;

// Funcoes Nota Fiscal
Function Retorna_Proximo_Codigo_NotaVenda : String;
begin
  With DM.qryAux Do
      Begin
        SQL.Clear;
        SQL.Add('Select First 1 Nv_Codigo');
        SQL.Add('From NotaVenda');
        SQL.Add('Order By Nv_Codigo Desc');
        Open;
        FetchAll;
        if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Nv_Codigo'] <> Null))
          then Begin
                 Result := IntToStr(DM.qryAux['Nv_Codigo'] + 1);
               End
          Else Begin
                 Result := '1';
               End;
      End;
end;
Function Retorna_NotasVenda(Condicao:String) : Notas_Venda;
begin

end;
Function Retorna_NotaVenda(Codigo:Integer): Dados_NotaVenda;
Var
  I : Integer;
Begin
  With DM.qryNotaVenda Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From NotaVenda');
       SQL.Add('Where Nv_Codigo = '+IntToStr(Codigo));
//       ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem?ria
       First;
       if DM.qryNotaVenda.RecordCount > 0
         then Begin
                for I := 1 to DM.qryNotaVenda.RecordCount Do
                Begin
                  if DM.qryNotaVenda['Nv_Codigo'] <> Null
                    then Result.Nv_Codigo := DM.qryNotaVenda['Nv_Codigo']
                    else Result.Nv_Codigo := -1;
                  if DM.qryNotaVenda['Nv_CodigoCliente'] <> Null
                    then Result.Nv_CodigoCliente := DM.qryNotaVenda['Nv_CodigoCliente']
                    else Result.Nv_CodigoCliente := -1;
                  if DM.qryNotaVenda['Nv_ProdutosVendidos'] <> Null
                    then Result.Nv_ProdutosVendidos := DM.qryNotaVenda['Nv_ProdutosVendidos']
                    else Result.Nv_ProdutosVendidos := '';
                  if DM.qryNotaVenda['Nv_Data'] <> Null
                    then Result.Nv_Data := DM.qryNotaVenda['Nv_Data']
                    else Result.Nv_Data := '';
                  if DM.qryNotaVenda['Nv_ValorTotal'] <> Null
                    then Result.Nv_ValorTotal := DM.qryNotaVenda['Nv_ValorTotal']
                    else Result.Nv_ValorTotal := '';
                  Next;
                End;
              End;
     End;

end;
Procedure Grava_Dados_NotaVenda(Dados_Form : Dados_NotaVenda);
begin
 With DM.qryNotaVenda Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Insert Into NotaVenda Values(');
         SQL.Add(IntToStr(Dados_Form.Nv_Codigo)+',');
         SQL.Add(IntToStr(Dados_Form.Nv_CodigoCliente)+',');
         SQL.Add(QuotedStr(Dados_Form.Nv_ProdutosVendidos)+',');
         SQL.Add(QuotedStr(Dados_Form.Nv_Data)+',');
         SQL.Add(QuotedStr(Dados_Form.Nv_ValorTotal)+')');
         ExecSQL;
         Commit;
       End;
end;
Function Retorna_Proximo_Codigo_NotaCompra : String;
begin
     With DM.qryAux Do
        Begin
          SQL.Clear;
          SQL.Add('Select First 1 Nc_Codigo');
          SQL.Add('From NotaCompra');
          SQL.Add('Order By Nc_Codigo Desc');
          Open;
          FetchAll;
          if ((DM.qryAux.RecordCount > 0) And (DM.qryAux['Nc_Codigo'] <> Null))
            then Begin
                   Result := IntToStr(DM.qryAux['Nc_Codigo'] + 1);
                 End
            Else Begin
                   Result := '1';
                 End;
        End;
end;
Function Retorna_NotasCompra(Condicao:String) : Notas_Compra;
begin

end;
Function Retorna_NotaCompra(Codigo:Integer): Dados_NotaCompra;
Var
  I : Integer;
begin

  With DM.qryNotaCompra Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('Select * From NotaCompra');
       SQL.Add('Where Nc_Codigo = '+IntToStr(Codigo));
//       ExecSQL;
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem?ria
       First;
       if DM.qryNotaCompra.RecordCount > 0
         then Begin
                for I := 1 to DM.qryNotaCompra.RecordCount Do
                Begin
                  if DM.qryNotaCompra['Nc_Codigo'] <> Null
                    then Result.Nc_Codigo := DM.qryNotaCompra['Nc_Codigo']
                    else Result.Nc_Codigo := -1;
                  if DM.qryNotaCompra['Nc_CodigoFornecedor'] <> Null
                    then Result.Nc_CodigoFornecedor := DM.qryNotaCompra['Nc_CodigoFornecedor']
                    else Result.Nc_CodigoFornecedor := -1;
                  if DM.qryNotaCompra['Nc_ProdutosComprados'] <> Null
                    then Result.Nc_ProdutosComprados := DM.qryNotaCompra['Nc_ProdutosComprados']
                    else Result.Nc_ProdutosComprados := '';
                  if DM.qryNotaCompra['Nc_Data'] <> Null
                    then Result.Nc_Data := DM.qryNotaCompra['Nc_Data']
                    else Result.Nc_Data := '';
                  if DM.qryNotaCompra['Nc_ValorTotal'] <> Null
                    then Result.Nc_ValorTotal := DM.qryNotaCompra['Nc_ValorTotal']
                    else Result.Nc_ValorTotal := '';
                  if DM.qryNotaCompra['Nc_Frete'] <> Null
                    then Result.Nc_Frete := DM.qryNotaCompra['Nc_Frete']
                    else Result.Nc_Frete := '';
                  if DM.qryNotaCompra['Nc_Imposto'] <> Null
                    then Result.Nc_Imposto := DM.qryNotaCompra['Nc_Imposto']
                    else Result.Nc_Imposto := '';
                  Next;
                End;
              End;
     End;

end;
Procedure Grava_Dados_NotaCompra(Dados_Form : Dados_NotaCompra);
begin
  With DM.qryNotaCompra Do
       Begin
         Close;
         SQL.Clear;
         SQL.Add('Insert Into NotaCompra Values(');
         SQL.Add(IntToStr(Dados_Form.Nc_Codigo)+',');
         SQL.Add(IntToStr(Dados_Form.Nc_CodigoFornecedor)+',');
         SQL.Add(QuotedStr(Dados_Form.Nc_ProdutosComprados)+',');
         SQL.Add(QuotedStr(Dados_Form.Nc_Data)+',');
         SQL.Add(QuotedStr(Dados_Form.Nc_ValorTotal)+',');
         SQL.Add(QuotedStr(Dados_Form.Nc_Frete)+',');
         SQL.Add(QuotedStr(Dados_Form.Nc_Imposto)+')');
         ExecSQL;
         Commit;
       End;
end;

end.
