<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="Includes/Connect.asp" -->

<%
If Session("ID") <> Session.SessionID then Response.Redirect("index.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Set rsPasseio = server.CreateObject("ADODB.RECORDSET")

SqlLista = "Select * from Passeio where IdPasseio = " & Request("IdPasseio")
rsPasseio.open SqlLista, conn
%>
<!DOCTYPE html>

<head>
<!--#INCLUDE file="Includes/Head.asp" -->
</head>

<body>
<!--#INCLUDE file="MenuNavegacao.asp" -->

<div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
    <h1><%=rsPasseio("NomePasseio")%></h1>
  </div>
  <div class="card-body">
	<form action="Reserva.asp" method="post">
    <input type="hidden" name="Action" value="Reserva">
    <label for="validationDefault08">Número de Adultos</label>
		  <select class="form-control" name="QtdAdt" required>
        	<option value="1"  selected > 1 </option>
            <option value="2" > 2 </option>
            <option value="3" > 3 </option>
            <option value="4" > 4 </option>
            <option value="5" > 5 </option>
           </select>
	<label for="validationDefault08">Número de Crianças</label>
		  <select class="form-control" name="QtdCri" required>
            <option value="0" selected > 0 </option>
        	<option value="1" > 1 </option>
            <option value="2" > 2 </option>
            <option value="3" > 3 </option>
            <option value="4" > 4 </option>
           </select>
     <br />      
     
		<input type="hidden" name="IdPasseio" value="<%=rsPasseio("IdPasseio")%>">
    <input type="hidden" name="PrecoCri" value="<%=rsPasseio("PrecoCri")%>">
    <input type="hidden" name="PrecoAdt" value="<%=rsPasseio("PrecoAdt")%>">
		<button class="btn btn-success" type="submit">Reservar</button>
	</form>
  </div>
</div>
</body>
</html>
<%
	rsPasseio.Close
	Set rsPasseio = Nothing

	Conn.close
	Set Conn = nothing
%>