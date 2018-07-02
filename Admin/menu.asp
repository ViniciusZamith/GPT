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
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item"> <a class="nav-link active" href="#">Dados</a> </li>
      <li class="nav-item"> <a class="nav-link" href="#">Adicionar</a> </li>
      <li class="nav-item"> <a class="nav-link" href="#"><i class="fas fa-minus-octagon" style="color:red"></i></a> </li>
    </ul>
  </div>
  <div class="card-body">
    <form>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault01">Nome</label>
          <div class="input-group">
            <input type="text" class="form-control" id="validationDefault01" placeholder="Nome" value="#" required>
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button"><i class="far fa-pencil"></i></button>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault02">E-mail</label>
          <input type="text" class="form-control" id="validationDefault02" placeholder="E-mail" value="#" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefaultUsername">Nome de Usuário</label>
          <input type="text" class="form-control" id="validationDefaultUsername" placeholder="Nome de Usuario" aria-describedby="inputGroupPrepend2" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefaultDate">Data de Nascimento</label>
          <input type="date" class="form-control" id="validationDefaultDate" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault03">CPF</label>
          <input type="text" class="form-control" id="validationDefault01" placeholder="CPF" value="#" required>
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationDefault04">Celular</label>
          <input type="text" class="form-control" id="validationDefault02" placeholder="Celular" value="#" required>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationDefault05">Sexo</label>
        </div>
        <div class="custom-control custom-radio col-md-4 mb-3">
          <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
          <label class="custom-control-label" for="customRadio1">Masculino</label>
        </div>
        <div class="custom-control custom-radio col-md-4 mb-3">
          <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
          <label class="custom-control-label" for="customRadio2">Feminino</label>
        </div>
      </div>
      <button class="btn btn-primary" type="submit">Salvar</button>
    </form>
  </div>
</div>
</body>
</html>