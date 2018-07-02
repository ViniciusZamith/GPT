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
    <h2>Dados Passeio</h2>
  </div>
  <div class="card-body">
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomePasseio" placeholder="Nome" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Descrição</label>
          <input type="text" class="form-control" name="DescricaoPasseio" value="" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault01">Data</label>
          <input type="date" class="form-control" name="DataPasseio" placeholder="01/01/2018"  value="" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault02">Categoria</label>
          <input type="text" class="form-control" id="idTipoPasseio" name="IdTipoPasseio" placeholder="Cultural" value="" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Quantidade Mínima</label>
          <input type="text" class="form-control" id="QtdeMinima" name="QtdeMinima" placeholder="10" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Quantidade Máxima</label>
          <input type="text" class="form-control" id="QtdeMaxima" name="QtdeMaxima" placeholder="100" value="" required>
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault04">Tipo de Data</label>
          <select class="form-control" name="TipoData" id="TipoData" >
			<option value="" disabled selected>Tipo de Data</option>
        	<option value="E">Estimada</option>
        	<option value="">Confirmada</option>
      	  </select>
        </div>
		 <div class="col-md-4 mb-3">
          <label for="validationDefault04">País</label>
          <input type="text" class="form-control" id="Pais" name="Pais" placeholder="Brasil" value="" required>
        </div>
        <div class="col-md-4 mb-3">
		  <label for="validationDefault04">Estado</label>
		  <select class="form-control" name="UF" id="IdUF" >
          <option value="">Selecione o Estado</option>
          <%
                         SqlSelect = "Select * from Uf"
                         Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("Uf")<>"" Then
							  If rsSelect("UF") = Request.Form("UF") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("IdUF")%>" <%=Selecao%>><%=rsSelect("UF")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>		
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