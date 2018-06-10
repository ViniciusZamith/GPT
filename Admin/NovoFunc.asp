<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
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
    <h2>Dados </h2>
  </div>
  <div class="card-body">
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomeFuncionario" placeholder="Nome" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Data de Nascimento</label>
          <input type="date" class="form-control" name="DataNascimento" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CPF</label>
          <input type="text" class="form-control" id="CPF" name="CPF" placeholder="999.999.999-99" value="" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Telefone</label>
          <input type="text" class="form-control" name="Telefone" placeholder="(00)00000000" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control" name="Celular" placeholder="(00)900000000" value="" required>
        </div>
        <div class="col-md-4 mb-3"></div>
        
        <input type="hidden" name="IdTipoFuncionario" value=<%=Request("IdTipoFuncionario")%>>    
        <input type="hidden" name="Action" value="Create">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
  </div>
</div>
</body>
</html>