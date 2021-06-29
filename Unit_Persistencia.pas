unit Unit_Persistencia;

interface

uses Unit_DM, Vcl.Dialogs, System.SysUtils, System.Variants;

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
  Function Retorna_Proximo_Codigo:String;
//  Function Retorna_Dados_Cliente(Codigo : Integer) : Dados_Cliente;
  Function Retorna_Clientes_Cadastrados(Condicao:String) : Clientes_Cadastrados;
//  Function Executa_Conexao:Boolean;
//  Function Encerra_Conexao:Boolean;

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
       Open;
       FetchAll; //garante que todos os resultados vieram pra mem�ria
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

end.
