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

<!--#INCLUDE file="Admin/MenuAdmin.asp" -->

<div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
    <h2>Dados</h2>
  </div>
  <div class="card-body">
  

<%	  
SqlSelecionado = "Select * from Cliente as f where f.IdUsuario = " & Session("IdUsuario")
		Set rsCliente = server.CreateObject("ADODB.RECORDSET")
		rsCliente.open SqlSelecionado, conn
			
SqlSelecionado2 = "Select * from Usuario as f where f.IdUsuario = " & Session("IdUsuario")
		Set rsUsuario = server.CreateObject("ADODB.RECORDSET")
		rsUsuario.open SqlSelecionado2, conn

SqlAlter = "update Cliente set NomeCliente = '" &_
					Request("NomeCliente") 		& "', CPFCliente = '" &_ 
					Request("CPFCliente") 		& "', CelularCliente = '" &_
					Request("CelularCliente") 	& "', EmailCliente = '" &_
					Request("EmailCliente") 	& "' where IdUsuario = " &_
					Session("IdUsuario") 		&_
					"update Usuario set Senha = '" & Request("Senha")		 &_
					"' where idUsuario = " & Session("idUsuario")

		Conn.execute SqlAlter

		If Err.Number <> 0 Then
			ClienteAlterado = "N"
		Else
			ClienteAlterado = "S"
		End If
  %>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
		<div class="form-row">
			<div class="col-md-4 mb-3">
			  <label for="validationDefault01">Nome</label>
			  <input type="text" class="form-control" name="NomeCliente" value="<%=rsCliente("NomeCliente")%>" >
			</div>
			<div class="col-md-4 mb-3">
			  <label for="">CPF</label>
			  <input type="text" class="form-control MaskCPF" id="CPF" name="CPFCliente" value="<%=rsCliente("CPFCliente")%>" >
			</div>
			 <div class="col-md-4 mb-3">
			  <label for="validationDefault02">Celular</label>
			  <input type="text" class="form-control MaskFone" name="CelularCliente" value="<%=rsCliente("CelularCliente")%>" >
			</div>
		</div>
    	<div class="form-row">
        
			<div class="col-md-4 mb-3">
				<label for="validationDefault02">Email</label>
				<input type="text" class="form-control" name="EmailCliente" value="<%=rsCliente("EmailCliente")%>" >
			</div>
            <div class="col-md-4 mb-3">
				<label for="validationDefault02">Senha</label>
				<input type="password" class="form-control" name="SenhaCliente" value="<%=rsUsuario("Senha")%>">
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