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
        <h3 class="bg-light text-center">Lista de Passeios</h3>
<br />
	<div class="card-columns">
<% 		
   	Set rsPasseio = server.CreateObject("ADODB.RECORDSET")
   
	SqlLista = "Select * from Passeio"
	rsPasseio.open SqlLista, conn
   
	if not (rsPasseio.bof and rsPasseio.eof) then
		do while not rsPasseio.eof
			Set rsTipo = Conn.Execute("Select * from TipoPasseio where IdTipo = " & rsPasseio("IdTipoPasseio"))
			DescTipo = rsTipo("DescricaoTipo")
			rsTipo.Close
			Set rsTipo = Nothing

   			Set rsUF = Conn.Execute("Select * from UF where UF = '" & rsPasseio("UF") & "';")
			UF = rsUF("UF")
			rsUF.Close
			Set rsUF = Nothing																				 
%>
	<div class="card" style="width: 22rem">
		<img class="card-img-top" src="<%=rsPasseio("Img")%>" alt="<%=rsPasseio("NomePasseio") %>" />
		<div class="card-body">
			<strong class="card-text"><%=UF %>, <%=rsPasseio("Pais") %></strong>
			<h5 class="card-title"><%=rsPasseio("NomePasseio") %></h5>
			<p class="card-text"><%=rsPasseio("DescricaoPasseio") %></p>
			<p class="card-text"><small class="text-warning">
				<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></small></p>
			<p class="card-text"><small class="text-muted"><%=rsPasseio("DataPasseio") %></small></p>
		</div>
		<div class="card-footer text-danger">
			<p class="card-text text-muted"><small>A partir de:</small></p>
      		<p class="card-text">R$20,00</p>
			<form action="Passeio.asp" method="post">
				<input type="hidden" name="IdPasseio" value="<%=rsPasseio("IdPasseio")%>">
				<input type="hidden" name="Action" value="Reservar">
				<button type="submit" class="btn btn-primary btn-sm" id="botao">
					<i class="fa fa-edit"></i>&nbsp;Reservar
				</button>
            </form>
    	</div>
	</div>
<%
			rsPasseio.moveNext
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
