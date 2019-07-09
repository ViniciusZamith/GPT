<nav class="navbar navbar-expand-lg navbar-light "style="background-color: #0075a2; padding: 0px; height: 32px;">
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav d-flex justify-content-around" style="font-size: 14px; width: 50%;">
              <a class="nav-item nav-link active" style="color: white;" href="../Index.asp">Home</a> 
              <a class="nav-item nav-link active" style="color: white;" href="../RoteiroMenu.asp">Roteiros</a> 
              <a class="nav-item nav-link active" style="color: white;" href="../PasseioMenu.asp">Passeios</a> 
              <a class="nav-item nav-link active" style="color: white;" href="../HoteisConveniados.asp">Hotéis</a> 
              <a class="nav-item nav-link active" style="color: white;" href="">Ajuda</a>
          </div>
          <div class="navbar-nav d-flex justify-content-end" style="width: 100%;">
              <a class="nav-item nav-link" href="/GPT">
                  <i class="fa fa-shopping-cart"></i>
              </a>
              <span class="navbar-text mr-5" style="color: #ffffff">
                  0
              </span>
          </div>
        </div>
    </div>
</nav>

<!-- Segunda Barra de navegação -->

<nav class="navbar navbar-light" style="background-color: #0caadc;"> <!-- Cor original logo #8bb7f0 -->
    <div class="container">
        <a class="navbar-brand" href="Index.asp"><img alt="logo gpt"
          src="../Imagens/logo.png"
          width="48" height="76"></a>
        <form class="form-inline ml-auto">
          <input class="form-control mr-sm-2" type="search"
              placeholder="Procure por passeios ou pontos turísticos..."
              aria-label="Search" style="width: 450px;">
          <button class="btn btn-warning my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>&nbsp;Buscar</button>
        </form>
        
        <a class="nav-item nav-link ml-auto" href="/GPT"> 
        	<i class="fa fa-user fa-2x" style="color:black;"></i>
        </a>
		<%
            if not (Session("ID") = Session.SessionID) then
        %>
        <div class="navbar-nav" style="display: block; padding: 0px;">
          <a class="nav-link" href="Login.asp" style="padding: 0px;">Entrar</a> <a
              class=" nav-link" href="" style="padding: 0px">Cadastre-se</a>
        </div>
        <%
            else
        %>
        <div class="navbar-nav" style="display: block; padding: 0px;">
            <a class="nav-link active" style="padding:0px;">Olá&nbsp;<%=Session("NomeUsuario")%>!</a>
            <a class="nav-link" href="Logout.asp" style="padding: 0px;">Sair</a>
        </div>
        <%
            end if
        %>
    </div>
</nav>
<div style="width: 100%;height: 5px; background-color: #ff5964"></div>
