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
          <input type="text" class="form-control" name="NomeHotel" placeholder="Nome" value="" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CNPJ</label>
          <input type="text" class="form-control MaskCNPJ" id="CNPJ" name="CNPJ" placeholder="" value="" >
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Telefone</label>
          <input type="text" class="form-control MaskFone" name="TelefoneHotel" placeholder="(DD)Xxxxxxxxx" value="" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Endereço</label>
          <input type="text" class="form-control" id="Endereco" name="EnderecoHotel" placeholder="Ex.: Rua Marte, nº 2" value="" >
        </div>
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdHotel" value="<%=Request("IdHotel")%>">
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