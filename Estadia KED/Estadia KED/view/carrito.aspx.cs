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

            Label1.Text = Request.Params["id"];

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

            GridCarrito.DataSource = ds.Tables["Nombre"];
            GridCarrito.DataBind();
            GridCarrito.DataSource = ds.Tables["descripcion"];
            GridCarrito.DataBind();
            GridCarrito.DataSource = ds.Tables["costo"];
            GridCarrito.DataBind();
            
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

      

    }
}