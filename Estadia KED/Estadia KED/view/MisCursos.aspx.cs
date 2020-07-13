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
    public partial class MisCursos : System.Web.UI.Page
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
            try
            {
                Cliente obj = (Cliente)Session["correo"];
                usuario.Text = obj.correo;
                SqlConnection conexion = new SqlConnection(cadenaconexion);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select a.nombre, j.status from curso a inner join pago j on a.id_curso = j.id_curso where correo ='" + usuario.Text + "'";
                DataTable imagen = new DataTable();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexion;
                conexion.Open();
                imagen.Load(cmd.ExecuteReader());
                Repeater1.DataSource = imagen;
                Repeater1.DataBind();
                conexion.Close();
            }
            catch (Exception ex)
            {
                lblmen.Text = "Aún no tienes cursos";
            }

        }
        }
    }
