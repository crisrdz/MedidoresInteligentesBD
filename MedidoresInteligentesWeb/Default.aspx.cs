using MedidoresInteligentesModel;
using MedidoresInteligentesModel.DAL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedidoresInteligentesWeb
{
    public partial class Default : System.Web.UI.Page
    {
        IUsuariosDAL usuariosDAL = new UsuariosDALDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void customRut_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string rut = this.txtRut.Text;
            if (validarRut(rut))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Usuario usuario = new Usuario();
                usuario.rut = this.txtRut.Text.Trim();
                usuario.nombre = this.txtNombre.Text.Trim();
                usuario.contrasena = this.txtContrasena.Text;
                usuario.email = this.txtEmail.Text.Trim();

                this.usuariosDAL.AgregarUsuario(usuario);
                Response.Redirect("VerUsuarios.aspx");
            }
        }

        private Boolean validarRut(string rut)
        {
            rut = rut.Replace(".", "").ToUpper();
            Regex expresion = new Regex("^([0-9]+-[0-9K])$");
            string dv = rut.Substring(rut.Length - 1, 1);
            if (!expresion.IsMatch(rut))
            {
                return false;
            }
            char[] charCorte = { '-' };
            string[] rutTemp = rut.Split(charCorte);
            if (dv != Digito(int.Parse(rutTemp[0])))
            {
                return false;
            }
            return true;
        }

        private string Digito(int rut)
        {
            int suma = 0;
            int multiplicador = 1;
            while (rut != 0)
            {
                multiplicador++;
                if (multiplicador == 8)
                    multiplicador = 2;
                suma += (rut % 10) * multiplicador;
                rut = rut / 10;
            }
            suma = 11 - (suma % 11);
            if (suma == 11)
            {
                return "0";
            }
            else if (suma == 10)
            {
                return "K";
            }
            else
            {
                return suma.ToString();
            }
        }
    }
}