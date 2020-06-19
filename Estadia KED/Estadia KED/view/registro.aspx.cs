using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Estadia_KED.view
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            if(txtEmail.Text != "" && txtTele.Text != "" && txtCont.Text != "" && txtConf.Text !=""){
                if (txtCont.Text != txtConf.Text)
                {
                    error.Text = "Las contraseñas son diferentes";
                    error.Visible = true;
                }
                else
                {
                    try
                    {
                        Cliente obj = Principal.Registro(txtEmail.Text,txtTele.Text,txtCont.Text);
                        clean();
                        Response.Redirect("login.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                        error.Text = "Falta por llenar algún campo";
                        error.Visible = true;
                    }
                }

            }
        }
        private void clean() {
            txtEmail.Text = "";
            txtTele.Text = "";
        }
    }
}