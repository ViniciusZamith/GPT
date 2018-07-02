<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Veiculo where IdVeiculo = " & Request("IdVeiculo")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			VeiculoExcluido = "N"
		Else
			VeiculoExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Veiculo set Placa = '" & Request("Placa") & "', "  &_	
				"AnoVeiculo = '" & Request("AnoVeiculo") & "', Modelo = '" & Request("Modelo") & "', "  &_ 
				"Marca = '" & Request("Marca") & "', TipoVeiculo = '" & Request("TipoVeiculo") & "', "  &_ 
				"LotacaoMin = '" & Request("LotacaoMin") & "', LotacaoMax = '" & Request("LotacaoMax") & "' where idVeiculo = " & Request("IdVeiculo") 
				
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		VeiculoAlterado = "N"
	Else
		VeiculoAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [Veiculo] " &_
           "([Placa]" &_
           ",[AnoVeiculo]" &_
           ",[Modelo]" &_
           ",[Marca]" &_
           ",[TipoVeiculo]" &_
           ",[LotacaoMin]" &_
		   ",[LotacaoMax])" &_
    "VALUES" &_
           "('" & Request("Placa") & "', "  &_	
				"" & Request("AnoVeiculo") & ", '" & Request("Modelo") & "', "  &_ 
				"'" & Request("Marca") & "', '" & Request("TipoVeiculo") & "', "  &_
				"" & Request("LotacaoMin") & ", " &_ 
				"" & Request("LotacaoMax") & ")"
	
	Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		VeiculoCriado = "N"
	Else
		VeiculoCriado = "S"
	End If
		
	Case "Busca"
	
	Set rsVeiculo = server.CreateObject("ADODB.RECORDSET")
	SqlLista = "Select * from Veiculo where idVeiculo > 0"
	
	if Request("Placa") <> "" then
		SqlLista = SqlLista & " AND Placa like '%" & Request("Placa") & "%'"
	end if
	if Request("Modelo") <> "" then
		SqlLista = SqlLista & " AND Modelo like '%" & Request("Modelo") & "%'"
	end if
	if Request("Marca") <> "" then
		SqlLista = SqlLista & " AND Marca like '%" & Request("Marca") & "%'"
	end if
	
	Response.Write("<br>SqlLista: " & SqlLista)
	rsVeiculo.open SqlLista, conn
	
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
    <h1>Veículos</h1>
  </div>
  <div class="card-body">
  	<!-- Busca -->
    
    <h3>Buscar Veículo</h3>
    <br />
    
    <form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" name="Busca" id="buscaVeiculo">
		  <input type="hidden" name="Action" id="IdAction" value="Busca">

		  <div class="form-row">
			  <div class="form-group col-3">
				  <label for="IdPlaca">Placa</label>
				  <input name="Placa" type="text" class="form-control text-center" id="Placa" placeholder="Placa" maxlength="10" value="">
			  </div>

			  <div class="form-group col-3">
				  <label for="IdModelo">Modelo</label>
				  <input name="Modelo" type="text" class="form-control text-center" id="Modelo" placeholder="Modelo" maxlength="14" value="">
			  </div>

			  <div class="form-group col-3">
				  <label for="IdMarca">Marca</label>
				  <input name="Marca" type="text" class="form-control text-center" id="Marca" placeholder="Marca" maxlength="14" value="">
			  </div>

			  <div class="form-group col-3">
				  <label for="IdTipo">Tipo</label>
				  <input name="Tipo" type="text" class="form-control text-center" id="TipoVeiculo" placeholder="Tipo" maxlength="14" value="">
			  </div>

			  <div class="form-group col text-right">
				  <hr>
				  <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>

				  <button onclick="LimpaFormulario('IdPlaca')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
			  </div>  
		  </div>
		</form>
    
    <!-- Table -->
    
    <h3>Lista de Veiculos</h3>
    <br />
    
    <table class="table table-bordered table-hover table-responsive-sm">
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Placa</th>
           	<th class="align-middle text-center">Ano</th>
            <th class="align-middle text-center">Modelo</th>
            <th class="align-middle text-center">Marca</th>
            <th class="align-middle text-center">Tipo</th>
            <th class="align-middle text-center">Lotação Mínima</th>
            <th class="align-middle text-center">Lotação Máxima</th>
            <th class="align-middle text-center"></th>
     		<th class="align-middle text-center"><form action="NovoVeiculo.asp" method="post">
       			<input type="hidden" name="IdTipoVeiculo" value="2">
        		<input type="hidden" name="Action" value="Alterar">
        		<button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      		</form></th>
        </tr>
    </thead>
    <tbody>
    	<%
															
			if (Request("Action") <> "Busca") then
				SqlLista = "Select * from Veiculo"
				Set rsVeiculo = server.CreateObject("ADODB.RECORDSET")
				rsVeiculo.open SqlLista, conn
			end if
															
			if not (rsVeiculo.bof and rsVeiculo.eof) then
			do while not rsVeiculo.eof
    	%>
    	<tr>
        	<td class="align-middle text-center"><small><%=rsVeiculo("Placa") %></small></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("AnoVeiculo") %></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("Modelo") %></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("Marca") %></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("TipoVeiculo") %></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("LotacaoMin") %></td>
            <td class="align-middle text-center"><small><%=rsVeiculo("LotacaoMax") %></td>
        	<td class="align-middle text-center">
            	<form action="EditarVeiculo.asp" method="post">
					<input type="hidden" name="IdVeiculo" value="<%=rsVeiculo("IdVeiculo")%>">
                    <input type="hidden" name="Action" value="Alter">
                    <button type="submit" class="btn btn-primary btn-sm" id="botao">
                        <i class="far fa-edit"></i>&nbsp;Editar
                    </button>
                </form>
             </td>
             <td class="align-middle text-center">
    			<form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        		<input type="hidden" name="IdVeiculo" value="<%=rsVeiculo("IdVeiculo")%>">
        		<input type="hidden" name="Action" value="Excluir">
        		<button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
        </tr>
        <%
			rsVeiculo.moveNext
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
rsVeiculo.Close
Set rsVeiculo = Nothing

Conn.close
Set Conn = nothing
%>