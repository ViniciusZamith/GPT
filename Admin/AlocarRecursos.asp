<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
If Session("TipoUsuario") <> 3 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")	
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from AlocarRecurso where IdAlocacao = " & Request("IdAlocacao")
		
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			RecursosExcluido = "N"
		Else
			RecursosExcluido = "S"
		End If
		
	Case "Alter"
	
	SqlAlter = "update AlocarRecurso set " &_	
				"IdPasseio = " & Request("IdPasseio") & ", "  &_ 
				"IdGuia = " & Request("IdGuia") & ", IdMotorista = " & Request("IdMotorista") & ", "  &_ 
				"IdVeiculo = " & Request("IdVeiculo") & ", DataPasseio = (SELECT DataPasseio FROM Passeio Where IdPasseio = " & Request("IdPasseio") & ")"
				
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		RecursosAlterado = "N"
	Else
		RecursosAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [AlocarRecurso] " &_
           "([IdPasseio]" &_
           ",[IdGuia]" &_
           ",[IdMotorista]" &_
           ",[IdVeiculo]" &_
           ",[DataPasseio]" &_
    ") VALUES " &_
           "(" & Request("IdPasseio") & ", "  &_	
				Request("IdGuia") & ", " &_ 
				Request("IdMotorista") & ", " &_
				Request("IdVeiculo") & ", " &_
				"(SELECT DataPasseio FROM Passeio Where IdPasseio = " & Request("IdPasseio") & "))"
					
	Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		RecursosCriado = "N"
	Else
		RecursosCriado = "S"
	End If
	
End Select
%>

<!DOCTYPE html>

<head>
<!--#INCLUDE file="../Includes/Head.asp" -->
</head>

<body>
	<!-- #INCLUDE file="MenuEsp.asp" -->
    
   <div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
    <h1>Alocação de Recursos</h1>
  </div>
  <div class="card-body">
    <h3>Buscar Alocação</h3>
    <br />
    
	<form method="post" action="/admin/AlocarRecursos.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
	<input type="hidden" name="Action" id="IdAction" value="Busca">

		<div class="form-row">
			<div class="form-group col-12">
			<label for="IdNome">Nome Passeio</label>
			<input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
		</div>

		</div>

	<div class="form-group col text-right">
	
	<button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>

	<button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
	</div>  
	</div></form>

    <!-- Table -->
    
    <h3>Lista de Passeios com recursos alocados</h3>
    <br />
    
    <table class="table table-bordered table-hover table-responsive-sm">
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Passeio</th>
           	<th class="align-middle text-center">Guia</th>
            <th class="align-middle text-center">Motorista</th>
            <th class="align-middle text-center">Placa</th>
            <th class="align-middle text-center">Data</th>
            <th class="align-middle text-center"></th>
     		<th class="align-middle text-center"><form action="NovoAlocarRecurso.asp" method="post">
       			<input type="hidden" name="TipoFuncionario" value="3">
        		<input type="hidden" name="Action" value="Alterar">
        		<button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      		</form></th>
        </tr>
    </thead>
    <tbody>
		<%		  
  			Set rsAlocarRecurso = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
				sqlSearch = "select a.IdAlocacao, p.NomePasseio as NomeP, f1.NomeFuncionario as NomeG, f2.NomeFuncionario as NomeM, v.placa as Placa, p.DataPasseio as DataP " &_ 
							"FROM AlocarRecurso as a " &_ 
							"join Passeio as p on p.IdPasseio = a.IdPasseio " &_
							"join funcionario as f1 on f1.IdFuncionario = a.IdGuia " &_
							"join funcionario as f2 on f2.IdFuncionario = a.IdMotorista " &_
							"join Veiculo as v on v.idVeiculo = a.IdVeiculo " &_
							"where p.NomePasseio Like '%" & Request("Nome") & "%'"																

				rsAlocarRecurso.open sqlSearch, conn

				else

				SqlLista = "select a.IdAlocacao, p.NomePasseio as NomeP, f1.NomeFuncionario as NomeG, f2.NomeFuncionario as NomeM, v.placa as Placa, p.DataPasseio as DataP " &_
							"FROM AlocarRecurso as a " &_ 
							"join Passeio as p on p.IdPasseio = a.IdPasseio " &_
							"join funcionario as f1 on f1.IdFuncionario = a.IdGuia " &_
							"join funcionario as f2 on f2.IdFuncionario = a.IdMotorista " &_
							"join Veiculo as v on v.idVeiculo = a.IdVeiculo"
				
				'
				
				'Response.Write("<br>SqlLista: " & SqlLista)
							
				rsAlocarRecurso.open SqlLista, conn
				
			end if
			
			if not (rsAlocarRecurso.bof and rsAlocarRecurso.eof) then
			do while not rsAlocarRecurso.eof												 
    	%>
    	<tr>
        	<td class="align-middle text-center"><small><%=rsAlocarRecurso("NomeP") %></small></td>
            <td class="align-middle text-center"><small><%=rsAlocarRecurso("NomeG") %></td>
            <td class="align-middle text-center"><small><%=rsAlocarRecurso("NomeM") %></td>
            <td class="align-middle text-center"><small><%=rsAlocarRecurso("Placa") %></td>
            <td class="align-middle text-center"><small><%=rsAlocarRecurso("DataP") %></td>

        	<td class="align-middle text-center">
            	<form action="EditarAlocarRecurso.asp" method="post">
					<input type="hidden" name="IdAlocacao" value="<%=rsAlocarRecurso("IdAlocacao")%>">
                    <input type="hidden" name="Action" value="Alter">
                    <button type="submit" class="btn btn-primary btn-sm" id="botao">
                        <i class="fa fa-edit"></i>&nbsp;Editar
                    </button>
                </form>
             </td>
             <td class="align-middle text-center">
    			<form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post" onsubmit="return confirm('Realmente deseja excluir?');">
        		<input type="hidden" name="IdAlocacao" value="<%=rsAlocarRecurso("IdAlocacao")%>">
        		<input type="hidden" name="Action" value="Excluir">
        		<button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="fa fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
        </tr>
        <%
			rsAlocarRecurso.moveNext
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