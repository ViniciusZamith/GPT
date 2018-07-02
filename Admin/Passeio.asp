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
		
		SqlDelet = "Delete from Passeio where IdPasseio = " & Request("IdPasseio")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			PasseioExcluido = "N"
		Else
			PasseioExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Passeio set NomePasseio = '" & Request("NomePasseio") & "', "  &_	
				"DescricaoPasseio = '" & Request("DescricaoPasseio") & "', "  &_ 
				"QtdeMinima = '" & Request("QtdeMinima") & "', QtdeMaxima = '" & Request("QtdeMaxima") & "', "  &_ 
				"DataPasseio = '" & Request("DataPasseio") & "', TipoData = '" & Request("TipoData") & "', "  &_ 
				"IdTipoPasseio = '" & Request("IdTipoPasseio") & "', Pais = '" & Request("Pais") & "', " &_
				"UF = '" & Request("UF") & "' where idPasseio = " & Request("IdPasseio") 
				
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		PasseioAlterado = "N"
	Else
		PasseioAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [Passeio] " &_
           "([NomePasseio]" &_
           ",[DescricaoPasseio]" &_
           ",[QtdeMinima]" &_
           ",[QtdeMaxima]" &_
           ",[DataPasseio]" &_
		   ",[IdTipoPasseio]" &_
           ",[TipoData]" &_
           ",[Pais]" &_
           ",[UF])" &_
    "VALUES" &_
           "('" & Request("NomePasseio") & "', "  &_	
				"'" & Request("DescricaoPasseio") & "', " &_ 
				"" & Request("QtdeMinima") & ", " & Request("QtdeMaxima") & ", "  &_
				"'" & Request("DataPasseio") & "', " &_ 
				"'" & Request("IdTipoPasseio") & "', '" & Request("TipoData") & "', "  &_ 
				"'" & Request("Pais") & "', " &_
				"'" & Request("UF") & "')"
	
	Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		PasseioCriado = "N"
	Else
		PasseioCriado = "S"
	End If
	
End Select
%>
=======
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)
%>

>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
    <h3>Buscar Passeio</h3>
    <br />
    
	<form method="post" action="/admin/Passeio.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
	<input type="hidden" name="Action" id="IdAction" value="Busca">

		<div class="form-row">
			<div class="form-group col-8">
			<label for="IdNome">Nome</label>
			<input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
		</div>

		<div class="form-group col-2">
			<label for="IdTipo">Tipo</label>
			<input name="Tipo" type="text" class="form-control text-center" id="IdTipo" placeholder="Tipo" maxlength="14" value="">
		</div>

		<div class="form-group col-2">
			<label for="IdUFEmissor">UF</label>
			<select class="form-control" name="UFEmissor" id="IdUFEmissor">
				<option value="">UF</option>
			<%
				SqlSelect = "Select * from UF"
				Set rsSelect = Conn.Execute(SqlSelect)
										
				Do While Not rsSelect.EOF
					If Request.Form("UFEmissor") <> "" Then
						If (rsSelect("UF") = Request.Form("UFEmissor")) Then 
							Selecao = "selected" 
						Else 
							Selecao = "" 
						End If
					End If
			%>	
				<option value="<%=rsSelect("IdUF")%>" <%=Selecao%> > <%=rsSelect("UF")%> </option>
			<%
				rsSelect.MoveNext
				Loop
				rsSelect.Close
				Set rsSelect = Nothing
			%>
			</select>
		</div>

	<div class="form-group col text-right">
	
	<button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>

	<button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
	</div>  
	</div></form>

=======
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
    
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
    <!-- Table -->
    
    <h3>Lista de Passeios</h3>
    <br />
    
<<<<<<< HEAD
    <table class="table table-bordered table-hover table-responsive-sm">
=======
    <table class="table table-bordered table-hover table-responsive">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Nome</th>
           	<th class="align-middle text-center">Descrição</th>
