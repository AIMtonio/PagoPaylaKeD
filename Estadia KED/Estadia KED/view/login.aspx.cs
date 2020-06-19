using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estadia_KED.control;

namespace Estadia_KED.view
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["correo"] != null)
            {
                Response.Redirect("index.aspx");
            }
            
        }

        protected void btnIn_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != "" && txtPass.Text != "")
            {
                Cliente obj = Principal.Login(txtEmail.Text,txtPass.Text);
                if (obj != null)
                {
                    Session["correo"]=obj;
                    Response.Redirect("index.aspx");
                }
                else { error.Text = "Alguno de los datos es incorrecto";
                error.Visible = true;
                }
            }
            else
            {
                error.Text = "Favor de llenar todos los datos solicitados.";
                error.Visible = true;
            }


        }

        protected void registro_Click(object sender, EventArgs e)
        {
            Response.Redirect("registro.aspx");
        }
    }
}