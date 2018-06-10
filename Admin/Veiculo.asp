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
    <h1>Passeios</h1>
  </div>
  <div class="card-body">
  	<!-- Busca -->
    
    <h3>Buscar Passeio</h3>
    <br />
    
    <form method="post" action="/admin/CandidatoLista.asp" name="FrmBuscaCandidato" id="IdFrmBuscaCandidato">
                  <input type="hidden" name="Action" id="IdAction" value="Busca">
                  
                  <div class="form-row">
                      <div class="form-group col-6">
                          <label for="IdNome">Nome</label>
                          <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
                      </div>
                      
                      <div class="form-group col-2">
                          <label for="IdStatus">Status</label>
                          <input name="Status" type="text" class="form-control text-center" id="IdStatus" placeholder="Status" maxlength="12" value="">
                      </div>
                      
                      <div class="form-group col-2">
                          <label for="IdTipo">Tipo</label>
                          <input name="Tipo" type="text" class="form-control text-center" id="IdTipo" placeholder="Tipo" maxlength="14" value="">
                      </div>
                      
                      <div class="form-group col-2">
                      <label for="IdUF">Estado</label>
                      <select class="form-control" id="IdUF" name="Estado">
                          <option value="">Estado</option>
                          
                              <option value="AC">AC</option>
                           
                              <option value="AL">AL</option>
                           
                              <option value="AM">AM</option>
                           
                              <option value="AP">AP</option>
                           
                              <option value="BA">BA</option>
                           
                              <option value="CE">CE</option>
                           
                              <option value="DF">DF</option>
                           
                              <option value="ES">ES</option>
                           
                              <option value="GO">GO</option>
                           
                              <option value="MA">MA</option>
                           
                              <option value="MG">MG</option>
                           
                              <option value="MS">MS</option>
                           
                              <option value="MT">MT</option>
                           
                              <option value="PA">PA</option>
                           
                              <option value="PB">PB</option>
                           
                              <option value="PE">PE</option>
                           
                              <option value="PI">PI</option>
                           
                              <option value="PR">PR</option>
                           
                              <option value="RJ">RJ</option>
                           
                              <option value="RN">RN</option>
                           
                              <option value="RO">RO</option>
                           
                              <option value="RR">RR</option>
                           
                              <option value="RS">RS</option>
                           
                              <option value="SC">SC</option>
                           
                              <option value="SE">SE</option>
                           
                              <option value="SP">SP</option>
                           
                              <option value="TO">TO</option>
                           	
                      </select>
                      </div>
                      
                      <div class="form-group col text-right">
                      	  <hr>
                          <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
                       
                          <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
                      </div>  
                  </div></form>
    
    <!-- Table -->
    
    <h3>Lista de Passeios</h3>
    <br />
    
    <table class="table table-bordered table-hover table-responsive">
    <thead class="bg-secondary text-white">
    	<tr>
        	<th class="align-middle text-center">Nome</th>
           	<th class="align-middle text-center">Descrição</th>
            <th class="align-middle text-center">Status</th>
            <th class="align-middle text-center">Mínimo</th>
            <th class="align-middle text-center">Máximo</th>
            <th class="align-middle text-center">Início</th>
            <th class="align-middle text-center">Fim</th>
            <th class="align-middle text-center">Tipo</th>
            <th class="align-middle text-center">País</th>
            <th class="align-middle text-center">Estado</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
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