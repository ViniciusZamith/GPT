<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

totalPreco = (CDbl(Request("PrecoAdt")) * int(Request("qtdAdt")) + (CDbl(Request("PrecoCri")) * int(Request("qtdCri")) ))
totalQtd = int(Request("qtdAdt")) + int(Request("qtdCri"))

Set rsCliente = server.CreateObject("ADODB.RECORDSET")

SqlLista = "Select * from Cliente where idUsuario = " & Session("IdUsuario")
rsCliente.open SqlLista, conn

If Request("Action") = "Reserva" then
    sqlReserva = "INSERT INTO gptmysql.Reserva (quantidadeClientes) VALUES (" &_
    totalQtd & ");"

    Conn.execute sqlReserva

    set rsReserva = server.CreateObject("ADODB.RECORDSET")

    Sql = "Select * from Reserva where idReserva = LAST_INSERT_ID()"
    rsReserva.open Sql, conn

    sqlReservaPasseio = "INSERT INTO gptmysql.ReservaPasseio (IdReserva, IdPasseio) VALUES (" &_
    rsReserva("idReserva") & ", " & Request("IdPasseio") & ");"

    Conn.execute sqlReservaPasseio

    sqlReservaCliente = "INSERT INTO gptmysql.ReservaCliente (IdReserva, IdCliente) VALUES (" &_
    rsReserva("IdReserva") & ", " & rsCliente("IdCliente") & ");"

    Conn.execute sqlReservaCliente

    sqlPagamento = "INSERT INTO gptmysql.Pagamento (valor, statusPagamento, tipoPagamento, idReserva)" &_
    "VALUES (" & totalPreco & ", 'PENDENTE', 'PagSeguro', " & rsReserva("IdReserva") & ");"

    Response.Write ("<br>" & sqlPagamento & "<br>")

    Conn.execute sqlPagamento

    Response.redirect("Pagamento.asp")

end if

Conn.close
Set Conn = nothing
%>