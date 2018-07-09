<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" --> 
<%
	
%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file="../Includes/Head.asp" --> 
</head>
<body>
<%If Session("TipoUsuario") <> 1 then %>
<!--#INCLUDE file="../Admin/MenuEsp.asp" -->
<%else%>
<!--#INCLUDE file="../Admin/MenuAdmin.asp" -->
<%end if%>

    <div class="container">

        <h1>Acesso Negado</h1>
        <img src="../Imagens/accessDenied.png" width="240" height="240" alt="Acesso Negado">
        <p>

    </div>
</body>
</html>
