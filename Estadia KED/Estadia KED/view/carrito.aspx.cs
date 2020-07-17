using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Estadia_KED.control;

namespace Estadia_KED.view{
    public partial class carrito : System.Web.UI.Page{

        protected void Page_Load(object sender, EventArgs e){

            Cliente obj = (Cliente)Session["correo"];
            if (obj != null){
                usuario.Text = obj.correo;
            }
            else{
                Response.Redirect("login.aspx");
            }

           // consultar();

            LabelCarrito.Text = Request.Params["id"];

            //Label.Text = Request.Params["id2"];
            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM curso where id_curso=(select id_curso from carrito);", scn);
            
            DataSet ds = new DataSet();
            //campo de la tabla
            da.Fill(ds, "nombre");   
            da.Fill(ds, "descripcion");
            da.Fill(ds, "costo");

            //curso, descripcion, costo, operacion
            //idcarrito, idcurso, correo, cantidad

            /*GridCarrito.DataSource = ds.Tables["Nombre"];
            GridCarrito.DataBind();
            GridCarrito.DataSource = ds.Tables["descripcion"];
            GridCarrito.DataBind();
            GridCarrito.DataSource = ds.Tables["costo"];
            GridCarrito.DataBind();*/
            
        }

        protected void pagar_Click(object sender, EventArgs e)
        {
            Response.Redirect("carrito.aspx");

        }

        protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }

        /*protected void consultar()
        {
            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();

            //SqlConnection conexion = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT id_curso,nombre,costo,descripcion,imagen FROM curso";
            DataTable imagen = new DataTable();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = scn;
            scn.Open();
            imagen.Load(cmd.ExecuteReader());
            Repeater1.DataSource = imagen;
            Repeater1.DataBind();
            scn.Close();
        }*/

      

    }
}