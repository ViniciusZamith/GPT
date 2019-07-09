<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("TipoUsuario") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Cliente where idCliente = " & Request("IdCliente")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			ClienteExcluido = "N"
		Else
			ClienteExcluido = "S"
		End If
		
	Case "Alterar"
	
		SqlAlter = "update Cliente set NomeCliente = '" &_
					Request("NomeCliente") 		& "', DataNascimento = '" &_
					Request("DataNascimento") 	& "', CPFCliente = '" &_ 
					Request("CPFCliente") 		& "', CelularCliente = '" &_
					Request("CelularCliente") 	& "', EmailCliente = '" &_
					Request("EmailCliente") 	& "' where IdCliente = " &_
					Request("IdCliente")

		Conn.execute SqlAlter

		If Err.Number <> 0 Then
			ClienteAlterado = "N"
		Else
			ClienteAlterado = "S"
		End If
	
	Case "Create"
	
		SqlCreate = "INSERT INTO [Cliente] " 	&_
					"([NomeCliente]" 			&_
					",[DataNascimento]" 		&_
					",[CPFCliente]" 			&_
					",[CelularCliente]" 		&_
					",[EmailCliente])" 			&_
		" VALUES " &_ 
				"('" & Request("NomeCliente") 		& "', "  	&_	
				"'" & Request("DataNascimento") 	& "', " 	&_ 
				"'"	& Request("CPFCliente") 		& "', "  	&_ 
				"'" & Request("CelularCliente") 	& "', "  	&_
				"'" & Request("EmailCliente") 		& "')"

		'Response.Write("<br>SqlCreate: " & SqlCreate)
		Conn.execute SqlCreate

		If Err.Number <> 0 Then
			ClienteCriado = "N"
		Else
			ClienteCriado = "S"
		End If
	
	Case "Busca"
	
	set rsCliente = server.CreateObject("ADODB.RECORDSET")
	
		SqlBusca = "Select * from Cliente where NomeCliente like '%%'"
	
		if Request("Nome") <> "" then
			SqlBusca = SqlBusca & " AND NomeCliente like '%" & Request("Nome") & "%'"
		end if
		if Request("Nascimento") <> "" then
			SqlBusca = SqlBusca & " AND DataNascimento like '%" & Request("Nascimento") & "%'"
		end if
		if Request("CPF") <> "" then
			SqlBusca = SqlBusca & " AND CPFCliente like '%" & Request("CPF") & "%'"
		end if
		
		'Response.Write("<br>SqlBusca: " & SqlBusca)
		rsCliente.open SqlBusca, conn
	
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
  <h1>Clientes</h1>
</div>
<div class="card-body">
<!-- Busca -->

<% If ClienteExcluido="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Cliente excluido com sucesso
</div>
<% End If %>

<% If ClienteExcluido="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao excluir Cliente.
</div>
<% End If %>

<% If ClienteAlterado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Cliente alterado com sucesso
</div>
<% End If %>

<% If ClienteAlterado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao alterar Cliente.
</div>
<% End If %>

<% If ClienteCriado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Cliente adicionado com sucesso
</div>
<% End If %>

<% If ClienteCriado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao adicionar Cliente.
</div>
<% End If %>

<h3>Buscar Cliente</h3>
<br />
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" name="Busca" id="buscaCliente">
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

<h3>Lista de Clientes</h3>
<br />
<table class="table table-bordered table-hover table-responsive-sm">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">Data de Nascimento</th>
    <th class="align-middle text-center">CPF</th>
    <th class="align-middle text-center">Celular</th>
    <th class="align-middle text-center">Email</th>
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"><form action="novoCliente.asp" method="post">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      </form></th>
  </tr>
</thead>
<tbody>
  <%		  
  			
  			
  			if (Request("Action")<>"Busca") then
			
				Set rsCliente = server.CreateObject("ADODB.RECORDSET")

				SqlLista = "Select * from Cliente"

				rsCliente.open SqlLista, conn
			
			end if
			
			if not (rsCliente.bof and rsCliente.eof) then
			do while not rsCliente.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsCliente("NomeCliente") %></small></td>
    <td class="align-middle text-center"><small><%=rsCliente("DataNascimento") %></td>
    <td class="align-middle text-center"><small><%=rsCliente("CPFCliente") %></td>
    <td class="align-middle text-center"><small><%=rsCliente("CelularCliente") %></td>
    <td class="align-middle text-center"><small><%=rsCliente("EmailCliente") %></td>
    <td class="align-middle text-center"><form action="editarCliente.asp" method="post">
        <input type="hidden" name="IdCliente" value="<%=rsCliente("IdCliente")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="fa fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="IdCliente" value="<%=rsCliente("IdCliente")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="fa fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsCliente.moveNext
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
rsCliente.Close
Set rsCliente = Nothing

Conn.close
Set Conn = nothing
%>