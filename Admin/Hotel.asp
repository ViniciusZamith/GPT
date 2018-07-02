<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="../Includes/Connect.asp" -->

<<<<<<< HEAD
<%
If Session("Tipo") <> 1 then Response.Redirect("acessonegado.asp")
Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.Open(StrConexao)

Select case Request("Action")
	Case "Excluir"
'		on error resume next
		
		SqlDelet = "Delete from Hotel where IdHotel = " & Request("IdHotel")
		
		Conn.execute SqlDelet
		
		If Err.Number <> 0 Then
			HotelExcluido = "N"
		Else
			HotelExcluido = "S"
		End If
		
	Case "Alterar"
	
	SqlAlter = "update Hotel set NomeHotel = '" & Request("NomeHotel") & "', CNPJ = '" & Request("CNPJ") & "', " &_
			   "EnderecoHotel = '" & Request("EnderecoHotel") & "', TelefoneHotel = '" & Request("TelefoneHotel") & "' " &_ 
			   "where IdHotel = " & Request("IdHotel")																				 
	
																													  
	Response.Write("<br>SqlAlter	: " & SqlAlter)																												  
	Conn.execute SqlAlter
		
	If Err.Number <> 0 Then
		HotelAlterado = "N"
	Else
		HotelAlterado = "S"
	End If
	
	Case "Create"
	
	SqlCreate = "INSERT INTO [Hotel] " &_
           "([NomeHotel]" &_
           ",[CNPJ]" &_
		   ",[EnderecoHotel]" &_
		   ",[TelefoneHotel])" &_
    "VALUES" &_
           "('" & Request("NomeHotel") & "', "  &_	
				"'" & Request("CNPJ") & "', "  &_
				"'" & Request("EnderecoHotel") & "', "  &_
				"'" & Request("TelefoneHotel") & "'	)"   
	
	'Response.Write("<br>SqlCreate: " & SqlCreate)
	Conn.execute SqlCreate
		
	If Err.Number <> 0 Then
		HotelCriado = "N"
	Else
		HotelCriado = "S"
	End If
	
End Select
%>

=======
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
<!DOCTYPE html>

<head>
<!--#INCLUDE file="../Includes/Head.asp" -->
</head>

<body>

<!--#INCLUDE file="../Admin/MenuAdmin.asp" -->

<div class="container mt-3">
<div class="card text-center">
<<<<<<< HEAD
<div class="card-header">
  <h1>Hotel</h1>
</div>
<div class="card-body">
<!-- Busca -->

<% If HotelExcluido="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel excluido com sucesso
</div>
<% End If %>

<% If HotelExcluido="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao excluir hotel.
</div>
<% End If %>

<% If HotelAlterado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel alterado com sucesso
</div>
<% End If %>

<% If HotelAlterado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao alterar hotel.
</div>
<% End If %>

<% If HotelCriado="S" Then %>
<div class="alert alert-success alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Hotel adicionado com sucesso
</div>
<% End If %>

<% If HotelCriado="N" Then %>
<div class="alert alert-danger alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
<strong>ATENÇÃO!</strong> Erro ao adicionar hotel.
</div>
<% End If %>

<h3>Buscar Hotel</h3>
<br />
	<form method="post" action="/admin/Hotel.asp" name="Busca" id="buscaFuncionario">
  <input type="hidden" name="Action" id="IdAction" value="Busca">
  <div class="form-row">
    <div class="form-group col-8">
      <label for="IdNome">Nome</label>
      <input name="Nome" type="text" class="form-control" id="IdNome" placeholder="Digite um Nome ou parte do nome para Buscar" maxlength="60" value="">
    </div>

    <div class="form-group col-4">
      <label for="IdCNPJ">CNPJ</label>
      <input name="CNPJ" type="text" class="form-control text-center MaskCNPJ" id="CNPJ" placeholder="00.000.000/0000-00" maxlength="17" value="">
    </div>

    <div class="form-group col text-right">
      <hr>
      <button type="submit" class="btn btn-primary" id="botao"><i class="fa fa-search"></i>&nbsp;Buscar</button>
      <button onclick="LimpaFormulario('IdFrmBuscaCandidato')" class="btn btn-danger"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp;Limpar Busca</button>
    </div>
  </div>
</form>

<!-- Table -->

<h3>Lista de Hoteis</h3>
<br />
<table class="table table-bordered table-hover table-responsive">
<thead class="bg-secondary text-white">
  <tr>
    <th class="align-middle text-center">Nome</th>
    <th class="align-middle text-center">CNPJ</th>
	<th class="align-middle text-center">Endereço</th>
	<th class="align-middle text-center">Telefone</th>
    <th class="align-middle text-center"></th>
    <th class="align-middle text-center"><form action="novoHotel.asp" method="post">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-success btn-sm" id="botao"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Novo </button>
      </form></th>
  </tr>
</thead>
<tbody>
  <%		  
  			Set rsHotel = server.CreateObject("ADODB.RECORDSET")
  			
  			if (Request("Action")="Busca") then
			
			sqlSearch = "Select * from Hotel where NomeHotel like '%" & Request("Nome") & "%'" &_ 
			"AND CNPJ like '%" & Request("CNPJ") & "%'"
	 
			'Response.Write("<br>SqlCreate: " & SqlSearch)
			
			rsHotel.open SqlSearch, conn
			
			else
			
    		SqlLista = "Select * from Hotel"
			rsHotel.open SqlLista, conn
			
			end if
			
			if not (rsHotel.bof and rsHotel.eof) then
			do while not rsHotel.eof
    	%>
  <tr class="justify-content-around">
    <td class="align-middle text-center"><small><%=rsHotel("NomeHotel") %></small></td>
    <td class="align-middle text-center"><small><%=rsHotel("CNPJ") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("EnderecoHotel") %></td>
	<td class="align-middle text-center"><small><%=rsHotel("TelefoneHotel") %></td>
    <td class="align-middle text-center"><form action="editarHotel.asp" method="post">
        <input type="hidden" name="IdHotel" value="<%=rsHotel("IdHotel")%>">
        <input type="hidden" name="Action" value="Alterar">
        <button type="submit" class="btn btn-primary btn-sm" id="botao"> <i class="far fa-edit"></i>&nbsp;Editar </button>
      </form></td>
    <td class="align-middle text-center">
    <form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method="post">
        <input type="hidden" name="IdHotel" value="<%=rsHotel("IdHotel")%>">
        <input type="hidden" name="Action" value="Excluir">
        <button type="submit" class="btn btn-danger btn-sm" id="botao"> <i class="far fa-trash-alt"></i>&nbsp;Excluir </button>
      </form></td>
  </tr>
  <%
			rsHotel.moveNext
			loop
		
		eLSE
		%>
  <tr>
    <td colspan="12" class="align-middle text-center">Nenhum registro encontrado.</td>
  </tr>
  <%
		eND iF
        %>
</tbody>
</div>
</div>
</body>
</html><%
rsHotel.Close
Set rsHotel = Nothing

Conn.close
Set Conn = nothing
%>
=======
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
>>>>>>> d1681b082b769ad0dc6cb6859c0143dbccba7b49
