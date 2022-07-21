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
    public partial class VerUsuarios : System.Web.UI.Page
    {
        IUsuariosDAL usuariosDAL = new UsuariosDALDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarGrilla();
            }
        }

        private void cargarGrilla()
        {
            List<Usuario> usuarios = usuariosDAL.ObtenerUsuarios();
            this.grillaUsuarios.DataSource = usuarios;
            this.grillaUsuarios.DataBind();
        }

        protected void grillaUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                this.usuariosDAL.EliminarUsuario(id);
                this.cargarGrilla();
            }
        }
    }
}