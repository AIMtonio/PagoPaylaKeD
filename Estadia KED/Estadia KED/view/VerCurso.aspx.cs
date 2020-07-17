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
    public partial class VerCurso : System.Web.UI.Page{

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

            consultarParametros();
        }//end page load


            protected void lblEx_Click(object sender, EventArgs e){
            Session.Remove("correo");
            Response.Redirect("login.aspx");
        }//end log out

            protected void consultarParametros(){
                string id = Request.Params["id"];

                Conexion cn = new Conexion();
                SqlConnection scn = cn.conectar();
             
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT id_curso,nombre,costo,descripcion,imagen FROM curso where id_curso='" + id + "'";
                DataTable imagen = new DataTable();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = scn;
                scn.Open();
                imagen.Load(cmd.ExecuteReader());
                Repeater1.DataSource = imagen;
                Repeater1.DataBind();
                scn.Close();
            }

           protected void agregarCatalogo(object sender, EventArgs e)
           {
               string id = Request.Params["id"];
               Cliente obj = (Cliente)Session["correo"];

               try
               {
                   Conexion cn = new Conexion();
                   SqlConnection scn = cn.conectar();

                   String insertar = "insert into carrito(id_curso, correo) values (@id_curso, @correo)";

                   SqlCommand cmd = new SqlCommand(insertar, scn);
                   cmd.Parameters.Add("@id_curso", SqlDbType.Int).Value = id;
                   cmd.Parameters.Add("@correo", SqlDbType.Text).Value = obj.correo;
                   scn.Open();
                   cmd.ExecuteNonQuery();
                   Mensaje.Text = "Curso agregado a tu catalogo";
               }
               catch (Exception ex)
               {
                   Mensaje.Text = ex.Message;
               }
           }//end agregar al catalogo
    
        }
    }
