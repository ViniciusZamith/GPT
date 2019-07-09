<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

if Request("Action") = "Cadastro" then
'	If Request("Login")="" or Request("Senha")="" Then
'		ErroBranco = "S"
'	Else
'		ErroBranco = "N"
'	End If
'	
'	ArrData = Split(Request(DataNascimento),"/")
'	DataGravar = ArrData(2) & "-" & ArrData(1) & "-" & ArrData(0)
	
	'If ErroBranco="N" then	

		SqlCreateUsuario = "INSERT INTO gptmysql.Usuario " &_
							"(NomeUsuario"		&_
							",LoginUsuario"		&_
							",Senha"				&_
							",Tipo"				&_
							",Email)	"				&_
							" VALUES " &_
							"('" & Request("NomeCliente")		& "', "  	&_
							"'" & Request("Login") 				& "', " 	&_
							"'" & Request("Senha") 				& "', " 	&_
							"2" 							 	& ", " 		&_
							"'" & Request("EmailCliente") 		& "');"

    SqlCreateCliente = "INSERT INTO gptmysql.Cliente " 	&_
						  "(NomeCliente" 			&_
						  ",CPFCliente" 			&_
						  ",EmailCliente" 			&_
						  ",DataNascimento" 			&_
						  ",idUsuario)"				&_
						  " VALUES " &_ 
						  "('" & Request("NomeCliente") 		& "', "  	&_
						  "'"	& Request("CPFCliente") 		& "', "  	&_	
						  "'" & Request("EmailCliente") 		& "', "		&_
						  "'" & Request("DataNascimento") & "', "			&_
						  "LAST_INSERT_ID());" 
	
			Response.Write("<br>SqlCreate: " & SqlCreateUsuario)
			Conn.BeginTrans
			
			
			Conn.execute SqlCreateUsuario
      Conn.execute SqlCreateCliente

			If Err.Number <> 0 Then
				ClienteCriado = "N"
				Conn.RollbackTrans
				Erro = "Grava: " & Err.Description & " | " & Err.Number & " | " & Err.Source		
			Else
				Conn.CommitTrans
				ClienteCriado = "S"
				Response.Redirect("Login.asp")
			End If
	'end if
end if
%>
<!doctype html>
<html>
<head>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
   <!--#INCLUDE file = "Includes/Head.asp" -->
   <meta name="google-signin-client_id" content="418448819597-h136epjccq5f69c05smer64h3fssfrks.apps.googleusercontent.com"> 
</head>

<style>

</style>

<body>
		<!--#INCLUDE file="MenuNavegacao.asp" --> 

        
<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1826986794025412',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
  
  
  function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  <%
  IF Request("ID") = "" Then
  %>
  location.href = 'Cadastro.asp?ID=' +  profile.getId() + '&Name=' + profile.getName() + '&URL=' + profile.getImageUrl() + '&Email=' + profile.getEmail();
  <%
  End If
  %>
  $("#NomeCliente").val(profile.getName());
  $("#EmailCliente").val(profile.getEmail());
}

</script>

<%
Response.Write("<br>IdGoogle: " & Request.QueryString("ID"))	
Response.Write("<br>NomeGoogle: " & Request.QueryString("Name"))	
Response.Write("<br>URLGoogle: " & Request.QueryString("URL"))	
Response.Write("<br>EmailGoogle: " & Request.QueryString("Email"))	

%>
	
<div class="container mt-3">
	<h3 class="bg-light mt-2">Faça o seu cadastro</h3>
<br />
<% 		
   																					 
%>
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" name="FormCadastro" id="IdFormCadastro" class="needs-validation" novalidate>
		<input type="hidden" name="Action" value="Cadastro">
              <div class="form-row">
              	  <div class="col-md-4 mb-3 form-group text-left">
                      <label>Nome</label>
                      <input type="text" class="form-control" name="NomeCliente" id = "NomeCliente"
                      placeholder="Nome do Usuario" maxlength="100" value="<%=Request.Form("NomeCliente")%>" required autofocus>
                  </div>
                  <div class="col-md-4 mb-3 form-group text-left">
                      <label>CPF</label>
                      <input type="text" class="form-control MaskCPF" id="CPF" name="CPFCliente" 
                      placeholder="CPF" maxlength="15" value="<%=Request.Form("CPFCliente")%>" required autofocus>
                  </div>
                  <div class="col-md-4 mb-3 form-group text-left">
                      <label>Data Nascimento</label>
                      <input type="date" class="form-control" name="DataNascimento"
                      value="<%=Request.Form("DataNascimento")%>" required autofocus>
                  </div>
               </div>
               <div class="form-row">
                  <div class="col-md-4 mb-3 form-group text-left">
                      <label for="IdLogin">Nome do Usuario</label>
                      <input type="text" class="form-control" id="IdLogin" name="Login" 
                      placeholder="Nome do Usuario" maxlength="20" value="<%=Request.Form("Login")%>" required autofocus>
                  </div>
                  <div class="col-md-4 mb-3 form-group text-left">  
                      <label for="IdSenha">Senha</label>                      
                      <input type="password" class="form-control" id="IdSenha" name="Senha" 
                      placeholder="Senha" maxlength="12" value="<%=Request.Form("Senha")%>" required>
                  </div>
                  <div class="col-md-4 mb-3 form-group text-left">
                      <label>E-mail</label>
                      <input type="text" class="form-control" name="EmailCliente" id = "EmailCliente"
                      placeholder="seuEmail@email.com" maxlength="100" value="<%=Request.Form("EmailCliente")%>" required autofocus>
                  </div>
              </div>
              <div class="form-group">
              	<button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fa fa-sign-in-alt"></i>&nbsp;Cadastrar</button>
              </div>
              </form>
<%'CAMPOS EM BRANCO 
				If ErroBranco = "S" Then 
%>
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
                  <strong>ATENÇÃO!</strong> <br>Erro ao cadastrar no sistema, Login ou Senha inválidos. <br>Verifique seus dados e tente novamente.
                </div>
<% End If %>
		<br />
		<h4>OU</h4>
        <br />
        <h3 class="bg-light mt-2">Cadastre-se com sua rede social favorita!</h3>
        <br />
        <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
        </div>
        <div id="fb-root"></div>
        <br />
        <div class="g-signin2" data-onsuccess="onSignIn"></div>
	</div>
<br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
