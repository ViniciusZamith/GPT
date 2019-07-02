<%
Response.CodePage = 65001 
Response.CharSet = "utf-8" 

'Para formatar as configurações regionais e datas para o idioma americano:
'Session.LCID = 1033

'Para formatar em Português (Brasileiro):
Session.LCID = 1046

DataLocal = Year(Now) & "-" & Month(Now) & "-" & Day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

Fuso = DateAdd("h",-1,Now)
DataFuso = Year(Fuso) & "-" & Month(Fuso) & "-" & Day(Fuso) & " " & Hour(Fuso) & ":" & Minute(Fuso) & ":" & Second(Fuso)

DataGravacao = DataLocal

host   ="187.84.228.118,5003"
usuario="gpt" 
senha  ="Diego9981@2238"
banco  ="gpt"

StrConexao = "Provider=SQLNCLI11;SERVER="&host&";DATABASE="&banco&";UID="&usuario&";PWD="&senha&";"

SET conexao = Server.CreateObject("ADODB.Connection")
 
'On Error Resume Next

conexao.Open StrConexao
If Err.Number <> 0 Then
    response.write "<b><font color='red'> Conexão com o banco Microsoft SQL Server falhou !</font></b>"
    response.write "<BR><BR>"
    response.write "<b>Erro.Description:</b> " & Err.Description & "<br>"
    response.write "<b>Erro.Number:</b> " & Err.Number & "<br>"
    response.write "<b>Erro.Source:</b> " & Err.Source & "<br>"
'Else
'   response.write "<b><font color='blue'> Conexão com o banco '" & banco & "' Microsoft SQL Server estabelecida com sucesso !</font>"
End If

conexao.close
SET conexao = Nothing
%>

