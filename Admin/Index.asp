<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "../Includes/Connect.asp" --> 
<!--#INCLUDE file = "../Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

If Request.QueryString("Id_Pagamento") <> "" then

	SqlPagamento = "UPDATE Pagamento set tokenPagSeguro = '" & Request.QueryString("Id_Pagamento") & "'" &_
	" where IdPagamento = (Select Top 1 IdPagamento from Pagamento order by IdPagamento desc)"
	
	'Response.Write("<br>SqlPagamento: " & SqlPagamento)
	Conn.execute SqlPagamento
	
	Response.redirect("Home.asp")

end if

If Request("Action") = "Logar" then

    Response.redirect("Home.asp")

end if

Response.redirect("Login.asp")

Conn.close
Set Conn = nothing
%>