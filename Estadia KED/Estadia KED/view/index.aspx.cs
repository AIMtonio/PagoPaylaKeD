﻿using System;
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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente obj = (Cliente)Session["correo"];
            if (obj != null)
            {
                usuario.Text = obj.correo;
            }
            else {
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
            Conexion cn = new Conexion();
            SqlConnection scn = cn.conectar();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT TOP 3 id_curso,nombre,costo,descripcion,imagen FROM curso";
            DataTable imagen = new DataTable();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = scn;
            scn.Open();
            imagen.Load(cmd.ExecuteReader());
            Repeater1.DataSource = imagen;
            Repeater1.DataBind();
            scn.Close();
        }
    }
}
