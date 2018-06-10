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
    <h1>Passeios</h1>
  </div>
  <div class="card-body">
  	<!-- Busca -->
    
    <h3>Buscar Passeio</h3>
    <br />
    
    <form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
                  <input type="hidden" name="Action" id="IdAction" value="Busca">
                  
                  <div class="form-row">
                      <div class="form-group col-6">
                          <label for="IdNome">Nome</label>
                          <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
                      </div>
                      
                      <div class="form-group col-2">
                          <label for="IdStatus">Status</label>
                          <input name="Status" type="text" class="form-control text-center" id="IdStatus" placeholder="Status" maxlength="12" value="">
                      </div>
                      
                      <div class="form-group col-2">
                          <label for="IdTipo">Tipo</label>
                          <input name="Tipo" type="text" class="form-control text-center" id="IdTipo" placeholder="Tipo" maxlength="14" value="">
                      </div>
                      
                      <div class="form-group col-2">
                      <label for="IdUF">Estado</label>
                      <select class="form-control" name="UFEmissor" id="IdUFEmissor" required>
                        <option value="">UF</option>
                         <%
                         SqlSelect = "Select Uf from Uf"
                         Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("UFEmissor")<>"" Then
							  If rsSelect("UF") = Request.Form("UFEmissor") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                         %>	
                         <option value="<%=rsSelect("Uf")%>" <%=Selecao%>><%=rsSelect("Uf")%></option>
                         <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
                         %>
                    </select>
                      </div>
                      
                      <div class="form-group col text-right">
                      	  <hr>
                          <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
                       
                          <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
                      </div>  
                  </div></form>
    
    <!-- Table -->
    
    <h3>Lista de Passeios</h3>
    <br />
    
    <table class="table table-bordered table-hover table-responsive">
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Nome</th>
           	<th class="align-middle text-center">Descrição</th>
            <th class="align-middle text-center">Status</th>
            <th class="align-middle text-center">Min</th>
            <th class="align-middle text-center">Max</th>
            <th class="align-middle text-center">Data</th>
            <th class="align-middle text-center">Tipo Data</th>
            <th class="align-middle text-center">Categoria</th>
            <th class="align-middle text-center">País</th>
            <th class="align-middle text-center">Estado</th>
            <th class="align-middle text-center"></th>
            <th class="align-middle text-center"></th>
        </tr>
    </thead>
    <tbody>
    	<%
    		SqlLista = "Select * from Passeio"
			Set rsPasseio = server.CreateObject("ADODB.RECORDSET")
			rsPasseio.open SqlLista, conn
			
			if not (rsPasseio.bof and rsPasseio.eof) then
			do while not rsPasseio.eof
				Set rsTipo = Conn.Execute("Select * from TipoPasseio where IdTipo = " & rsPasseio("IdTipoPasseio"))
				DescTipo = rsTipo("DescricaoTipo")
				rsTipo.Close
				Set rsTipo = Nothing
    	%>
    	<tr>
        	<td class="align-middle text-center"><small><%=rsPasseio("NomePasseio") %></small></td>
            <td class="align-middle text-center"><small><%=rsPasseio("DescricaoPasseio") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("StatusPasseio") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("QtdeMinima") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("QtdeMaxima") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("DataPasseio") %></td>
            <td class="align-middle text-center"><small><% if rsPasseio("TipoData") = "E" then response.Write("ESTIMADA") else response.Write("CONFIRMADA") end if %></td>
            <td class="align-middle text-center"><small><%=DescTipo %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("Pais") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("UF") %></td>
        	<td class="align-middle text-center">
            	<form action="CandidatoVisualiza.asp" method="post">
                      <input type="hidden" name="IdInscricao" value="2">
                      <input type="hidden" name="Inscricao" value="201800100002"> 
                      <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">                              
                      <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">                                                            
                      <input type="hidden" name="Action" value="Visualiza">
                      <button type="submit" class="btn btn-primary btn-sm" id="botao">
                        <i class="far fa-edit"></i>&nbsp;Editar
                      </button>
                </form>
             </td>
             <td class="align-middle text-center">
            	<form action="CandidatoVisualiza.asp" method="post">
                      <input type="hidden" name="IdInscricao" value="2">
                      <input type="hidden" name="Inscricao" value="201800100002"> 
                      <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">                              
                      <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">                                                            
                      <input type="hidden" name="Action" value="Visualiza">
                      <button type="submit" class="btn btn-danger btn-sm" id="botao">
                        <i class="far fa-trash-alt"></i>&nbsp;Excluir
                      </button>
                </form>
             </td>
        </tr>
        <%
			rsPasseio.moveNext
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
</html>
<%
rsPasseio.Close
Set rsPasseio = Nothing

Conn.close
Set Conn = nothing
%>