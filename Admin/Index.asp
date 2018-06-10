<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" --> 
<%

Manutencao="NÃO"

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
            <h3>SISTEMA DE INSCRIÇÃO</h3>
            <br />
            <img src="Imagens/Manutencao.jpg" width="600" height="320">
        </div>

    </div>
</body>
</html>
