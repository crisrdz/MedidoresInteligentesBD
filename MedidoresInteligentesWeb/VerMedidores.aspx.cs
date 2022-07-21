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
    public partial class VerMedidores : System.Web.UI.Page
    {
        IMedidoresDAL medidoresDAL = new MedidoresDALDB();
        ITiposMedidoresDAL tiposMedidoresDAL = new TiposMedidoresDALDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TipoMedidor> tipos = tiposMedidoresDAL.ObtenerTiposMedidores();
                this.ddlTipoMedidor.DataSource = tipos;
                this.ddlTipoMedidor.DataTextField = "Nombre";
                this.ddlTipoMedidor.DataValueField = "IdTipo";
                this.ddlTipoMedidor.DataBind();
                this.ddlTipoMedidor.Items.Insert(0, new ListItem("Todos", "0"));
                string valor = this.ddlTipoMedidor.SelectedValue;
                cargarGrilla(valor);
            }
        }

        private void cargarGrilla(string valor)
        {
            int tipo = Convert.ToInt32(valor);
            if (tipo == 0)
            {
                List<Medidor> medidores = medidoresDAL.ObtenerMedidores();
                this.grillaMedidores.DataSource = medidores;
                this.grillaMedidores.DataBind();
            }
            else
            {
                List<Medidor> medidores = medidoresDAL.ObtenerMedidores(tipo);

                this.grillaMedidores.DataSource = medidores;
                this.grillaMedidores.DataBind();
            }
        }

        protected void ddlTipoMedidor_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tipo = this.ddlTipoMedidor.SelectedValue;
            cargarGrilla(tipo);
        }

        protected void grillaMedidores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                this.medidoresDAL.EliminarMedidor(id);
                string tipo = this.ddlTipoMedidor.SelectedValue;
                this.cargarGrilla(tipo);
            }
        }
    }
}