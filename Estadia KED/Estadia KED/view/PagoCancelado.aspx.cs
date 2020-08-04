using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Estadia_KED.view
{
    public partial class PagoCancelado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             Cliente obj = (Cliente)Session["correo"];
            if (obj != null)
            {
                usuario.Text = obj.correo;
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }//end log out

        }
    }
