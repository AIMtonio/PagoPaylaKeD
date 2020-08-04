using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estadia_KED.control;
using System.Data.SqlClient;
using System.Data;

namespace Estadia_KED.view
{
    public partial class PagoAceptado : System.Web.UI.Page
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

            cambiarStatus();
           
        }

        protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }

        protected void cambiarStatus()
        {
            string id_compra = Request.Params["id"];
            
            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();
            
            scn.Open();
            SqlCommand cmd = new SqlCommand("update compra set status = 1 where id_compra ='" + id_compra + "'");
            cmd.Connection = scn;
            cmd.ExecuteNonQuery();

            estado.Text = Convert.ToString(id_compra);

        }

    }
}