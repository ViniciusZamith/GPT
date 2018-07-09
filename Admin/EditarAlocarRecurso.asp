<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<%
	If Session("TipoUsuario") <> 3 then Response.Redirect("acessonegado.asp")
	Set Conn = Server.CreateObject("ADODB.Connection") 
	Conn.Open(StrConexao)
%>

<!DOCTYPE html>

<head>
<!--#INCLUDE file="../Includes/Head.asp" -->
</head>

<body>

<body>

<!--#INCLUDE file="../Admin/MenuEsp.asp" -->


<div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
    <h2>Dados Alocação de Recurso</h2>
  </div>
  <div class="card-body">
  <%
  SqlSelecionado = "select a.IdAlocacao, p.NomePasseio as NomeP, f1.NomeFuncionario as NomeG, f2.NomeFuncionario as NomeM, v.placa as Placa, p.DataPasseio as DataP, p.IdPasseio, v.tipoVeiculo as tipo " &_ 
							"FROM AlocarRecurso as a " &_ 
							"join Passeio as p on p.IdPasseio = a.IdPasseio " &_
							"join funcionario as f1 on f1.IdFuncionario = a.IdGuia " &_
							"join funcionario as f2 on f2.IdFuncionario = a.IdMotorista " &_
							"join Veiculo as v on v.idVeiculo = a.IdVeiculo " &_
							"where IdAlocacao = " & Request("IdAlocacao")
			'Response.Write("<br>SqlCreate: " & SqlSelecionado)

			Set rsAlocarRecurso = server.CreateObject("ADODB.RECORDSET")
			rsAlocarRecurso.open SqlSelecionado, conn
	 
	 		DataErro = rsAlocarRecurso("DataP")
			ArrayData = split (DataErro, "/")
			Data = Arraydata(2) & "-" & ArrayData(1) & "-" & ArrayData(0)
  %>	
    <form action="passeio.asp" method="post">
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome Passeio</label>
          <select class="form-control" name="IdPasseio" id="IdPasseio">
          <option name="IdPasseioValor" id="IdPasseioValor" value="<%=rsAlocarRecurso("NomeP")%>" selected><%=rsAlocarRecurso("NomeP")%></option>
          <%
                         SqlSelect = "select NomePasseio as NomeP, IdPasseio " &_ 
							"FROM Passeio"
							
						 Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("IdPasseio")<>"" Then
							  If rsSelect("AlocarRecurso") = Request.Form("IdPasseio") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("IdPasseio")%>" <%=Selecao%>><%=rsSelect("NomeP")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>		
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Guia</label>
          <select class="form-control" name="IdGuia" id="IdGuia" >
          <option value="" selected><%=rsAlocarRecurso("NomeG")%></option>
          <%
                         SqlSelect = "select IdFuncionario, NomeFuncionario " &_ 
							"FROM Funcionario " &_ 
							"WHERE idTipoFuncionario = 3 "
							
						 Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("IdGuia")<>"" Then
							  If rsSelect("AlocarRecurso") = Request.Form("IdGuia") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("IdFuncionario")%>" <%=Selecao%>><%=rsSelect("NomeFuncionario")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>		
        </div>
		<div class="col-md-4 mb-3">
          <label for="validationDefault01">Motorista</label>
          <select class="form-control" name="IdMotorista" id="IdMotorista" >
          <option value=""><%=rsAlocarRecurso("NomeM")%></option>
          <%
                         SqlSelect = "select IdFuncionario, NomeFuncionario " &_ 
							"FROM Funcionario " &_ 
							"WHERE idTipoFuncionario = 4 "
							
						 Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("IdMotorista")<>"" Then
							  If rsSelect("AlocarRecurso") = Request.Form("IdMotorista") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("IdFuncionario")%>" <%=Selecao%>><%=rsSelect("NomeFuncionario")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>		
        </div>
        <div class="col-md-4 mb-3">
		  <label for="validationDefault02">Tipo Veiculo</label>
		  <select class="form-control" name="idVeiculoTipo" id="idVeiculoTipo" >
          <option value=""><%=rsAlocarRecurso("tipo")%></option>
                    <%
                         SqlSelect = "SELECT DISTINCT tipoVeiculo " &_ 
							"FROM Veiculo " 
							
						 Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("idVeiculoTipo")<>"" Then
							  If rsSelect("AlocarRecurso") = Request.Form("idVeiculoTipo") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("tipoVeiculo")%>" <%=Selecao%>><%=rsSelect("tipoVeiculo")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>	
        </div>
		<div class="col-md-4 mb-3">
		  <label for="validationDefault02">Veiculo</label>
		  <select class="form-control" name="idVeiculo" id="idVeiculo" >
          <option value=""><%=rsAlocarRecurso("placa")%></option>
                    <%
                         SqlSelect = "SELECT idVeiculo, placa " &_ 
							"FROM Veiculo " 
							
						 Set rsSelect = Conn.Execute(SqlSelect)
                         Do While Not rsSelect.EOF
						  If Request.Form("idVeiculo")<>"" Then
							  If rsSelect("AlocarRecurso") = Request.Form("idVeiculo") Then Selecao = "selected" Else Selecao = "" End If
						  End If
                          %>
                                 <option value="<%=rsSelect("idVeiculo")%>" <%=Selecao%>><%=rsSelect("placa")%></option>
          <%
                         rsSelect.MoveNext
                         Loop
                         rsSelect.Close
                         Set rsSelect = Nothing
          %>
         </select>	
        </div>
        </div>
		<div class="col-md-4 mb-3">
		  <label for="validationDefault02">Data Passeio</label>
		  <input name="Tipo" type="text" class="form-control text-center" id="IdTipo" maxlength="14" disabled="True" value="<%=rsAlocarRecurso("DataP")%>">
          </input>
        </div>
		
        <div class="col-md-4 mb-3"></div>
            
        <input type="hidden" name="IdPasseio" value="<%=rsAlocarRecurso("IdPasseio")%>">
        <input type="hidden" name="Action" value="Alterar">
    	<button class="btn btn-primary" type="submit">Salvar</button>
    </form>
	<form action="<%=Request.ServerVariables("HTTP_REFERER")%>" method="post">
    	<button class="btn btn-warning ml-1 float-left" type="submit">Cancelar</button>
    </form>
  </div>
</div>
</body>
</html>