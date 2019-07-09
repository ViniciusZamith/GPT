<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="../Includes/Connect.asp" --> 
<!--#INCLUDE file="../Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

If Request("Action") = "Logar" Then
	If Request("Login")="" or Request("Senha")="" Then
		ErroBranco = "S"
	Else
		ErroBranco = "N"
	End If
	
	If ErroBranco="N" then
		Set rsUsuario = Server.CreateObject("ADODB.Recordset")
		SqlUsuario = "Select * from Usuario where LoginUsuario ='" & Replace(request("Login"),"'","''") & "' and Senha = '" & Request("Senha") & "'" &_
		"and Tipo <> 2"
		rsUsuario.Open SqlUsuario , Conn
		
	'	Response.Write ("<br>" & SqlUsuario & "<br>")
	
		If Not(rsUsuario.EOF and rsUsuario.BOF) Then
				Logado="S"
				Session("IdUsuario") = rsUsuario("IdUsuario")
				Session("LoginUsuario") = rsUsuario("LoginUsuario")				
				Session("NomeUsuario") = rsUsuario("NomeUsuario")
				Session("TipoUsuario") = rsUsuario("Tipo")
				Session("ID") = Session.SessionID		
	'			Response.Write("<br>LOGADO<br>")

				if rsUsuario("Tipo") = "1" then
					Response.Redirect("passeio.asp")
				else
					Response.Redirect("AlocarRecursos.asp")
				end if		
		Else
			Logado="N"
			ErroUsuario = "S"
			Session.Abandon	
		End If
		
		rsUsuario.close
		set rsUsuario = nothing
	
	Else
			Logado="N"
			Session.Abandon	
	End If
End If
%>
<!doctype html>
<html>
<head>
    <!--#INCLUDE file="../Includes/Head.asp" --> 
</head>

<style>
	
</style>

<body>

<div class="container">
  <br /><br />
  <div class="row">
  	<div class="col"></div>
    <div class="card col-4">
        <form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" role="login" name="FormLogin" id="IdFormLogin" class="needs-validation" novalidate>        
              <br />
              <div class="text-center">
              <i class="fa fa-users fa-5x"></i>
    		  </div>
              <hr>
              <h4><p class="text-center text-secondary"><strong>GPT <br> Área Administrativa</strong></p></h4>
              <hr>
          	  <input type="hidden" name="Action" value="Logar">
              <div>
                  <div class="form-group text-left">
                      <label for="IdLogin">Nome do Usuario</label>
                      <input type="text" class="form-control" id="IdLogin" name="Login" 
                      placeholder="Nome do Usuario" maxlength="20" value="<%=Request.Form("Login")%>" required autofocus>
                  </div>
                  <div class="form-group text-left">  
                      <label for="IdSenha">Senha</label>                      
                      <input type="password" class="form-control" id="IdSenha" name="Senha" 
                      placeholder="Senha" maxlength="12" value="<%=Request.Form("Senha")%>" required>
                  </div>
                  <br>
                  <div class="form-group">
                  <button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fa fa-sign-in"></i>&nbsp;Entrar</button>
                  </div>
              </div>
              
				<%'CAMPOS EM BRANCO 
				If ErroBranco = "S" Then %>
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                  <strong>ATENÇÃO!</strong> Formulário com campos obrigatórios em branco.
                </div>
                <% End If %>
				<%'CAMPOS EM BRANCO 
				If ErroBranco = "N" and Logado = "N" Then %>
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                  <strong>ATENÇÃO!</strong> <br>Erro ao logar no sistema, Login ou Senha inválidos. <br>Verifique seus dados e tente novamente.
                </div>
                <% End If %>
                <hr>
                <div class=" text-center">
	                <img src="../Imagens/logo.png" class="img-responsive" width="10%" alt="gpt"  title="gpt">
                </div>
                <br />
        </form>
      </div>
  	  <div class="col"></div>
  </div>
</div>
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
