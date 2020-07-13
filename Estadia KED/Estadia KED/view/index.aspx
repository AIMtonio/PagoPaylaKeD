<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Estadia_KED.view.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <link href="../css/slide.css" rel="stylesheet" type="text/css" />
    <link href="../css/carrusel.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $(' .slide img:gt(0)').hide();
            setInterval(function () {
                $(' .slide :first-child').fadeOut(2500).next('img').fadeIn(2500).end().appendTo(' .slide');
            }, 2500);
        });
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a href="login.aspx">
    <img src="../img/kedX.png" height="30%" width="30%"/>
    </a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="MisCursos.aspx">Mis cursos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Cursos.aspx">Cursos</a>
      </li>
      <li class="nav-item">
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" runat="server">
      <input class="form-control mr-sm-2" type="search" placeholder="Busqueda" aria-label="Busqueda">
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Busqueda</button>
            <asp:LinkButton ID="lblEx" class="nav-link" runat="server" onclick="lblEx_Click">Cerrar sesi&oacute;n</asp:LinkButton>
            <asp:Label ID="usuario" runat="server" Text="" ForeColor="Azure"></asp:Label>
    </form>
  </div>
</nav>
<div><br /><p class="h1  text-center"/><font color="#21B6BF">Cursos y Certificaciones Microsoft</font></p><hr class="hr-light bg-primary"></div>
<div class="row">
<div class="col-md-3"></div>
<div class="slide" >
    <img src="../img/azure.jpg" alt=""/>
    <img src="../img/excel.jpg" alt=""/>
    <img src="../img/log.png" alt=""/>
</div>
</div>
<br />

<div><p class="h1 text-center"><font color="#21B6BF">Cursos Principales</font> </p><hr class="hr-light bg-primary"></div>



 
<div class=" row">
 <asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
  <div class="col-md-4">
    <!-- Card -->
    <div class="card">
      <!--Card image-->
      <div class="view overlay">
        <img  src="data:image/jpg;base64,<%#Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagen")) %>" width="260" height="150"
          alt="Curso">
        <a href="#!">
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>
      <!--Card content-->
      <div class="card-body bg-dark rounded-bottom text-light">
        <!--Title-->
        <h4 class="card-title"><%#DataBinder.Eval(Container.DataItem,"id_curso") %>  <%#DataBinder.Eval(Container.DataItem,"nombre") %></h4>
        <hr class="hr-light">
        <!--Text-->
        <p class="card-text"><%#DataBinder.Eval(Container.DataItem,"descripcion") %>.</p>
        <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
        <p class="card-text"><a href="VerCurso.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id_curso") %>">  Ver más</a></p>
      </div>
    </div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>


<br /><br />
<!-- Footer -->
<footer class="page-footer font-small bg-info pt-4">

    <!-- Footer Elements -->
    <div class="container">

        <ul class="list-unstyled list-inline text-center">
            <li class="list-inline-item">
              <a mdbBtn floating="true" color="fb" class="mx-1" mdbWavesEffect>
                <mdb-icon fab icon="facebook"></mdb-icon>
              </a>
            </li>
            <li class="list-inline-item">
              <a mdbBtn floating="true" color="tw" class="mx-1" mdbWavesEffect>
                <mdb-icon fab icon="twitter"></mdb-icon>
              </a>
            </li>
            <li class="list-inline-item">
              <a mdbBtn floating="true" color="gplus" class="mx-1" mdbWavesEffect>
                <mdb-icon fab fab icon="google-plus"></mdb-icon>
              </a>
            </li>
            <li class="list-inline-item">
              <a mdbBtn floating="true" color="li" class="mx-1" mdbWavesEffect>
                <mdb-icon fab icon="linkedin"></mdb-icon>
              </a>
            </li>
            <li class="list-inline-item">
              <a mdbBtn floating="true" color="dribbble" class="mx-1" mdbWavesEffect>
                <mdb-icon fab icon="dribbble"></mdb-icon>
              </a>
            </li>
          </ul>

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3"><font color="#FFFFF">© 2020 Copyright:</font>
      <a href="https://www.ked.com.mx/"> KeD</a>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->

</body>
</html>
