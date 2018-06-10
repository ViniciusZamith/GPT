<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<!DOCTYPE html>

<head>
<!--#INCLUDE file="../Includes/Head.asp" -->
</head>

<body>

<!--#INCLUDE file="../Admin/MenuAdmin.asp" -->

<div class="container mt-3">
<div class="card text-center">
  <div class="card-header">
    <h1>Clientes</h1>
  </div>
  <div class="card-body">
  	<!-- Busca -->
    
    <h3>Buscar Cliente</h3>
    <br />
    
    <form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
                  <input type="hidden" name="Action" id="IdAction" value="Busca">
                  
                  <div class="form-row">
                      <div class="form-group col-6">
                          <label for="IdNome">Nome</label>
                          <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
                      </div>
                      
                      <div class="form-group col-2">
                          <label for="IdLogin">Login</label>
                          <input name="Login" type="text" class="form-control text-center" id="IdLogin" placeholder="Login" maxlength="12" value="">
                      </div>                                         
                      
                      <div class="form-group col-4">
                          <label for="IdTipo">E-mail</label>
                          <input name="Tipo" type="text" class="form-control text-center" id="IdEmail" placeholder="Email" maxlength="14" value="">
                      </div>
                      
                      <div class="form-group col text-right">
                      	  <hr>
                          <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
                       
                          <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
                      </div>  
                  </div></form>
    
    <!-- Table -->
    
    <h3>Lista de Clientes</h3>
    <br />
    
    <table class="table table-bordered table-hover table-responsive">
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Nome</th>
           	<th class="align-middle text-center">Login</th>
            <th class="align-middle text-center">Senha</th>
            <th class="align-middle text-center">E-mail</th>
            <th class="align-middle text-center"></th>
            <th class="align-middle text-center"></th>
        </tr>
    </thead>
    <tbody>
    	<%
    		SqlLista = "Select * from Cliente"
			Set rsCliente = server.CreateObject("ADODB.RECORDSET")
			rsCliente.open SqlLista, conn
			
			if not (rsCliente.bof and rsCliente.eof) then
			do while not rsCliente.eof
				Set rsTipo = Conn.Execute("Select * from TipoPasseio where IdTipo = " & rsPasseio("IdTipoPasseio"))
				DescTipo = rsTipo("DescricaoTipo")
				rsTipo.Close
				Set rsTipo = Nothing
    	%>
    	<tr>
        	<td><small></small></td>
            <td><small></small></td>
            <td><small></small></td>
            <td><small></small></td>
        	<td class="align-middle text-center">
            	<form action="CandidatoVisualiza.asp" method="post">
                      <input type="hidden" name="IdInscricao" value="2">
                      <input type="hidden" name="Inscricao" value="201800100002"> 
                      <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">                              
                      <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">                                                            
                      <input type="hidden" name="Action" value="Visualiza">
                      <button type="submit" class="btn btn-primary btn-sm" id="botao">
                        <i class="far fa-edit"></i>&nbsp;Editar
                      </button>
                </form>
             </td>
             <td class="align-middle text-center">
            	<form action="CandidatoVisualiza.asp" method="post">
                      <input type="hidden" name="IdInscricao" value="2">
                      <input type="hidden" name="Inscricao" value="201800100002"> 
                      <input type="hidden" name="SqlBusca" value="Select Top(50) * from vwCandidato where 1=1  Order by IdInscricao">                              
                      <input type="hidden" name="SqlCount" value="Select  Count(*) as Total  from vwCandidato where 1=1 ">                                                            
                      <input type="hidden" name="Action" value="Visualiza">
                      <button type="submit" class="btn btn-danger btn-sm" id="botao">
                        <i class="far fa-trash-alt"></i>&nbsp;Excluir
                      </button>
                </form>
             </td>
        </tr>
    </tbody>
  </div>
</div>
</body>
</html>