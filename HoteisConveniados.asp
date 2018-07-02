<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file = "Includes/Head.asp" --> 
</head>

<style>

</style>

<body>

		<!--#INCLUDE file="MenuNavegacao.asp" --> 
        <br />
		<div class="container mt-3">
        <h3>Lista de Hoteis</h3>
<br />
<table class="table table-bordered table-hover table-responsive-sm">
<thead class="bg-secondary text-white">
  <tr>
	<th class="align-middle text-center">Foto</th>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">CNPJ</th>
	<th class="align-middle text-center">Endereço</th>
	<th class="align-middle text-center">Telefone</th>
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
	<td class="align-middle text-center"><small>Foto</th>
    <td class="align-middle text-center"><small><%=rsHotel("NomeHotel") %></small></td>
    <td class="align-middle text-center"><small><%=rsHotel("CNPJ") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("EnderecoHotel") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("TelefoneHotel") %></td>
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
<br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
