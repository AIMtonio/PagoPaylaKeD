<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="Estadia_KED.view.carrito" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Carrito de productos</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/main.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    <br>
<center><h1 class="mainCarrito">Carrito de productos</h1></center>
    <form id="carrito" runat="server">
    <div class="mainCarrito">
    <img src="../img/ked.png" height="10%" width="30%" /><br /><br />
    
    <!--<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Curso</th>
      <th scope="col">Descripción</th>
      <th scope="col">Costo</th>
      <th scope="col">Operación </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"></th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>-->
    
    <!-- Fin -->

  <asp:gridview id="GridCarrito" autogeneratecolumns="False" allowpaging="True" runat="server" class="table">
    <Columns>
      <asp:BoundField  DataField="nombre" HeaderText="Nombre del curso" 
      InsertVisible="False" ReadOnly="True" SortExpression="n_curso" />
      <asp:BoundField DataField="Descripcion" HeaderText="Descripción del curso" 
      InsertVisible="False" ReadOnly="True" SortExpression="d_curso" />
      <asp:BoundField DataField="Costo" HeaderText="Costo del curso" 
      InsertVisible="False" ReadOnly="True" SortExpression="co_curso" />
      
    </Columns>
</asp:gridview>
     
     <asp:Button ID="btnPagar" runat="server" Text="Pagar" onclick="pagar_Click"/><br /><br />
    </div>
    </form>
</body>
</html>