<%
	
	If Session("ID") <> Session.SessionID then Response.Redirect("index.asp")
	If Session("TipoUsuario") <> "3" then Response.Redirect("index.asp")

%>

<nav class="navbar navbar-expand-lg navbar-light "style="background-color: #0075a2; padding: 0px; height: 32px;">
<div class="container">
<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  <div class="navbar-nav d-flex justify-content-around" style="font-size: 14px; width: 80%;">
      <a class="nav-item nav-link active" style="color: white;" href="../Index.asp">Home</a> <a
          class="nav-item nav-link active" style="color: white;" href="../RoteiroMenu.asp">Roteiros</a> <a
          class="nav-item nav-link active" style="color: white;" href="../HoteisConveniados.asp">Hotéis Conveniados</a> <a
          class="nav-item nav-link active" style="color: white;" href=../"Help.asp">Ajuda</a>
      	<div class="dropdown">
  			<a class="btn btn-info btn-sm dropdown-toggle mt-1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    			Configurações
  			</a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a class="dropdown-item" href="../admin/Passeio.asp">Passeio</a>
            <a class="dropdown-item" href="../admin/AlocarRecursos.asp">Recurso</a>
            <a class="dropdown-item" href="../admin/Roteiro.asp">Roteiro</a>
            <a class="dropdown-item disabled" href="../admin/Relatorio.asp">Relatório</a>
            </div>
		</div>
  </div>
</div>
</div>
</nav>

<!-- Segunda Barra de navegação -->

<nav class="navbar navbar-light" style="background-color: #0caadc;"> <!-- Cor original logo #8bb7f0 -->
    <div class="container">
        <a class="navbar-brand"><img alt="logo gpt"
          src="../Imagens/logo.png"
          width="48" height="76"></a>
        <form class="form-inline ml-auto">
          <input class="form-control mr-sm-2" type="search"
              placeholder="Procure por passeios ou pontos turísticos..."
              aria-label="Search" style="width: 450px;">
          <button class="btn btn-warning my-2 my-sm-0" type="submit"><i class="far fa-search"></i>&nbsp;Buscar</button>
        </form>
        
        <a class="nav-item nav-link ml-auto" href="/GPT"> 
        <i class="fas fa-user fa-2x" style="color:black;"></i>
        </a>
        <div class="navbar-nav" style="display: block; padding: 0px;">
            <a class="nav-link active" style="padding:0px;">Olá&nbsp;<%=Session("NomeUsuario")%>!</a>
            <a class="nav-link" href="Logout.asp" style="padding: 0px;">Sair</a>
		</div>
    </div>
</nav>
<div style="width: 100%;height: 5px; background-color: #ff5964"></div>
