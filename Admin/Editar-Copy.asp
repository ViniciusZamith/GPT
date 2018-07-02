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
    <h2>Dados Veículo</h2>
  </div>
  <div class="card-body">
    <%
  SqlSelecionado = "Select * from Veiculo where IdVeiculo = " & Request("IdVeiculo")
			Set rsVeiculo = server.CreateObject("ADODB.RECORDSET")
			rsVeiculo.open SqlSelecionado, conn
  %>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Placa</label>
          <input type="text" class="form-control" name="Placa" placeholder="Placa" value="<%=rsVeiculo("Placa")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Ano</label>
          <input type="text" class="form-control" name="AnoVeiculo" value="<%=rsVeiculo("AnoVeiculo")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Modelo</label>
          <input type="date" class="form-control"  name="Modelo" value="<%=rsVeiculo("Modelo")%>" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault02">Marca</label>
          <input type="date" class="form-control"  name="Marca" value="<%=rsVeiculo("Marca")%>" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault02">Tipo</label>
          <input type="date" class="form-control"  name="TipoVeiculo" value="<%=rsVeiculo("TipoVeiculo")%>" required>
        </div>
      </div>
      <div class="form-row">
		<div class="col-md-4 mb-3">
          <label for="validationDefault02">Lotação Mínima</label>
          <input type="text" class="form-control" name="LotacaoMin" value="<%=rsVeiculo("LotacaoMin")%>">
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Lotação Máxima</label>
          <input type="text" class="form-control" name="LotacaoMax" value="<%=rsVeiculo("LotacaoMax")%>" required>
        </div>
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdVeiculo" value="<%=rsVeiculo("IdVeiculo")%>">
        <input type="hidden" name="Action" value="Alterar">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
	<form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    <button class="btn btn-warning ml-1 float-left" type="submit">Cancelar</button>
	</form>
  </div>
</div>
</body>
</html>