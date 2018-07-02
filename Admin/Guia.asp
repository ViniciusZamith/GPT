<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
<<<<<<< HEAD
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)
   
   
=======
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)


>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Funcionario where idFuncionario = " & Request("IdFuncionario")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			FuncionarioExcluido = "N"
		Else
			FuncionarioExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Funcionario set NomeFuncionario = '" & Request("NomeFuncionario") & "', "  &_	
				"DataNascimento = '" & Request("DataNascimento") & "', CPF = '" & Request("CPF") & "', "  &_ 
				"Telefone = '" & Request("Telefone") & "', Celular = '" & Request("Celular") & "', "  &_ 
				"CNH = '" & Request("CNH") & "', CategoriaCNH = '" & Request("CategoriaCNH") & "', "  &_ 
				"ValidadeCNH = '" & Request("ValidadeCNH") & "' where idFuncionario = " & Request("IdFuncionario") 
				
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		FuncionarioAlterado = "N"
	Else
		FuncionarioAlterado = "S"
	End If
<<<<<<< HEAD
		
	Case "Create"
	
	dataNascimento = Request("DataNascimento")
	
	SqlCreate = "INSERT INTO [Funcionario] " &_
           "([NomeFuncionario]" &_
           ",[DataNascimento]" &_
           ",[CPF]" &_
           ",[Telefone]" &_
           ",[Celular]" &_
           ",[IdTipoFuncionario]" &_
           ",[CNH]" &_
           ",[CategoriaCNH]" &_
           ",[validadeCNH])" &_
    "VALUES" &_
           "('" & Request("NomeFuncionario") & "', "  &_	
				"'" & Request("DataNascimento") & "', '" & Request("CPF") & "', "  &_ 
				"'" & Request("Telefone") & "', '" & Request("Celular") & "', "  &_
				"" & Request("IdTipoFuncionario") & ", " &_ 
				"'" & Request("CNH") & "', '" & Request("CategoriaCNH") & "', "  &_ 
				"'" & Request("ValidadeCNH") & "')"
	
	'Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		FuncionarioCriado = "N"
	Else
		FuncionarioCriado = "S"
	End If
	
	Case "Busca"
	
	Set rsFuncionario = server.CreateObject("ADODB.RECORDSET")
	SqlLista = "Select * from Funcionario as f where f.IdTipoFuncionario = 3"
	
	if Request("Nome") <> "" then
		SqlLista = SqlLista & " AND NomeFuncionario like '%" & Request("Nome") & "%'"
	end if
	if Request("Nascimento") <> "" then
		SqlLista = SqlLista & " AND DataNascimento like '%" & Request("Nascimento") & "%'"
	end if
	if Request("CPF") <> "" then
		SqlLista = SqlLista & " AND CPF like '%" & Request("CPF") & "%'"
	end if
	if Request("IdiomaEmissor") <> "" then
		SqlLista = SqlLista &_
		" AND IdFuncionario in (Select distinct IdGuia from IdiomaFalado where IdIdioma = " &_
		"(Select IdIdioma from Idioma where NomeIdioma = '" & Request("IdiomaEmissor") & "'))"
	end if
	
	rsFuncionario.open SqlLista, conn
	
	Case "ExcluirIdioma"
	
	SqlIdiomaDel = "delete from IdiomaFalado where IdGuia = " & Request(IdFuncionario) &_
	" AND IdIdioma = " & Request("IdIdioma")
	
	Response.Write("<br>SqlIdiomaDel: " & SqlIdiomaDel)
	
	conn.execute SqlIdiomaDel
=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
	
End Select
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
  <h1>Guias</h1>
</div>
<div class="card-body">
<<<<<<< HEAD
=======
<!-- Busca -->
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49

<% If FuncionarioExcluido="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário excluido com sucesso
</div>
<% End If %>

<% If FuncionarioExcluido="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao excluir funcionário.
</div>
<% End If %>

<% If FuncionarioAlterado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário alterado com sucesso
</div>
<% End If %>

<% If FuncionarioAlterado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao alterar funcionário.
</div>
<% End If %>
<<<<<<< HEAD
																
<% If FuncionarioCriado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Funcionário adicionado com sucesso
</div>
<% End If %>

<% If FuncionarioCriado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao adicionar funcionário.
</div>
<% End If %>

<!-- Busca -->

<h3>Buscar Guia</h3>
<br />
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" name="Busca" id="buscaFuncionario">
=======


<h3>Buscar Guia</h3>
<br />
<form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
  <input type="hidden" name="Action" id="IdAction" value="Busca">
  <div class="form-row">
    <div class="form-group col-6">
      <label for="IdNome">Nome</label>
      <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
    </div>
    <div class="form-group col-2">
      <label for="IdNascimento">Nascimento</label>
      <input name="Nascimento" type="date" class="form-control text-center" id="IdNascimento" value="">
    </div>
    <div class="form-group col-2">
      <label for="IdCPF">CPF</label>
<<<<<<< HEAD
      <input name="CPF" type="text" class="form-control text-center" id="CPF" placeholder="000.000.000-00" maxlength="14" value="">
    </div>
    <div class="form-group col-2">
      <label for="IdUF">Idioma</label>
      <select class="form-control" name="IdiomaEmissor" id="IdIdiomaEmissor" >
        <option value="">Selecione Idioma</option>
        <%
                         SqlSelect = "Select NomeIdioma from Idioma"
                         Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("IdiomaEmissor")<>"" Then
							  If rsSelect("NomeIdioma") = Request.Form("IdiomaEmissor") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("NomeIdioma")%>" <%=Selecao%>><%=rsSelect("NomeIdioma")%></option>
        <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
