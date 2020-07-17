using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using Estadia_KED.control;

namespace Estadia_KED.view
{
    public partial class AgregarCurso : System.Web.UI.Page
    {
        string cadenaconexion = @"Data Source=DESKTOP-U87UEML\SQLEXPRESS; Initial Catalog=BasePayPal; Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {


        }
      

        protected void btn_Click(object sender, EventArgs e){

            //insercion a la bd
            try
            {
                Conexion cn = new Conexion();
                SqlConnection scn = cn.conectar();

                String insertar = "insert into curso(nombre,imagen,descripcion,costo) values (@nombre,@imagen,@descripcion,@costo)";

                SqlCommand cmd = new SqlCommand(insertar, scn);
                cmd.Parameters.Add("@nombre", SqlDbType.Text).Value = txtnom.Text;
                cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = fuimagen.FileBytes;
                cmd.Parameters.Add("@descripcion", SqlDbType.Text).Value = txtdes.Text;
                cmd.Parameters.Add("@costo", SqlDbType.Float).Value = txtcos.Text;
                scn.Open();
                cmd.ExecuteNonQuery();
                lblMensaje.Text = "Curso agregado";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }//fin del proceso boton agregar
    }//fin de la clase
}