<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

%>
<%

         'Habilitando manipulação de erros'
         On Error Resume Next

         'Classe PagSeguro'
         Class PagSeguroPaymentRequest

                   Public function registerPayment(email, token, postData)

                            'Definindo as variaveis utilizadas na função'
                            Dim url,apiPagSeguro, retornoPagSeguro, retorno

                            url = "https://ws.sandbox.pagseguro.uol.com.br/v2/checkout?email=" & email & "&token=" & token

                            'Criando o objeto de conexão e retorno'
                            set apiPagSeguro = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
                            set retornoPagSeguro = Server.CreateObject("MSXML2.DomDocument.3.0")

                            'Definindo a url de conexão'
                            apiPagSeguro.open "POST", url, false

                            'Definindo o cabeçalho'
                            apiPagSeguro.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"

                            'Enviando as informações'
                            apiPagSeguro.send postdata

                            'Recuperando a informação de retorno'
                            retornoPagSeguro.LoadXML(apiPagSeguro.ResponseText)
                            
                            'Verificando se a resposta da chamada é um Unauthorized ou se é um Code'
                            If apiPagSeguro.responseText = "Unauthorized" Then
                            response.write "As credenciais estão incorretas. Verifique por favor"

                            ElseIf Len(CStr(retornoPagSeguro.selectSingleNode("/checkout/code").Text)) = 32 Then
                                      response.write "<a href='https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=" & CStr(retornoPagSeguro.selectSingleNode("/checkout/code").Text) & "'> Link para o pagamento <a></a>"
                            End If

                            'Em caso de erros é executado este trecho'
                            If Err.Number <> 0 Then
                                      response.write "Erro Encontrado <br>" & CStr(retornoPagSeguro.Text) 
                            End If
                            
                            'Finalizando os objetos'
                            set apiPagSeguro = nothing
                            set retornoPagSeguro = nothing

                   end function

         End Class

'*************************************************************************************'
         


         'Definindo as variáveis utilizadas no processo'
         Dim email, token, postdata, psObj

         'Definindo os valores das credenciais e montando a URL'
         email = "vinicius.zamith@uniriotec.br"
         token = "34EF8038244842C4AFB5B4A4EA110575"
         
         
         'Definindo os valores do post'
         postdata = postdata & "currency=BRL"
         postdata = postdata & "&itemId1=0001"
         postdata = postdata & "&itemDescription1=Notebook Prata"
         postdata = postdata & "&itemAmount1=24300.00"
         postdata = postdata & "&itemQuantity1=1"
         postdata = postdata & "&itemWeight1=1000"
         postdata = postdata & "&itemId2=0002"
         postdata = postdata & "&itemDescription2=Notebook Rosa"
         postdata = postdata & "&itemAmount2=25600.00"
         postdata = postdata & "&itemQuantity2=2"
         postdata = postdata & "&itemWeight2=750"
         postdata = postdata & "&reference=REF1234"
         postdata = postdata & "&senderName=Jose Comprador"
         postdata = postdata & "&senderAreaCode=11"
         postdata = postdata & "&senderPhone=56273440"
         postdata = postdata & "&senderEmail=c21259707305409864095@sandbox.pagseguro.com.br"
         postdata = postdata & "&shippingType=1"
         postdata = postdata & "&shippingAddressStreet=Av. Brig. Faria Lima"
         postdata = postdata & "&shippingAddressNumber=1384"
         postdata = postdata & "&shippingAddressComplement=5o andar"
         postdata = postdata & "&shippingAddressDistrict=Jardim Paulistano"
         postdata = postdata & "&shippingAddressPostalCode=01452002"
         postdata = postdata & "&shippingAddressCity=Sao Paulo"
         postdata = postdata & "&shippingAddressState=SP"
         postdata = postdata & "&shippingAddressCountry=BRA"

         set psObj = new PagSeguroPaymentRequest

%>

<html>
<head><title>Exemplo de Integração API de Pagamentos - ASP Clássico</title>
<body>
<h1>Exemplo de Integração API de Pagamentos - ASP Clássico</h1>
<p>Abaixo é exibido o retorno do PagSeguro:</p>

<%
         'Chamando a função registerPayment passando os parâmetros'
         psObj.registerPayment email, token, postdata
%>

</body>
</head>
</html>
<%

Conn.close
Set Conn = nothing
%>
