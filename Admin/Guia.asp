<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)


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
<!-- Busca -->

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


<h3>Buscar Guia</h3>
<br />
<form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
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

<!-- Table -->

<h3>Lista de Guias</h3>
<br />
<table class="table table-bordered table-hover table-responsive">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">Data de Nascimento</th>
    <th class="align-middle text-center">CPF</th>
    <th class="align-middle text-center">Telefone</th>
    <th class="align-middle text-center">Celular</th>
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
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="IdFuncionario" value="<%=rsGuia("IdFuncionario")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsGuia.moveNext
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
rsGuia.Close
Set rsGuia = Nothing

Conn.close
Set Conn = nothing
%>