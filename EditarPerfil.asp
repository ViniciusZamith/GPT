<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="Includes/Connect.asp" -->

<%
	If Session("TipoUsuario") <> 2 then Response.Redirect("acessonegado.asp")
	Set Conn = Server.CreateObject("ADODB.Connection") 
	Conn.Open(StrConexao)
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
    <h2>Dados</h2>
  </div>
  <div class="card-body">
<%
	Set rsCliente = server.CreateObject("ADODB.RECORDSET")

	SqlSelecionado = "Select * from Cliente where idUsuario = " & Session("IdUsuario")
	rsCliente.open SqlSelecionado, conn		
%>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
		<div class="form-row">
			<div class="col-md-4 mb-3">
			  <label for="validationDefault01">Nome</label>
			  <input type="text" class="form-control" name="NomeCliente" placeholder="Nome" value="<%=rsCliente("NomeCliente")%>" >
			</div>
			<div class="col-md-4 mb-3">
			  <label for="">CPFCliente</label>
			  <input type="text" class="form-control MaskCPF" id="CPF" name="CPFCliente" value="<%=rsCliente("CPFCliente")%>" >
			</div>
			 <div class="col-md-4 mb-3">
			  <label for="validationDefault02">Celular</label>
			  <input type="text" class="form-control MaskFone" name="CelularCliente" placeholder="(DD)Xxxxx-xxxx" value="<%=rsCliente("CelularCliente")%>" >
			</div>
		</div>
    	<div class="form-row">
        
			<div class="col-md-8 mb-3">
				<label for="validationDefault02">Email</label>
				<input type="text" class="form-control" name="EmailCliente" placeholder="" value="<%=rsCliente("EmailCliente")%>" >
			</div>
			<div class="col-md-4 mb-3"></div>

			<input type="hidden" name="IdCliente" value="<%=rsCliente("IdCliente")%>">
			<input type="hidden" name="Action" value="Alterar">
			<button class="btn btn-primary float-left" type="submit">Salvar</button>
    </form>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    <button class="btn btn-warning ml-1 float-left" type="submit">Cancelar</button>
    </form>
  </div>
</div>
</body>
</html>