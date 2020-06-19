<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Estadia_KED.view.registro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/main.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <label>Correo electr&oacute;nico:</label>
    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
    <label>Tel&eacute;fono:</label>
    <asp:TextBox ID="txtTele" runat="server"></asp:TextBox>
    <label>Contrase&ntilde;a</label>
    <asp:TextBox ID="txtCont" runat="server" TextMode="Password"></asp:TextBox>
    <label>Confirmar contrase&ntilde;a:</label>
    <asp:TextBox ID="txtConf" runat="server" TextMode="Password"></asp:TextBox>
    <asp:Label ID="error" runat="server" Text="" ForeColor="red" Visible="false"></asp:Label>
    <asp:Button ID="btnReg" runat="server" Text="Registro" onclick="btnReg_Click" />
    </div>
    </form>
</body>
</html>
