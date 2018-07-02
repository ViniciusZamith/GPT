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
<<<<<<< HEAD
          <input type="text" class="form-control" id="CPF" name="CPF" placeholder="000.000.000-00" value="" required>
=======
          <input type="text" class="form-control" id="CPF" name="CPF" placeholder="999.999.999-99" value="" required>
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Telefone</label>
<<<<<<< HEAD
          <input type="text" class="form-control MaskFone" id="Telefone" name="Telefone" placeholder="(00)0000-0000" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control MaskCel" id="Celular" name="Celular" placeholder="(00)90000-0000" value="" required>
        </div>
        <div class="col-md-4 mb-3"></div>
        
        <%
		If Request("IdTipoFuncionario") = 4 Then
		%>
        
        <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CNH</label>
          <input type="text" class="form-control" name="CNH" placeholder="00000000000" value="" required>
        </div>
        <div class="col-md-4 mb-3">
        	<label for="validationDefault04">Validade</label>
				<input type="date" class="form-control" name="ValidadeCNH" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Categoria</label>
          <select class="form-control" name="CategoriaCNH" >
					<option value="" disabled selected>Categoria</option>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					<option value="E">E</option>
			  </select>
  		</div>
        
        <%
		end if
		%>
        
=======
          <input type="text" class="form-control" name="Telefone" placeholder="(00)00000000" value="" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control" name="Celular" placeholder="(00)900000000" value="" required>
        </div>
        <div class="col-md-4 mb-3"></div>
        
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        <input type="hidden" name="IdTipoFuncionario" value=<%=Request("IdTipoFuncionario")%>>    
        <input type="hidden" name="Action" value="Create">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
<<<<<<< HEAD
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    <button class="btn btn-warning ml-1" type="submit">Cancelar</button>
    </form>
=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
  </div>
</div>
</body>
</html>