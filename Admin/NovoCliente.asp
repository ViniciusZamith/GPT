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
          <input type="text" class="form-control" name="NomeCliente" placeholder="Nome" value="" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CPF</label>
          <input type="text" class="form-control MaskCPF" id="CPF" name="CPFCliente" placeholder="CPF" value="" >
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Celular</label>
          <input type="text" class="form-control MaskFone" name="CelularCliente" placeholder="(DD)Xxxxxxxxx" value="" >
        </div>
        <div class="col-md-8 mb-3">
			<label for="validationDefault04">E-mail</label>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">@</span>
				</div>
				<input type="text" class="form-control" name="EmailCliente" placeholder="seuemail@email.com" value="" >
			</div>
        </div>
            
        <input type="hidden" name="IdCliente" value="<%=Request("IdCliente")%>">
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