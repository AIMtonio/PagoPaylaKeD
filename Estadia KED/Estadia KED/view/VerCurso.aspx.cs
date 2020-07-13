using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Estadia_KED.view
{
    public partial class VerCurso : System.Web.UI.Page
    {
        string cadenaconexion = @"Data Source=DESKTOP-U87UEML\SQLEXPRESS; Initial Catalog=BasePayPal; Integrated Security=true;";
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

            consultar();
        }


            protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }

            protected void consultar()
            {
                Label1.Text = Request.Params["id"];
             
                SqlConnection conexion = new SqlConnection(cadenaconexion);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT id_curso,nombre,costo,descripcion,imagen FROM curso where id_curso='" + Label1.Text + "'";
                DataTable imagen = new DataTable();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexion;
                conexion.Open();
                imagen.Load(cmd.ExecuteReader());
                Repeater1.DataSource = imagen;
                Repeater1.DataBind();
                conexion.Close();
            }

        }
    }
