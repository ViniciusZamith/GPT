<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("TipoUsuario") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
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