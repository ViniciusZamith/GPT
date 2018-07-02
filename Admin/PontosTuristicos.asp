<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)
   
Select case Request("Action")
 	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from PontosTuristicos where idPonto = " & Request("idPonto")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			PontoExcluido = "N"
		Else
			PontoExcluido = "S"
		End If
 
 	Case "Alterar"
	
	SqlAlter = "update PontosTuristicos set nomePonto = '" & Request("nomePonto") & "', "  &_	
				"descricaoPonto = '" & Request("descricaoPonto") & "', localizacaoPonto = '" & Request("localizacaoPonto") & "', "  &_ 
				"disponibilidadePonto = '" & Request("disponibilidadePonto") & "'" &_
				"where idPonto = " & Request("idPonto")
					
																		   
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		PontoAlterado = "N"
	Else
		PontoAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [PontosTuristicos] " &_
           "([nomePonto]" &_
           ",[descricaoPonto]" &_
           ",[localizacaoPonto]" &_
           ",[disponibilidadePonto])" &_
    "VALUES" &_
           "('" & Request("nomePonto") & "', "  &_	
				"'" & Request("descricaoPonto") & "', '" & Request("localizacaoPonto") & "', "  &_ 
	"'" & Request("disponibilidadePonto") & "')"
	
	
	
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		PontoCriado = "N"
	Else
		PontoCriado = "S"
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
  <h1>Pontos Turisticos</h1>
</div>
<div class="card-body">
<!-- Busca -->

<h3>Buscar Pontos Turisticos</h3>
<br />
				<form method="post" action="/admin/PontosTuristicos.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
  <input type="hidden" name="Action" id="IdAction" value="Busca">
  <div class="form-row">
    <div class="form-group col-6">
      <label for="IdNome">Nome</label>
      <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
    </div>
    <div class="form-group col-4">
      <label for="IdLocalizacao">Localização</label>
      <input name="Localizacao" type="text" class="form-control text-center" placeholder="Localização" id="IdLocalizacao" value="">
    </div>
    <div class="form-group col-2">
        <label for="validationDefault02">Disponibilidade</label>
          <select class="form-control" name="disponibilidadePonto" id="disponibilidadePonto" >
        	<option value="Manhã">Manhã</option>
        	<option value="Tarde">Tarde</option>
			<option value="Noite">Noite</option>
			<option value="Manhã/Tarde">Manhã/Tarde</option>
			<option value="Manhã/Noite">Manhã/Noite</option>
			<option value="Tarde/Noite">Tarde/Noite</option>
			<option value="Integral">Integral</option>
      	  </select>
        </div>
    </div>
    
    <div class="form-group col text-right">
      <hr>
      <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
      <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
    </div>
  </div>
</form>

<!-- Table -->

<h3>Lista de Pontos Turisticos</h3>
<br />
<table class="table table-bordered table-hover table-responsive">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">Descrição</th>
    <th class="align-middle text-center">Localização</th>
    <th class="align-middle text-center">Disponibilidade</th>
	  <th class="align-middle text-center">
	  <form action="NovoPonto.asp" method="post">
		<input type="hidden" name="IdTipoFuncionario" value="2">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
	  </form>
	  </th>
  </tr>
</thead>
<tbody>
  <%		  
  			Set rsPonto = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
			sqlSearch = "Select * from PontosTuristicos where nomePonto like '%" & Request("Nome") &_ 
			"%' AND localizacaoPonto like '%" & Request("Localizacao") &_ 
			"%' AND disponibilidadePonto like '%" & Request("disponibilidadePonto") & "%'"
   			Response.Write("<br>SqlSearch: " & SqlSearch)
			
			rsPonto.open SqlSearch, conn
			
			else
			
    		SqlLista = "Select * from PontosTuristicos"
			rsPonto.open SqlLista, conn
			
			end if
			
			if not (rsPonto.bof and rsPonto.eof) then
			do while not rsPonto.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsPonto("nomePonto") %></small></td>
    <td class="align-middle text-center"><small><%=rsPonto("descricaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("localizacaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("disponibilidadePonto") %></td>
    <td class="align-middle text-center"><form action="EditarPonto.asp" method="post">
        <input type="hidden" name="idPonto" value="<%=rsPonto("idPonto")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="idPonto" value="<%=rsPonto("idPonto")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsPonto.moveNext
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
rsPonto.Close
Set rsPonto = Nothing

Conn.close
Set Conn = nothing
%>