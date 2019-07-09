<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

If Request.QueryString("Id_Pagamento") <> "" then

	SqlPagamento = "UPDATE gptmysql.Pagamento set tokenPagSeguro = '" & Request.QueryString("Id_Pagamento") & "'" &_
	" where idPagamento = (Select pag from (Select idPagamento as pag from gptmysql.Pagamento order by idPagamento desc limit 1) as p)"
	
	Response.Write("<br>SqlPagamento: " & SqlPagamento)
	Conn.execute SqlPagamento

end if

%>
<!doctype html>
<html>
    <head>
    <!--#INCLUDE file = "Includes/Head.asp" --> 
    </head>

    <style>
        .success-container {
            width: 100vw;
            height: 100vh;
            text-align: center;
        }

        .payment-success-container {
            width: 80%;
            height: 30%;
            border: 1px solid #eaeaea;
            display: inline-block;
            position: relative;
        }

        .btn-primary {
            align-items: center;
            display: inline-block;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
            height: 50%;
            position: absolute;
            left: 50%;
            bottom: 10%;
            margin-left: -50%;
            text-align: center;
        }

        .payment-success-text {
            line-height: 3;
            display: contents;
            width: 100%;
            font-size: 28px;
            font-family: "Helvetica Neue", Arial;
            color: black;
            font-weight: bold;
        }

        .link-redirect, .link-redirect:hover {
            color: white;
        }
 
    </style>
<body>

    
    <!--#INCLUDE file="MenuNavegacao.asp" --> 
    <script>
        $('#ExemploModalCentralizado').modal('show')
    </script>
    <div class="success-container">
        <%
            Set rsCliente = server.CreateObject("ADODB.RECORDSET")

            SqlSelecionado = "Select * from Cliente where idUsuario = " & Session("IdUsuario")
            rsCliente.open SqlSelecionado, conn		
        %>

        <%
            Set rsReservaPasseio = server.CreateObject("ADODB.RECORDSET")

            Sql = "Select * from Passeio where idPasseio = (Select idPasseio from ReservaPasseio where idReserva = (Select idReserva from Reserva where idReserva = LAST_INSERT_ID()))"
            rsReservaPasseio.open Sql, conn
        %>
        <div class="payment-success-container">
            <span class="payment-success-text">Parabéns <%=rsCliente("NomeCliente")%>, sua reserva foi feita com sucesso!</span>
            <div class="button-container">
                <div CLASS="button-reservation">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado">
                        Clique aqui para ver as informações da reserva!
                    </button>
                </div>
                <div class="button-redirect">
                    <button type="button" class="btn btn-primary">
                        <a class="link-redirect" href="/index.asp">Voltar para página principal</a>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="TituloModalCentralizado"><b>Pagamento efetuado com sucesso!</b> <br /> Informações da reserva:</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="client-information">
                        <div>
                            <span class="client-name">Nome: <%=rsCliente("NomeCliente")%></span>
                        </div>
                        <div>
                            <span class="client-email">Email: <%=rsCliente("EmailCliente")%></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>