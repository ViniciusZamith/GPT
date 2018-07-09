<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file = "Includes/Connect.asp" --> 
<!--#INCLUDE file = "Includes/Funcoes.asp" -->
<%

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

If Request.QueryString("Id_Pagamento") <> "" then

	SqlPagamento = "UPDATE Pagamento set tokenPagSeguro = '" & Request.QueryString("Id_Pagamento") & "'" &_
	" where IdPagamento = (Select Top 1 IdPagamento from Pagamento order by IdPagamento desc)"
	
	'Response.Write("<br>SqlPagamento: " & SqlPagamento)
	Conn.execute SqlPagamento
	
	Response.redirect("Index.asp")

end if

%>
<!doctype html>
<html>
<head>
   <!--#INCLUDE file = "Includes/Head.asp" -->
   <style>
   	#imgSlide {
		height: 700px;
	}
   </style> 
</head>
<body>
	<!--#INCLUDE file="MenuNavegacao.asp" -->         
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img id="imgSlide" class="d-block w-100" src="Imagens/bibliotecaNacionalSlide.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>"Muito bom o passeio, realmente enriquecedor."</h5>
                    <p>- Lucas Souza </p>
                </div>
            </div>
            <div class="carousel-item">
                <img id="imgSlide" class="d-block w-100" src="Imagens/museuDoAmanhãSlide.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>"O futuro é bem melhor do que eu imaginava, impressionante!"</h5>
                    <p>- Victor Cezar </p>
                </div>
            </div>
            <div class="carousel-item">
                <img id="imgSlide" class="d-block w-100" src="Imagens/mamSlide.jpg" alt="Museu de Arte Moderna">
                <div class="carousel-caption d-none d-md-block">
                    <h5>"O guia conhece cada canto do museu, perguntei sobre tudo!"</h5>
                    <p>- Breno Baronte </p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Próximo</span>
        </a>
    </div>
    <div class="container">
    </div>
<br />
</body>
</html>
<%

Conn.close
Set Conn = nothing
%>
