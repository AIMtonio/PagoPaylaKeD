<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pago.aspx.cs" Inherits="Estadia_KED.view.pago" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pago</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/main.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand text-primary text-capitalize" href="#">KEDX</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
      </li>
    </ul>
  </div>
</nav>
   <br >
<center><h1 class="Pago">Pago</h1></center>
    <form id="formPago" runat="server">
    <div class="mainPago">
    <img src="../img/paypal.png" height="20%" width="60%" /><br />
    <label>País:</label>
    <asp:DropDownList id="DropDownList" runat="server">       
    </asp:DropDownList>
    <br />
    <label>Nombre:</label>
    <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
    <label>Apellidos:</label>
    <asp:TextBox ID="apellidos" runat="server" ></asp:TextBox>
    <label>Tipo de pago:</label><br />
    <asp:RadioButton id="Radio1" Text="" Checked="True" GroupName="RadioGroup1" runat="server" />
    <img src="../img/Visa_48px.png"/><br />
    <asp:RadioButton id="Radio2" Text="" Checked="false" GroupName="RadioGroup1" runat="server" />
    <img src="../img/Credit Card_48px.png"/><br />
    <asp:RadioButton id="Radio3" Text="" Checked="false" GroupName="RadioGroup1" runat="server" />
    <img src="../img/MasterCard_48px.png"/>
 <br />
    <label>Número de tarjeta:</label>
    <asp:TextBox ID="numTarjeta" runat="server" TextMode="Number"></asp:TextBox>
    <label>Vencimiento</label>
    <asp:TextBox ID="vencimiento" runat="server" TextMode="Number"></asp:TextBox>
    <label>CVV:</label>
    <asp:TextBox ID="cvv" runat="server" TextMode="Number"></asp:TextBox>

    <label>Código postal:</label>
    <asp:TextBox ID="cp" runat="server" TextMode="Number"></asp:TextBox>
    <label>Ciudad:</label>
    <asp:TextBox ID="ciudad" runat="server" ></asp:TextBox>
    <label>Teléfono:</label>
    <asp:TextBox ID="telefono" runat="server" TextMode="Number"></asp:TextBox>
    <label>Correo electronico:</label>
    <asp:TextBox ID="correo" runat="server" TextMode="Number"></asp:TextBox>

    <asp:Button ID="btnPagar" runat="server" Text="Pagar"/>
    </div>
    </form>
</body>
</html>
