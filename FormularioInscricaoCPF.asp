<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

'If Session("ID") <> Session.SessionID then Response.Redirect("index.asp")

If Request("Action") = "CarregaSessao" Then
	Session("IdConcurso") = Request("IdConcurso")  
	Session("Edital") = Request("Edital")
End If


Session("FimRecurso") = "SIM"
Session("ExibeRecurso") = "SIM"

Session("ExibeQuestao") = "SIM" 

Session("VerImagem") = "NÃO"
Session("EnderecoImagem") = "ImagemCartoes/"
Session("MultiplosCabecalhos") = "NÃO"

Session("TabelaLogin") = "InscCompleta"
Session("TabelaDados") = "InscCompleta"
Session("TabelaCandidato") = "InscCompleta"

Session("TabelaRecurso") = "RecursoProvaOBJ"
Session("TabelaRecursoResultado") = "RecursoProvaOBJResultado"

Session("TituloPagina") = "TRE - Recurso Prova Objetiva"

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

PaginaConfirma = "PAGINAINICIAL"	
	
If Request("Action") = "VerificaCPF" Then

	If Request("CPF")="" or Request("DataNascimento")="" Then
		ErroBranco = "S"
		Erro = "Campos obrigatórios em branco."
		Branco = "is-invalid"
	Else
		ErroBranco = "N"
		Branco = "is-valid"		
	End If
	
	If isDate(Request("DataNascimento")) Then
		DataValida = "S"
		Data = "is-valid"		
	Else
		DataValida = "N"
		Erro = "Data de nascimento inválida."
		Data = "is-invalid"
	End If

	If ValidaCPF(Request("CPF")) Then
		CPFValido = "S"
		CPF = "is-valid"		
	Else
		CPFValido = "N"
		Erro = "CPF inválido."
		CPF = "is-invalid"
	End If
	
'	Response.Write("<br>CPF: " & Request("CPF"))
'	Response.Write("<br>ErroBranco: " & ErroBranco)
	
	If ErroBranco="N" and DataValida = "S" and CPFValido = "S" then
		SqlCandidato = "Select * from " & Session("TabelaLogin") & " Where CPF = '" & Replace(Request("CPF"),"'","''") & "'"
'		Response.Write("<br>SQLCandidato: " & SqlCandidato)
		Set rsCandidato = Conn.Execute(SqlCandidato)
	
		Session("Id") = Session.SessionID

		If Not(rsCandidato.EOF and rsCandidato.BOF) Then
	'		Response.write("<br> Data Request: " & cDate(Request("DtNascimento")))
	'		Response.write("<br> Data Banco: " & cDate(rsCandidato("DtNasc")))
					
			CpfCadastrado = "S"
			If cDate(Request("DataNascimento")) = cDate(rsCandidato("DtNasc")) Then
				Logado = "S"
				Session("Logado") = "Logado"
				Session("CPF") = rsCandidato("CPF")
				Response.Redirect("FormularioInscricaoLista.asp?CPF=" & rsCandidato("CPF") & "&Isencao=" & Isencao)
			Else
				Logado = "N"
			End If
		Else
			CpfCadastrado = "N"
			Logado = "N"
		End If
		
	Else
		CpfCadastrado = "N"
		Logado = "N"
	End If
	
'Verificar CPF	
End If
%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file = "Includes/Head.asp" --> 
</head>

<style>

</style>

<body>
    <div class="container">
      <header id="topo" class="col-md-12 text-center form-row container-fluid">
            <!--#INCLUDE file="MenuInscricao.asp" --> 
      </header>
      <br />

<%
Select Case PaginaConfirma
	Case "PAGINAINICIAL"
