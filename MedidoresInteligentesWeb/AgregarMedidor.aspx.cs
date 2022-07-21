using MedidoresInteligentesModel;
using MedidoresInteligentesModel.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedidoresInteligentesWeb
{
    public partial class AgregarMedidor : System.Web.UI.Page
    {
        IUsuariosDAL usuariosDAL = new UsuariosDALDB();
        ITiposMedidoresDAL tiposMedidoresDAL = new TiposMedidoresDALDB();
        IMedidoresDAL medidoresDAL = new MedidoresDALDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<Usuario> usuarios = usuariosDAL.ObtenerUsuarios();
                this.ddlUsuario.DataSource = usuarios;
                this.ddlUsuario.DataTextField = "Nombre";
                this.ddlUsuario.DataValueField = "IdUsuario";
                this.ddlUsuario.DataBind();

                List<TipoMedidor> tiposMedidores = tiposMedidoresDAL.ObtenerTiposMedidores();
                this.rblTipo.DataSource = tiposMedidores;
                this.rblTipo.DataTextField = "Nombre";
                this.rblTipo.DataValueField = "IdTipo";
                this.rblTipo.DataBind();
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Medidor medidor = new Medidor();
                medidor.nombre = this.txtNombre.Text.Trim();
                medidor.idTipo = Convert.ToInt32(this.rblTipo.Text);
                medidor.idUsuario = Convert.ToInt32(this.ddlUsuario.Text);

                medidoresDAL.AgregarMedidor(medidor);
                Response.Redirect("VerMedidores.aspx");
            }
        }
    }
}