<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
<<<<<<< HEAD
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
=======
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
				<form method="post" action="/admin/PontosTuristicos.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
=======
<form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
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
=======
      <label for="IdDisponibilidade">Disponibilidade</label>
      <input name="Disponibilidade" type="text" class="form-control text-center" id="IdDisponibilidade" placeholder="Disponibilidade" maxlength="14" value="">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
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
			
=======
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"></th>
  </tr>
</thead>
<tbody>
  <%
    		SqlLista = "Select * from PontosTuristicos"
			Set rsPonto = server.CreateObject("ADODB.RECORDSET")
			rsPonto.open SqlLista, conn
			
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
			if not (rsPonto.bof and rsPonto.eof) then
			do while not rsPonto.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsPonto("nomePonto") %></small></td>
    <td class="align-middle text-center"><small><%=rsPonto("descricaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("localizacaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("disponibilidadePonto") %></td>
<<<<<<< HEAD
    <td class="align-middle text-center"><form action="EditarPonto.asp" method="post">
        <input type="hidden" name="idPonto" value="<%=rsPonto("idPonto")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="idPonto" value="<%=rsPonto("idPonto")%>">
        <input type="hidden" name="Action" value="Excluir">
=======
    <td class="align-middle text-center"><form action="CandidatoVisualiza.asp" method="post">
        <input type="hidden" name="IdInscricao" value="2">
        <input type="hidden" name="Inscricao" value="201800100002">
        <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">
        <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">
        <input type="hidden" name="Action" value="Visualiza">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center"><form action="CandidatoVisualiza.asp" method="post">
        <input type="hidden" name="IdInscricao" value="2">
        <input type="hidden" name="Inscricao" value="201800100002">
        <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">
        <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">
        <input type="hidden" name="Action" value="Visualiza">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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