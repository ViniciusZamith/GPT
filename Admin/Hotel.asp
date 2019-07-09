<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("TipoUsuario") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Hotel where IdHotel = " & Request("IdHotel")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			HotelExcluido = "N"
		Else
			HotelExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Hotel set NomeHotel = '" & Request("NomeHotel") & "', CNPJ = '" & Request("CNPJ") & "', " &_
			   "EnderecoHotel = '" & Request("EnderecoHotel") & "', TelefoneHotel = '" & Request("TelefoneHotel") & "' " &_ 
			   "where IdHotel = " & Request("IdHotel")																				 
	
																													  
	Response.Write("<br>SqlAlter	: " & SqlAlter)																												  
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		HotelAlterado = "N"
	Else
		HotelAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [Hotel] " &_
           "([NomeHotel]" &_
           ",[CNPJ]" &_
		   ",[EnderecoHotel]" &_
		   ",[TelefoneHotel])" &_
    "VALUES" &_
           "('" & Request("NomeHotel") & "', "  &_	
				"'" & Request("CNPJ") & "', "  &_
				"'" & Request("EnderecoHotel") & "', "  &_
				"'" & Request("TelefoneHotel") & "'	)"   
	
	'Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		HotelCriado = "N"
	Else
		HotelCriado = "S"
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
  <h1>Hotel</h1>
</div>
<div class="card-body">
<!-- Busca -->

<% If HotelExcluido="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel excluido com sucesso
</div>
<% End If %>

<% If HotelExcluido="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao excluir hotel.
</div>
<% End If %>

<% If HotelAlterado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel alterado com sucesso
</div>
<% End If %>

<% If HotelAlterado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao alterar hotel.
</div>
<% End If %>

<% If HotelCriado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel adicionado com sucesso
</div>
<% End If %>

<% If HotelCriado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao adicionar hotel.
</div>
<% End If %>

<h3>Buscar Hotel</h3>
<br />
	<form method="post" action="/admin/Hotel.asp" name="Busca" id="buscaFuncionario">
  <input type="hidden" name="Action" id="IdAction" value="Busca">
  <div class="form-row">
    <div class="form-group col-8">
      <label for="IdNome">Nome</label>
      <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
    </div>

    <div class="form-group col-4">
      <label for="IdCNPJ">CNPJ</label>
      <input name="CNPJ" type="text" class="form-control text-center MaskCNPJ" id="CNPJ" placeholder="00.000.000/0000-00" maxlength="17" value="">
    </div>

    <div class="form-group col text-right">
      <hr>
      <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
      <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
    </div>
  </div>
</form>

<!-- Table -->

<h3>Lista de Hoteis</h3>
<br />
<table class="table table-bordered table-hover table-responsive">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">CNPJ</th>
	<th class="align-middle text-center">Endereço</th>
	<th class="align-middle text-center">Telefone</th>
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"><form action="novoHotel.asp" method="post">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      </form></th>
  </tr>
</thead>
<tbody>
  <%		  
  			Set rsHotel = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
			sqlSearch = "Select * from Hotel where NomeHotel like '%" & Request("Nome") & "%'" &_ 
			"AND CNPJ like '%" & Request("CNPJ") & "%'"
	 
			'Response.Write("<br>SqlCreate: " & SqlSearch)
			
			rsHotel.open SqlSearch, conn
			
			else
			
    		SqlLista = "Select * from Hotel"
			rsHotel.open SqlLista, conn
			
			end if
			
			if not (rsHotel.bof and rsHotel.eof) then
			do while not rsHotel.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsHotel("NomeHotel") %></small></td>
    <td class="align-middle text-center"><small><%=rsHotel("CNPJ") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("EnderecoHotel") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("TelefoneHotel") %></td>
    <td class="align-middle text-center"><form action="editarHotel.asp" method="post">
        <input type="hidden" name="IdHotel" value="<%=rsHotel("IdHotel")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="fa fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="IdHotel" value="<%=rsHotel("IdHotel")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="fa fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsHotel.moveNext
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
rsHotel.Close
Set rsHotel = Nothing

Conn.close
Set Conn = nothing
%>