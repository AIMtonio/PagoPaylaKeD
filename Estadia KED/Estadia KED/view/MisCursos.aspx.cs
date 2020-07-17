using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Estadia_KED.control;

namespace Estadia_KED.view
{
    public partial class MisCursos : System.Web.UI.Page
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

            consultar();
        }

        protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }//end log out

        protected void consultar(){
            try
            {
                Conexion cn = new Conexion();
                SqlConnection scn = cn.conectar();

                Cliente obj = (Cliente)Session["correo"];
                usuario.Text = obj.correo;

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from curso inner join carrito on curso.id_curso = carrito.id_curso where correo ='" + obj.correo + "'";
                DataTable imagen = new DataTable();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = scn;
                scn.Open();
                imagen.Load(cmd.ExecuteReader());
                Repeater2.DataSource = imagen;
                Repeater2.DataBind();
                scn.Close();
            }
            catch (Exception ex)
            {
                Label3.Text = "Aún no tienes cursos";
            }

        }//end consultar

        

        }
    }
