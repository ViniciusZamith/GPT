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
	
	
<div class="container mt-3">
        <h3 class="bg-light text-center">Lista de Roteiros</h3>
<br />
	<div class="card-columns">
<% 		
   	Set rsRoteiro = server.CreateObject("ADODB.RECORDSET")
   
	SqlLista = "Select * from Roteiro"
	rsRoteiro.open SqlLista, conn
   
	if not (rsRoteiro.bof and rsRoteiro.eof) then
	do while not rsRoteiro.eof

   			Set rsUF = Conn.Execute("Select * from UF where Estado = 'Rio de Janeiro'")
			UF = rsUF("UF")
			rsUF.Close
			Set rsUF = Nothing																				 
%>
	<div class="card" style="width: 22rem">
		<div class="card-body">
			<strong class="card-text"><%=UF %></strong>
			<h5 class="card-title"><%=rsRoteiro("NomeRoteiro") %></h5>
			<p class="card-text"><%=rsRoteiro("CaminhoRoteiro") %></p>
			<p class="card-text"><small class="text-muted">Duração: <%=rsRoteiro("tempoRoteiro") %> minutos</small></p>
		</div>
	</div>
<%
			rsRoteiro.moveNext
			loop
		
	end if
%>
	</div>
<br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
