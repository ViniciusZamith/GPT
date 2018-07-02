<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" --> 
<%

Manutencao="NÃO"
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
If Manutencao<>"SIM" Then
	response.Redirect("Login.asp")
End If

%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file="../Includes/Head.asp" --> 
</head>
<body>
    <div class="container">

        <header id="header">
                    
        </header>

        <div class="well text-center">
            <h3>Administração GPT</h3>
            <br />
            <img src="Imagens/logo.png" width="600" height="320">
        </div>

    </div>
</body>
</html>
