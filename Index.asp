<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file = "Includes/Head.asp" --> 
</head>

<style>

</style>

<body>
      <header id="topo" class="col-md-12 text-center form-row container-fluid">
      </header>
		<!--#INCLUDE file="MenuNavegacao.asp" --> 
        <br />
        <div class="container">
        <div class="card">
        	<div class="card-header">TESTE CARD</div>
            <div class="card-body">
            	Conteúdo principal da página
            </div>
        </div>
        </div>
<br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
