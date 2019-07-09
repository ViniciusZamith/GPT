<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
	If Session("TipoUsuario") <> 1 then Response.Redirect("acessonegado.asp")
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
    <h2>Dados Passeio</h2>
  </div>
  <div class="card-body">
  <%
  SqlSelecionado = "Select * from Passeio where IdPasseio = " & Request("IdPasseio")
			Set rsPasseio = server.CreateObject("ADODB.RECORDSET")
			rsPasseio.open SqlSelecionado, conn
	 
	 		DataErro = rsPasseio("DataPasseio")
			ArrayData = split (DataErro, "/")
			Data = Arraydata(2) & "-" & ArrayData(1) & "-" & ArrayData(0)
  %>	
    <form action="passeio.asp" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomePasseio" value="<%=rsPasseio("NomePasseio")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Descrição</label>
          <input type="text" class="form-control" name="DescricaoPasseio" value="<%=rsPasseio("DescricaoPasseio")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Data</label>
          <input type="date" class="form-control" name="DataPasseio" value="<%=Data%>" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault03">Categoria</label>
          <input type="text" class="form-control" name="idTipoPasseio" value="<%=rsPasseio("idTipoPasseio")%>" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Quantidade Miníma</label>
          <input type="text" class="form-control" name="QtdeMinima" value="<%=rsPasseio("QtdeMinima")%>" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault05">Quantidade Máxima</label>
          <input type="text" class="form-control" name="QtdeMaxima" value="<%=rsPasseio("QtdeMaxima")%>" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault06">Tipo de Data</label>
		  <select class="form-control" name="TipoData" required>
        	<option value="E" <% if rsPasseio("TipoData") = "E" then %> selected <% else %> <% end if %> >Estimada</option>
        	<option value="" <% if rsPasseio("TipoData") <> "E" then %> selected <% else %> <% end if %> >Confirmada</option>
      	  </select>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault07">País</label>
          <input type="text" class="form-control" name="Pais" value="<%=rsPasseio("Pais")%>" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault08">Estado</label>
          <input type="text" class="form-control" name="UF" value="<%=rsPasseio("UF")%>" required>
        </div>
		
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdPasseio" value="<%=rsPasseio("IdPasseio")%>">
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