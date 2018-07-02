<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Funcionario where idFuncionario = " & Request("IdFuncionario")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			FuncionarioExcluido = "N"
		Else
			FuncionarioExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Funcionario set NomeFuncionario = '" & Request("NomeFuncionario") & "', "  &_	
				"DataNascimento = '" & Request("DataNascimento") & "', CPF = '" & Request("CPF") & "', "  &_ 
				"Telefone = '" & Request("Telefone") & "', Celular = '" & Request("Celular") & "', "  &_ 
				"CNH = '" & Request("CNH") & "', CategoriaCNH = '" & Request("CategoriaCNH") & "', "  &_ 
				"ValidadeCNH = '" & Request("ValidadeCNH") & "' where idFuncionario = " & Request("IdFuncionario") 
				
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		FuncionarioAlterado = "N"
	Else
		FuncionarioAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [Funcionario] " &_
           "([NomeFuncionario]" &_
           ",[DataNascimento]" &_
           ",[CPF]" &_
           ",[Telefone]" &_
           ",[Celular]" &_
           ",[IdTipoFuncionario]" &_
           ",[CNH]" &_
           ",[CategoriaCNH]" &_
           ",[validadeCNH])" &_
    "VALUES" &_
           "('" & Request("NomeFuncionario") & "', "  &_	
				"'" & Request("DataNascimento") & "', '" & Request("CPF") & "', "  &_ 
				"'" & Request("Telefone") & "', '" & Request("Celular") & "', "  &_
				"" & Request("IdTipoFuncionario") & ", " &_ 
				"'" & Request("CNH") & "', '" & Request("CategoriaCNH") & "', "  &_ 
				"'" & Request("ValidadeCNH") & "')"
	
	'Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		FuncionarioCriado = "N"
	Else
		FuncionarioCriado = "S"
	End If
	
End Select
%>

<!DOCTYPE html>

<head>
<!--#INCLUDE file="../Includes/Head.asp" -->
</head>

<body>

<!--#INCLUDE file="../Admin/MenuAdmin.asp" -->

<div class="container mt-3">
<div class="card text-center">
<div class="card-header">
  <h1>Especialistas em Turismo</h1>
</div>
<div class="card-body">
<!-- Busca -->

<% If FuncionarioExcluido="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário excluido com sucesso
</div>
<% End If %>

<% If FuncionarioExcluido="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao excluir funcionário.
</div>
<% End If %>

<% If FuncionarioAlterado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário alterado com sucesso
</div>
<% End If %>

<% If FuncionarioAlterado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao alterar funcionário.
</div>
<% End If %>

<% If FuncionarioCriado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário adicionado com sucesso
</div>
<% End If %>

<% If FuncionarioCriado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao adicionar funcionário.
</div>
<% End If %>

<h3>Buscar Especialista em Turismo</h3>
<br />
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" name="Busca" id="buscaFuncionario">
  <input type="hidden" name="Action" id="IdAction" value="Busca">
  <div class="form-row">
    <div class="form-group col-6">
      <label for="IdNome">Nome</label>
      <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
    </div>
    <div class="form-group col-3">
      <label for="IdNascimento">Nascimento</label>
      <input name="Nascimento" type="date" class="form-control text-center" id="IdNascimento" value="">
    </div>
    <div class="form-group col-3">
      <label for="IdCPF">CPF</label>
      <input name="CPF" type="text" class="form-control text-center" id="CPF" placeholder="000.000.000-00" maxlength="14" value="">
    </div>

    <div class="form-group col text-right">
      <hr>
      <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
      <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
    </div>
  </div>
</form>

<!-- Table -->

<h3>Lista de Especialistas em Turismo</h3>
<br />
<table class="table table-bordered table-hover table-responsive">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">Data de Nascimento</th>
    <th class="align-middle text-center">CPF</th>
    <th class="align-middle text-center">Telefone</th>
    <th class="align-middle text-center">Celular</th>
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"><form action="novofunc.asp" method="post">
        <input type="hidden" name="IdTipoFuncionario" value="2">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      </form></th>
  </tr>
</thead>
<tbody>
  <%		  
  			Set rsFuncionario = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
			sqlSearch = "Select * from Funcionario where NomeFuncionario like '%" & Request("Nome") &_ 
			"%' AND DataNascimento like '%" & Request("Nascimento") & "%' AND CPF like '%" &_ 
			Request("CPF") & "%' AND IdTipoFuncionario = 2" 
			''" AND " & Request("Idioma") & " = NomeIdioma" &_
			'Response.Write("<br>SqlCreate: " & SqlSearch)
			
			rsFuncionario.open SqlSearch, conn
			
			else
			
    		SqlLista = "Select * from Funcionario as f where f.IdTipoFuncionario = 2"
			rsFuncionario.open SqlLista, conn
			
			end if
			
			if not (rsFuncionario.bof and rsFuncionario.eof) then
			do while not rsFuncionario.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsFuncionario("NomeFuncionario") %></small></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("DataNascimento") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("CPF") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("Telefone") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("Celular") %></td>
    <td class="align-middle text-center"><form action="editarfunc.asp" method="post">
        <input type="hidden" name="IdFuncionario" value="<%=rsFuncionario("IdFuncionario")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="IdFuncionario" value="<%=rsFuncionario("IdFuncionario")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsFuncionario.moveNext
			loop
		
		eLSE
		%>
  <tr>
    <td colspan="12" class="align-middle text-center">Nenhum registro encontrado.</td>
  </tr>
  <%
		eND iF
        %>
</tbody>
</div>
</div>
</body>
</html><%
rsFuncionario.Close
Set rsFuncionario = Nothing

Conn.close
Set Conn = nothing
%>