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
    <h2>Dados</h2>
  </div>
  <div class="card-body">
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="nomePonto" placeholder="Nome" value="" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Descrição</label>
          <input type="text" class="form-control" id="descricaoPonto" name="descricaoPonto" placeholder="" value="" >
        </div>
		  <div class="col-md-4 mb-3">
          <label for="validationDefault02">Localização</label>
          <input type="text" class="form-control" name="localizacaoPonto" placeholder="" value="" >
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
		  <div class="col-md-4 mb-3"></div>
		  
        <input type="hidden" name="idPonto" value="<%=Request("idPonto")%>">
        <input type="hidden" name="Action" value="Create">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    <button class="btn btn-warning ml-1" type="submit">Cancelar</button>
    </form>
  </div>
</div>
</body>
</html>
