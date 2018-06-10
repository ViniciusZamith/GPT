<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
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
  <h1>Pontos Turisticos</h1>
</div>
<div class="card-body">
<!-- Busca -->

<h3>Buscar Pontos Turisticos</h3>
<br />
<form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
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
      <label for="IdDisponibilidade">Disponibilidade</label>
      <input name="Disponibilidade" type="text" class="form-control text-center" id="IdDisponibilidade" placeholder="Disponibilidade" maxlength="14" value="">
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
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"></th>
  </tr>
</thead>
<tbody>
  <%
    		SqlLista = "Select * from PontosTuristicos"
			Set rsPonto = server.CreateObject("ADODB.RECORDSET")
			rsPonto.open SqlLista, conn
			
			if not (rsPonto.bof and rsPonto.eof) then
			do while not rsPonto.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsPonto("nomePonto") %></small></td>
    <td class="align-middle text-center"><small><%=rsPonto("descricaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("localizacaoPonto") %></td>
    <td class="align-middle text-center"><small><%=rsPonto("disponibilidadePonto") %></td>
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