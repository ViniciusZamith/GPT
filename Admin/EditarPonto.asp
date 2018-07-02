<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
	If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
	Set Conn = Server.CreateObject("ADODB.Connection") 
	Conn.Open(StrConexao)
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
    <h2>Dados Pontos Turísticos</h2>
  </div>
  <div class="card-body">
    <%
  SqlSelecionado = "Select * from PontosTuristicos as f where f.IdPonto = " & Request("IdPonto")
			Set rsPonto = server.CreateObject("ADODB.RECORDSET")
			rsPonto.open SqlSelecionado, conn
  %>
    <form action="PontosTuristicos.asp" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomePonto" placeholder="Nome" value="<%=rsPonto("NomePonto")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Descrição</label>
          <input type="text" class="form-control" name="descricaoPonto" value="<%=rsPonto("descricaoPonto")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Localização</label>
          <input type="text" class="form-control" id="localizacaoPonto" name="localizacaoPonto" " value="<%=rsPonto("localizacaoPonto")%>" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Disponibilidade</label>
          <select class="form-control" name="disponibilidadePonto" id="disponibilidadePonto" >
        	<option value="Manhã">Manhã</option>
        	<option value="Tarde">Tarde</option>
			<option value="Noite">Noite</option>
			<option value="Manhã/Tarde">Manhã/Tarde</option>
			<option value="Manhã/Noite">Manhã/Noite</option>
			<option value="Tarde/Noite">Tarde/Noite</option>
			<option value="Integral">Integral</option>
      	  </select>
        </div>
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdPonto" value="<%=rsPonto("IdPonto")%>">
        <input type="hidden" name="Action" value="Alterar">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
  </div>
</div>
</body>
</html>