using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estadia_KED.control;
using System.Data.SqlClient;

namespace Estadia_KED.view{
    public partial class pago : System.Web.UI.Page{

        protected void Page_Load(object sender, EventArgs e){

            if (!this.IsPostBack){
                {
                    Conexion cn = new Conexion();
                    SqlConnection scn = cn.conectar();

                    using (SqlCommand cmd = new SqlCommand("SELECT nombre FROM pais", scn)){
                        cmd.CommandType = System.Data.CommandType.Text;

                        scn.Open();
                        cn.conectar();
                        DropDownList.DataSource = cmd.ExecuteReader();
                        DropDownList.DataTextField = "nombre";
                        DropDownList.DataBind();
                    }
                }
            }//fin if de carga de DropDownList

        }//end page load

        protected void lblEx_Click(object sender, EventArgs e)
        {
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }

    }
}