=======
      <input name="CPF" type="text" class="form-control text-center" id="IdCPF" placeholder="CPF" maxlength="14" value="">
    </div>
    <div class="form-group col-2">
      <label for="IdUF">Idioma</label>
      <select class="form-control" name="UFEmissor" id="IdUFEmissor" required>
        <option value="">Idioma</option>
        <%
'                         SqlSelect = "Select Nome from Idioma"
'                         Set rsSelect = Conn.Execute(SqlSelect)
'                         Do While Not rsSelect.EOF
'						  If Request.Form("IdiomaEmissor")<>"" Then
'							  If rsSelect("Nome") = Request.Form("IdiomaEmissor") Then Selecao = "selected" Else Selecao = "" End If
'						  End If
                          %>
        <!--                         <option value="<%'=rsSelect("Nome")%>" <%'=Selecao%>><%'=rsSelect("Nome")%></option>
-->
        <%
'                         rsSelect.MoveNext
'                         Loop
'                         rsSelect.Close
'                         Set rsSelect = Nothing
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
                          %>
      </select>
    </div>
    <div class="form-group col text-right">
      <hr>
      <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
      <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
    </div>
  </div>
</form>
<<<<<<< HEAD
=======

>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
<!-- Table -->

<h3>Lista de Guias</h3>
<br />
<<<<<<< HEAD
<table class="table table-bordered table-hover table-responsive-sm">
=======
<table class="table table-bordered table-hover table-responsive">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">Data de Nascimento</th>
    <th class="align-middle text-center">CPF</th>
    <th class="align-middle text-center">Telefone</th>
    <th class="align-middle text-center">Celular</th>
<<<<<<< HEAD
    <th class="align-middle text-center">Idioma Falado</th>
	  <th class="align-middle text-center"></th>
    <th class="align-middle text-center"><form action="novofunc.asp" method="post">
        <input type="hidden" name="IdTipoFuncionario" value="3">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      </form></th>
  </tr>
</thead>
<tbody>
  <%		  
	 		Set rsIdioma = server.CreateObject("ADODB.RECORDSET")
	 		
	 		if (Request("Action") <> "Busca") then
				Set rsFuncionario = server.CreateObject("ADODB.RECORDSET")
				SqlLista = "Select * from Funcionario as f where f.IdTipoFuncionario = 3"

				rsFuncionario.open SqlLista, conn
	 		end if
										 			
			if not (rsFuncionario.bof and rsFuncionario.eof) then
			do while not rsFuncionario.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsFuncionario("NomeFuncionario") %></small></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("DataNascimento") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("CPF") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("Telefone") %></td>
    <td class="align-middle text-center"><small><%=rsFuncionario("Celular") %></td>
	<td class="align-middle text-center"><small>
		<% 
			SqlIdioma = "Select * from IdiomaFalado as ifa, Idioma as i where ifa.IdIdioma = i.IdIdioma AND "&_
			 "IdGuia = " & rsFuncionario("IdFuncionario") & " order by i.IdIdioma"
	 		'Response.Write("<br>SqlIdioma: " & SqlIdioma)
			 			 
			listaIdiomas = "Portugês" 
			 
			if not (rsIdioma.state = 1) then			 
				rsIdioma.open SqlIdioma, conn
			 
				if not (rsIdioma.bof and rsIdioma.eof) then
					do while not rsIdioma.eof

						listaIdiomas = listaidiomas & ", " & rsIdioma("NomeIdioma")

						rsIdioma.moveNext
						loop

					Response.Write(listaIdiomas)
					rsIdioma.close
				 else
						Response.Write(listaIdiomas)
				end if
			else
				Response.Write(listaIdiomas)
			end if
		%>
	</td>
		
    <td class="align-middle text-center"><form action="editarfunc.asp" method="post">
        <input type="hidden" name="IdFuncionario" value="<%=rsFuncionario("IdFuncionario")%>">
=======
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"></th>
  </tr>
</thead>
<tbody>
  <%		
    		SqlLista = "Select * from Funcionario as f where f.IdTipoFuncionario = 3"
			Set rsGuia = server.CreateObject("ADODB.RECORDSET")
			rsGuia.open SqlLista, conn
			
			if not (rsGuia.bof and rsGuia.eof) then
			do while not rsGuia.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsGuia("NomeFuncionario") %></small></td>
    <td class="align-middle text-center"><small><%=rsGuia("DataNascimento") %></td>
    <td class="align-middle text-center"><small><%=rsGuia("CPF") %></td>
    <td class="align-middle text-center"><small><%=rsGuia("Telefone") %></td>
    <td class="align-middle text-center"><small><%=rsGuia("Celular") %></td>
    <td class="align-middle text-center"><form action="editarfunc.asp" method="post">
        <input type="hidden" name="IdFuncionario" value="<%=rsGuia("IdFuncionario")%>">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
<<<<<<< HEAD
        <input type="hidden" name="IdFuncionario" value="<%=rsFuncionario("IdFuncionario")%>">
=======
        <input type="hidden" name="IdFuncionario" value="<%=rsGuia("IdFuncionario")%>">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
<<<<<<< HEAD
			rsFuncionario.moveNext
=======
			rsGuia.moveNext
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
			loop
		
		eLSE
		%>
  <tr>
    <td colspan="12" class="align-middle text-center">Nenhum registro encontrado.</td>
  </tr>
  <%
		eND iF
        %>
</tbody>
</div>
</div>
</body>
</html><%
<<<<<<< HEAD
rsFuncionario.Close
Set rsFuncionario = Nothing
=======
rsGuia.Close
Set rsGuia = Nothing
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49

Conn.close
Set Conn = nothing
%>