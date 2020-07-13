<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCurso.aspx.cs" Inherits="Estadia_KED.view.AgregarCurso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <label>Nombre del curso:</label>
    <asp:TextBox ID="txtnom" runat="server" ></asp:TextBox>
    <label>Imagen del curso:</label>
    <asp:FileUpload ID="fuimagen" runat="server" />
    <label>Descripción</label>
    <asp:TextBox ID="txtdes" runat="server"></asp:TextBox>
    <label>Costo:</label>
    <asp:TextBox ID="txtcos" runat="server"></asp:TextBox>
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="btn_Click" />
    </div>
    </form>
</body>
</html>