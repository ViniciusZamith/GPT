<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
<<<<<<< HEAD
	If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
    <h2>Dados Guia</h2>
  </div>
  <div class="card-body">
    <%
  SqlSelecionado = "Select * from Funcionario as f where f.IdFuncionario = " & Request("IdFuncionario")
			Set rsGuia = server.CreateObject("ADODB.RECORDSET")
			rsGuia.open SqlSelecionado, conn
  %>
    <form action="guia.asp" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomeFuncionario" placeholder="Nome" value="<%=rsGuia("NomeFuncionario")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Data de Nascimento</label>
          <input type="date" class="form-control" name="DataNascimento" value="<%=rsGuia("DataNascimento")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CPF</label>
          <input type="text" class="form-control" id="CPF" name="CPF" placeholder="999.999.999-99	" value="<%=rsGuia("CPF")%>" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Telefone</label>
          <input type="text" class="form-control" name="Telefone" placeholder="(DD)Xxxxxxxxx" value="<%=rsGuia("Telefone")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control" name="Celular" placeholder="Celular" value="<%=rsGuia("Celular")%>" required>
        </div>
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdFuncionario" value="<%=rsGuia("IdFuncionario")%>">
        <input type="hidden" name="Action" value="Alterar">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
  </div>
</div>
</body>
</html>