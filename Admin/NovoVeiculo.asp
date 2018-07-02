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
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Placa</label>
          <input type="text" class="form-control" name="Placa" placeholder="AAA-9999" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Ano</label>
          <input type="text" class="form-control" name="AnoVeiculo" placeholder="2018" value="" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault01">Modelo</label>
          <input type="text" class="form-control" name="Modelo" placeholder="Gol" value="" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault02">Marca</label>
          <input type="text" class="form-control" name="Marca" placeholder="Volkswagen" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Tipo</label>
          <input type="text" class="form-control" name="TipoVeiculo" placeholder="Ônibus" value="" required>
        </div>
	  </div>	
	  <div class="form-row">
         <div class="col-md-4 mb-3">
           <label for="validationDefault04">Lotação Mínima</label>
           <input type="text" class="form-control" name="LotacaoMin" placeholder="2" value="">
         </div>
		 <div class="col-md-4 mb-3">
           <label for="validationDefault04">Lotação Máxima</label>
           <input type="text" class="form-control" name="LotacaoMax" placeholder="200" value="" required>
         </div>
	     <div class="col-md-4 mb-3"></div>
      <div class="form-row">
          <input type="hidden" name="Action" value="Create">
    	  <button class="btn btn-primary" type="submit">Salvar</button>
	  </div>
    </form>
	<div class="form-row">
      <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
        <button class="btn btn-warning ml-3" type="submit">Cancelar</button>
      </form>
	</div>		  
  </div>
</div>
</body>
</html>