%>    
        <div class="card border-secondary">
        	<div class="card-header alert alert-success">
            <strong>
			<%
			If Isencao = "SIM" Then Response.Write("SOLICITAÇÃO DE ISENÇÃO - ")
			%>
            Validação do CPF e Data de Nascimento</strong> (Digite seu CPF e sua Data de Nascimento)
            </div>
            <div class="card-body">
            
            <% If Erro<>"" Then %>
            <div class="alert alert-danger alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Erro%>
            </div>
            <% End If %>
            
            <% If Atencao<>"" Then %>
            <div class="alert alert-warning alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Atencao%>
            </div>
            <% End If %>

            <% If Informacao<>"" Then %>
            <div class="alert alert-success alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Informacao%>
            </div>
            <% End If %>
            
            <fieldset class="ModeloFieldset">
            	<br>

            	<form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post" if="IdFormTipoCandidato" name="FormTipoCandidato" class="needs-validation" novalidate>

                	<input type="hidden" name="IdConcurso" value="<%=Request("IdConcurso")%>">
                    <input type="hidden" id="IdEdital" name="Edital" value="<%=Request("Edital")%>">
                    <input type="hidden" name="Isencao" value="<%=Isencao%>">
                	<input type="hidden" name="Action" value="VerificaCPF">                    
                    
                    <div class="form-row col-12">
                        <div class="col-3 text-left">
                          <label for="IdCPF"><strong>CPF</strong></label>
                          <input type="text" class="form-control <%=CPF & Data & Branco%> text-center MaskCPF" id="IdCPF" name="CPF" placeholder="Digite o CPF" 
                          	value="<%=Request("CPF")%>" required>
                        </div>
                        <div class="col-1">&nbsp;</div>
                        <div class="col-3 text-left">
                          <label for="IdData"><strong>Data de Nascimento</strong></label>
                          <input type="text" class="form-control <%=CPF & Data & Branco%> text-center MaskData" id="IdDataNascimento" name="DataNascimento" 
                          	placeholder="Digite a Data de Nascimento" value="<%=Request("DataNascimento")%>" required>
                        </div>

                        <div class="col text-right align-content-center">
							<br />

							<button type="submit" class="btn btn-primary m-2">&nbsp;Continuar&nbsp;<i class="far fa-arrow-circle-right"></i></button>
                            <a href="Logout.asp" target="_self" class="btn btn-danger m-2 float-right">
                                <i class="far fa-sign-out-alt"></i>&nbsp;Sair
                            </a>

                        </div>
                    </div>
                 </form>
            </fieldset>
            </div>
        </div>
</div>
<%
	Case "ERRO"
%>
        <div class="card border-danger">
        	<div class="card-header border-danger">
              <strong>Confirmação de opção de inscrição</strong> (Confira os dados selecionados para prosseguir)
            </div>
              
            <div class="card-body">
            
            <% If Erro<>"" Then %>
            <div class="alert alert-danger alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Erro%>
            </div>
            <% End If %>
            
            <% If Atencao<>"" Then %>
            <div class="alert alert-warning alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Atencao%>
            </div>
            <% End If %>

            <% If Informacao<>"" Then %>
            <div class="alert alert-success alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <strong>ATENÇÃO!</strong> <%=Informacao%>
            </div>
            <% End If %>

            <fieldset class="ModeloFieldset">
            	<br>

            <form action="#" method="post" if="IdFormTipoCandidato" name="FormTipoCandidato" class="needs-validation" novalidate>

                    <input type="hidden" name="Edital" value="<%=Edital%>">
                	<input type="hidden" name="IdConcurso" value="<%=IdConcurso%>">
                    <input type="hidden" name="CPF" value="<%=CPF%>">
                    <input type="hidden" name="Isencao" value="<%=Isencao%>">                                                                              
                	<input type="hidden" name="Action" value="Inscricao">                    
                    
                    <div class="col-md-12">
                        <dl>
                        	<div class="row"><dt class="col-2 text-right">Edital</dt><dd class="col text-left"><%=Edital%></dd></div>
	                        <div class="row"><dt class="col-2 text-right">CPF</dt><dd class="col text-left"><%=CPF%></dd></div>
                        </dl>
                    </div>
                    <hr>
                    <div class="form-row col-12">
                        <div class="col-3 text-left">
                          <br />	
                          <a href="SelecionaConcurso.asp" class="btn btn-danger" id="botao" >
                          	<i class="far fa-arrow-circle-left"></i>&nbsp; Voltar</a>
                          <a href="Logout.asp" class="btn btn-warning" id="botao" ><i class="far fa-ban"></i>&nbsp;Cancelar</a>
                        </div>
                        <div class="col-7 text-left">
                        </div>
                        <div class="col-2 text-right align-content-center">
							<br />
							<button type="submit" class="btn btn-primary" disabled>&nbsp;Continuar&nbsp;<i class="far fa-arrow-circle-right"></i></button>
                        </div>
                    </div>
                 </form>
            </fieldset>
            </div>
        </div>
</div>
<%
End Select
%>
<br /><br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
