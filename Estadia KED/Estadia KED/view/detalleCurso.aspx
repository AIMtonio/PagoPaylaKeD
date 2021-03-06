﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detalleCurso.aspx.cs" Inherits="Estadia_KED.view.detalleCurso" %>

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
<body class="main">
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
      <li class="nav-item active">
        <a class="nav-link" href="Cursos.aspx">Cursos</a>
      </li>
      <li class="nav-item">
      </li>
    </ul>
    <form id="Form1" class="form-inline my-2 my-lg-0" runat="server">
      <input class="form-control mr-sm-2" type="search" placeholder="Busqueda" aria-label="Busqueda">
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Busqueda</button>
            <asp:LinkButton ID="lblEx" class="nav-link" runat="server" onclick="lblEx_Click">Cerrar sesi&oacute;n</asp:LinkButton>
            <asp:Label ID="usuario" runat="server" Text="" ForeColor="Azure"></asp:Label>
            <a href="carrito.aspx"><img src="../img/Shopping Cart_48px.png" /></a>
    </form>
  </div>
</nav>
<div><p class="h1 text-center"><font color="#21B6BF">Detalles del curso</font></p><hr class="hr-light bg-primary"></div>

<br /><br />

<section class="container">
    <div class="row">
    <div class="col-xs 12 col-md-12 bg">
    <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col"><center>Curso</center></th>
      <th scope="col"><center>Video</center></th>
      <th scope="col"><center>Costo</center></th>
      
      <th scope="col"><center>Operación</center></th>
    </tr>
  </thead>
  


<asp:Label ID="estadoConsulta"  Text="" runat="server"></asp:Label><br />
<asp:Label ID="idCompraW"  hidden="" Text="" runat="server"></asp:Label>

<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>

<form action="http://www.sandbox.paypal.com/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick" />
<input type="hidden" name="business" value="sb-88abz2803767@business.example.com" />
<input type="hidden" name="item_name" value="Pagar curso" />
<input type="hidden" name="currency_code" value="MXN" />

  <tbody>
<input type="hidden" name="amount" value="<%#DataBinder.Eval(Container.DataItem,"costo") %>" />
<input type="hidden" name="no_shipping" value="1" />
<!-- sb-bvb8u2804062@personal.example.com -->
<!-- @O-j4Dh6 -->

<input type="hidden" name="return" value="http://localhost:49853/view/PagoAceptado.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id_compra") %>" />
<input type="hidden" name="cancel_return" value="http://localhost:49853/view/PagoCancelado.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id_video") %>" />
    <tr><center>
      <td><center><img  src="data:image/jpg;base64,<%#Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagen")) %>"
       width="210" height="130" alt=" Curso"></center></td>
       <input type="text" id="estado" value="<%#DataBinder.Eval(Container.DataItem,"status") %>"/>
       <%
       //int status = Convert.ToInt32(Request.Params["estado"]);
           Estadia_KED.control.Conexion cn = new Estadia_KED.control.Conexion();
           System.Data.SqlClient.SqlConnection scn = cn.conectar();

           string id = Request.Params["id"];
           Estadia_KED.Cliente obj = (Estadia_KED.Cliente)Session["correo"];
           usuario.Text = obj.correo;
           int statusC = 0;

           scn.Open();

           string queryConteo = "select count (id_compra) from compra where correo = '" + obj.correo + "'";
           System.Data.SqlClient.SqlCommand commandConteo = new System.Data.SqlClient.SqlCommand(queryConteo, scn);
           int conteo = Convert.ToInt32(commandConteo.ExecuteScalar());

           for (int i = 0; i >= conteo; i++)
           {
               string queryStatus = "Select compra.status from videos inner join curso on curso.id_curso =videos.id_curso inner join compra on videos.id_video = compra.id_video where curso.id_curso ='" +
                  id + "' and correo ='" + obj.correo + "'";
               System.Data.SqlClient.SqlCommand commandStatus = new System.Data.SqlClient.SqlCommand(queryStatus, scn);
               statusC = Convert.ToInt32(commandStatus.ExecuteScalar());
           }

           scn.Close(); %>
       <%
          if (statusC == 0)
          {%>
          <td><center>Requieres comprarlo
          
          <td><center>$<%#DataBinder.Eval(Container.DataItem,"costo") %>.00</center></td>
          <td><center><input type="submit" class="btn btn-success" value="Comprar"></center></td></center></center></td>
            <%  }else if(statusC == 1){%>

          <td><center><%#DataBinder.Eval(Container.DataItem,"url")%>
          <td>Comprado</td> 
          </center></td>
           
          <%}%>

    </tr>
      </tbody>
      </form>
    </ItemTemplate>
</asp:Repeater>



</table>
    </div>     
    </div><!--Fin rows-->
</section><!--Fin del contenedor-->

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
