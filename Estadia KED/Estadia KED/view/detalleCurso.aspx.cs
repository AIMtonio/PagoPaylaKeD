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

        protected void consultar(){
            string id = Request.Params["id"];

            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();
            Cliente obj = (Cliente)Session["correo"];
            usuario.Text = obj.correo;    

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select curso.imagen, videos.id_video, videos.url,videos.costo, compra.status, compra.id_compra from videos inner join curso on curso.id_curso =videos.id_curso inner join compra on videos.id_video = compra.id_video where curso.id_curso ='" +
                id + "' and correo ='" + obj.correo + "'";
            
            DataTable imagen = new DataTable();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = scn;
            scn.Open();

            string query = "Select compra.status from videos inner join curso on curso.id_curso =videos.id_curso inner join compra on videos.id_video = compra.id_video where curso.id_curso ='" +
                id + "' and correo ='" + obj.correo + "'";
            SqlCommand command = new SqlCommand(query, scn);
            int statusC = Convert.ToInt32(command.ExecuteScalar());

            string query2 = "Select compra.id_compra from videos inner join curso on curso.id_curso =videos.id_curso inner join compra on videos.id_video = compra.id_video where curso.id_curso ='" +
                id + "' and correo ='" + obj.correo + "'";
            SqlCommand command2 = new SqlCommand(query2, scn);
            int idCompra = Convert.ToInt32(command2.ExecuteScalar());

            estadoConsulta.Text =Convert.ToString(statusC);
            idCompraW.Text = Convert.ToString(idCompra);

            imagen.Load(cmd.ExecuteReader());
            Repeater2.DataSource = imagen;
            Repeater2.DataBind();
            scn.Close();
        }

    }
}