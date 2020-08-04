using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Estadia_KED.control
{
    public class ConCliente
    {
        public static Cliente Login(String correo, String contrasena) 
        {
            Cliente obj= null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion con = new Conexion();
                SqlConnection scn = con.conectar();
                cmd = new SqlCommand("Iniciosesion",scn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@correo",correo);
                cmd.Parameters.AddWithValue("@contrasena", contrasena);
                
                cmd.CommandType = CommandType.StoredProcedure;
                scn.Open();
                dr = cmd.ExecuteReader();
                obj = new Cliente();
                dr.Read();
                    obj.correo = dr["correo"].ToString();
                    obj.telefono = dr["telefono"].ToString();
                    obj.contrasena = dr["contrasena"].ToString();
                
            }
            catch (InvalidOperationException e)
            {
                Console.WriteLine("Excepción "+e.Message);
                obj = null;
            }
            catch (SqlException e)
            {
                Console.WriteLine("Excepción " + e.Message);
                obj = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return obj;
        }

        /*Registro de nuevo usuario a KeDX*/
        public static Cliente Registro(String correo,String telefono,String contrasena)
        {
            Cliente obj = null;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("Registro", cnx);
                cmd.Parameters.AddWithValue("@correo", correo);
                cmd.Parameters.AddWithValue("@telefono", telefono);
                cmd.Parameters.AddWithValue("@contrasena",contrasena);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                cmd.ExecuteNonQuery();
                
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                obj = null;
            }
            finally {
                cmd.Connection.Close();
            }
            return obj;
        }
    
    
    }
}