<<<<<<< HEAD
=======
            <th class="align-middle text-center">Status</th>
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
            <th class="align-middle text-center">Min</th>
            <th class="align-middle text-center">Max</th>
            <th class="align-middle text-center">Data</th>
            <th class="align-middle text-center">Tipo Data</th>
            <th class="align-middle text-center">Categoria</th>
            <th class="align-middle text-center">País</th>
<<<<<<< HEAD
            <th class="align-middle text-center">UF</th>
            <th class="align-middle text-center"></th>
     		<th class="align-middle text-center"><form action="NovoPasseio.asp" method="post">
       			<input type="hidden" name="IdTipoFuncionario" value="2">
        		<input type="hidden" name="Action" value="Alterar">
        		<button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      		</form></th>
        </tr>
    </thead>
    <tbody>
		<%		  
  			Set rsPasseio = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
				sqlSearch = "Select * from Passeio where NomePasseio like '%" & Request("Nome") &_ 
							"%' AND IdTipoPasseio like '%" & Request("Tipo") & "%'"
				if (Request("UFEmissor") <> "") then
					SqlSerach = SqlSearch & " AND UF = " & Request("UFEmissor")
				end if																
				'Response.Write("<br>SqlSearch: " & SqlSearch)

				rsPasseio.open SqlSearch, conn

				else

				SqlLista = "Select * from Passeio"
				rsPasseio.open SqlLista, conn
			
			end if
=======
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
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
			
			if not (rsPasseio.bof and rsPasseio.eof) then
			do while not rsPasseio.eof
				Set rsTipo = Conn.Execute("Select * from TipoPasseio where IdTipo = " & rsPasseio("IdTipoPasseio"))
				DescTipo = rsTipo("DescricaoTipo")
				rsTipo.Close
				Set rsTipo = Nothing
<<<<<<< HEAD
																				  
				Set rsUF = Conn.Execute("Select * from UF where IdUF = " & rsPasseio("UF"))
				UF = rsUF("UF")
				rsUF.Close
				Set rsUF = Nothing																				 
=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
    	%>
    	<tr>
        	<td class="align-middle text-center"><small><%=rsPasseio("NomePasseio") %></small></td>
            <td class="align-middle text-center"><small><%=rsPasseio("DescricaoPasseio") %></td>
<<<<<<< HEAD
=======
            <td class="align-middle text-center"><small><%=rsPasseio("StatusPasseio") %></td>
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
            <td class="align-middle text-center"><small><%=rsPasseio("QtdeMinima") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("QtdeMaxima") %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("DataPasseio") %></td>
            <td class="align-middle text-center"><small><% if rsPasseio("TipoData") = "E" then response.Write("ESTIMADA") else response.Write("CONFIRMADA") end if %></td>
            <td class="align-middle text-center"><small><%=DescTipo %></td>
            <td class="align-middle text-center"><small><%=rsPasseio("Pais") %></td>
<<<<<<< HEAD
            <td class="align-middle text-center"><small><%=UF %></td>
        	<td class="align-middle text-center">
            	<form action="EditarPasseio.asp" method="post">
					<input type="hidden" name="IdPasseio" value="<%=rsPasseio("IdPasseio")%>">
                    <input type="hidden" name="Action" value="Alter">
                    <button type="submit" class="btn btn-primary btn-sm" id="botao">
                        <i class="far fa-edit"></i>&nbsp;Editar
                    </button>
                </form>
             </td>
             <td class="align-middle text-center">
    			<form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post" onsubmit="return confirm('Realmente deseja excluir?');">
        		<input type="hidden" name="IdPasseio" value="<%=rsPasseio("IdPasseio")%>">
        		<input type="hidden" name="Action" value="Excluir">
        		<button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
=======
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
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
	rsPasseio.Close
	Set rsPasseio = Nothing

	Conn.close
	Set Conn = nothing
=======
rsPasseio.Close
Set rsPasseio = Nothing

Conn.close
Set Conn = nothing
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
%>