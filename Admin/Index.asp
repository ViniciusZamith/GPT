<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" --> 
<%

Manutencao="NÃO"
<<<<<<< HEAD
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
=======

>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
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
<<<<<<< HEAD
            <h3>Administração GPT</h3>
            <br />
            <img src="Imagens/logo.png" width="600" height="320">
=======
            <h3>SISTEMA DE INSCRIÇÃO</h3>
            <br />
            <img src="Imagens/Manutencao.jpg" width="600" height="320">
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
        </div>

    </div>
</body>
</html>
