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
        #Box {
            border: 1px solid red;
            width:400px;
        }

        p {
            width:200px;
            margin-left: 40%;
            display: block;
        }

        dl dt {
            margin-left: 0;
        }
    </style>
<body>

    <script>
        $('#ExemploModalCentralizado').modal('show')
    </script>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado">
  Abrir modal de demonstração
</button>

    <!-- Modal -->
    <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="TituloModalCentralizado">Pagamento efetuado com sucesso!</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
            <span>&times;</span>
            </button>
        </div>
        <div class="modal-body">
            ...
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