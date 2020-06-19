<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Estadia_KED.view.login" %>

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
    <div class="main">
    <form id="form1" runat="server">
        <label>Correo electr&oacute;nico:</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" ></asp:TextBox>
        <label>Contrase&ntilde;a</label>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" ></asp:TextBox>
        <asp:Label ID="error" runat="server" Text="" ForeColor="red" Visible="false"></asp:Label>
        <asp:Button ID="btnIn" runat="server" Text="Ingresar" onclick="btnIn_Click" /><br />    
        <label>No tienes una cuenta obtenla aqui!</label>
        <asp:LinkButton ID="registro" runat="server" onclick="registro_Click">Registrate</asp:LinkButton>
    </form>
    </div>
</body>
</html>
