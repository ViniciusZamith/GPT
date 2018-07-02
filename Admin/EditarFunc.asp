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
<<<<<<< HEAD
	
<script language="Javascript">
function deletaIdioma(row) {
    document.getElementById('tabelaIdioma').deleteRow(row);
}
</script>
=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
</head>

<body>

<!--#INCLUDE file="../Admin/MenuAdmin.asp" -->

<div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
<<<<<<< HEAD
    <h2>Dados</h2>
=======
    <h2>Dados Guia</h2>
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
  </div>
  <div class="card-body">
    <%
  SqlSelecionado = "Select * from Funcionario as f where f.IdFuncionario = " & Request("IdFuncionario")
<<<<<<< HEAD
			Set rsFuncionario = server.CreateObject("ADODB.RECORDSET")
			rsFuncionario.open SqlSelecionado, conn
			idTipoFuncionario = rsFuncionario("IdTipoFuncionario")
			DataErro = rsFuncionario("DataNascimento")
			ArrayData = split (DataErro, "/")
			Data = Arraydata(2) & "-" & ArrayData(1) & "-" & ArrayData(0)
  %>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <input type="text" class="form-control" name="NomeFuncionario" placeholder="Nome" value="<%=rsFuncionario("NomeFuncionario")%>" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Data de Nascimento</label>
          <input type="date" class="form-control" name="DataNascimento" value="<%=Data%>" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CPF</label>
          <input type="text" class="form-control" id="CPF" name="CPF" placeholder="000.000.000-00" value="<%=rsFuncionario("CPF")%>" >
=======
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
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">Telefone</label>
<<<<<<< HEAD
          <input type="text" class="form-control MaskFone" name="Telefone" placeholder="(DD)Xxxxxxxxx" value="<%=rsFuncionario("Telefone")%>" >
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control MaskCel" id="Celular" name="Celular" placeholder="Celular" value="<%=rsFuncionario("Celular")%>" >
        </div>
		  
		<%
			If idTipoFuncionario = 3 Then
		%>  
			</div>
			<div class="col-md-4 mb-3">
			<!--<label for="validationDefault05">Idiomas</label>-->
			<table class="table table-bordered table-hover table-responsive-sm" id="tabelaIdioma">
				<thead class="bg-secondary text-white">
					<th class="align-middle text-center">Idioma</th>
					<th class="align-middle text-center"></th>
				</thead>
				<tbody>
				<tr class="justify-content-around">
					<td class="align-middle text-center"><small>Português</small></td>
					<td class="align-middle text-center">
					<button type="button" class="btn btn-danger btn-sm" id="botao" disabled> <i class="far fa-trash-alt"></i></button></td>
			<% 
			   	Set rsIdioma = server.CreateObject("ADODB.RECORDSET")
			   
				SqlIdioma = "Select * from IdiomaFalado as ifa, Idioma as i where ifa.IdIdioma = i.IdIdioma AND IdGuia = " &_
			   	"'" & rsFuncionario("IdFuncionario") & "' order by i.IdIdioma"
	 
	 			rsIdioma.open SqlIdioma, conn
			   	
			   	if not (rsIdioma.bof and rsIdioma.eof) then
				do while not rsIdioma.eof
			   
			%>	
				</tr>
				<tr class="justify-content-around">
				<td class="align-middle text-center"><small><%=rsIdioma("NomeIdioma") %></small></td>
				<td class="align-middle text-center">
        				<input type="hidden" name="idIdioma" value="<%=rsIdioma("IdIdioma")%>">
        				<input type="hidden" name="Action" value="ExcluirIdioma">
        				<button onclick="deletaIdioma(this.parentNode.parentNode.rowIndex)" class="btn btn-danger btn-sm" id="botao"> 
							<i class="far fa-trash-alt"></i></button>	
				</td>
		<%
		   		rsIdioma.moveNext
		   		loop
		   		end if
		%>			
				</tr>
				</tbody>
		</table>
		<%
		   else 
		%>	
			<div class="col-md-4 mb-3"></div>
		<%
			end if
		%>
        
        <%
			If idTipoFuncionario = 4 Then
		%>
        <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">CNH</label>
          <input type="text" class="form-control" name="CNH" placeholder="(DD)Xxxxxxxxx" value="<%=rsFuncionario("CNH")%>">
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Validade</label>
          <input type="text" class="form-control" name="ValidadeCNH" placeholder="Celular" value="<%=rsFuncionario("ValidadeCNH")%>">
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Categoria</label>
          <input type="text" class="form-control" name="CategoriaCNH" placeholder="Celular" value="<%=rsFuncionario("CategoriaCNH")%>">
  		</div>
        
        <%
			end if
		%>
        <input type="hidden" name="IdFuncionario" value="<%=rsFuncionario("IdFuncionario")%>">
        <input type="hidden" name="Action" value="Alterar">
    	<button class="btn btn-primary float-left" type="submit">Salvar</button>
    </form>
    <form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    <button class="btn btn-warning ml-1 float-left" type="submit">Cancelar</button>
=======
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
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
    </form>
  </div>
</div>
</body>
</html>