using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Estadia_KED.control
{
    public class Conexion
    {
        public SqlConnection conectar()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=DESKTOP-051A3DU\\SQLEXPRESS; Initial Catalog=BasePayPal; Integrated Security=true;";
            
            return con;
        }
    }
}