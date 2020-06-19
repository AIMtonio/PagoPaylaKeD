using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Estadia_KED.control;

namespace Estadia_KED
{
    public class Principal
    {
        public static Cliente Login(String correo, String contrasena)
        {
            return ConCliente.Login(correo,contrasena);
        }

        /*Llamada de método desde controlador*/
        public static Cliente Registro(String correo,String telefono,String contrasena) {
            return ConCliente.Registro(correo,telefono,contrasena);
        }
    }
}