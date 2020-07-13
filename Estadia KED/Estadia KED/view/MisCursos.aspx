<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisCursos.aspx.cs" Inherits="Estadia_KED.view.MisCursos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <link href="../css/slide.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand text-primary text-capitalize" href="login.aspx">KEDX</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="MisCursos.aspx">Mis cursos <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Editar información</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Cursos.aspx">Cursos</a>
      </li>
      <li class="nav-item">
      </li>
    </ul>
    <form id="Form1" class="form-inline my-2 my-lg-0" runat="server">
      
            <asp:LinkButton ID="lblEx" class="nav-link" runat="server" onclick="lblEx_Click">Cerrar sesi&oacute;n</asp:LinkButton>
            <asp:Label ID="usuario" runat="server" Text="" ForeColor="Azure"></asp:Label>
    </form>
  </div>
</nav>
<br />
<div><p class="h1 text-uppercase py-4 text-center">Aquí se muestran tus cursos</p><hr class="hr-light bg-primary"></div>
<div class="row">
<div class="col-md-4">
</div>
<div class="col-md-4">

<table border="5" style="border-color:#000000; font-size:50px;background:#FFFFFF">
    <tr>
    <td align="center" colspan="2"><asp:Label ID="Label1" runat="server" Text="Nombre del curso"></asp:Label></td>
    <td align="center" colspan="2"><asp:Label ID="Label2" runat="server" Text="Status"></asp:Label></td>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
    <tr>
    <td align="center" colspan="2"><%#DataBinder.Eval(Container.DataItem,"nombre") %></td>
    <td align="center" colspan="2"><%#DataBinder.Eval(Container.DataItem,"status") %></td>
    </tr>
   </ItemTemplate>
   </asp:Repeater>
      <tr>
    <td align="center" colspan="2"><asp:Label ID="lblmen" Text="" runat="server"></asp:Label></td>
    </tr>
   </table>
</div>
<div class="col-md-4">
</div>
</div>
<div class="row">
<div class="col-md-6">
</div>
<div class="col-md-4">

    <br />
    <table style=" font-size:30px;">
    <tr>
    <td align="center" > <p>Agregar cursos...</p></td>
    <td align="center" ><a class="nav-link" href="Cursos.aspx"><img src="../img/carrito.png" width="120px" height="80px"/></a></td>
    </tr>
    </table>
   
    
</div>
<div class="col-md-2">
</div>
</div>



<!-- Footer -->
<footer class="page-footer font-small bg-dark pt-4">

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
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
      <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->

</body>
</html>



