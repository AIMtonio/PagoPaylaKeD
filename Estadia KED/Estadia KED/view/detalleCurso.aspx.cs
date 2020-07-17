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
    public partial class detalleCurso : System.Web.UI.Page
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
        }

        protected void consultar()
        {
            string id = Request.Params["id"];

            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();
            Cliente obj = (Cliente)Session["correo"];
            usuario.Text = obj.correo;

            //Label3.Text = obj.correo;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select nombre, imagen, id_video, url, videos.costo, videos.status from videos inner join curso on curso.id_curso =videos.id_curso where curso.id_curso='" + id + "' and correo ='" + obj.correo + "'";
            DataTable imagen = new DataTable();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = scn;
            scn.Open();
            imagen.Load(cmd.ExecuteReader());
            Repeater2.DataSource = imagen;
            Repeater2.DataBind();
            scn.Close();
        }

    }
}