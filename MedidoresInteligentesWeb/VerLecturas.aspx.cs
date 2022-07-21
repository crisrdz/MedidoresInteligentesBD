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
    public partial class VerLecturas : System.Web.UI.Page
    {
        IMedidoresDAL medidoresDAL = new MedidoresDALDB();
        ILecturasDAL lecturasDAL = new LecturasDALDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                List<Medidor> medidores = medidoresDAL.ObtenerMedidores();
                this.medidorDdl.DataSource = medidores;
                this.medidorDdl.DataTextField = "Nombre";
                this.medidorDdl.DataValueField = "IdMedidor";
                this.medidorDdl.DataBind();

                this.medidorDdl.Items.Insert(0, new ListItem("Todos", "0"));
                int valor = Convert.ToInt32(this.medidorDdl.SelectedValue);
                cargarGrilla(valor);
            }
        }

        private void cargarGrilla(int idMedidor)
        {
            if (idMedidor == 0)
            {
                List<Lectura> lecturas = lecturasDAL.ObtenerLecturas();
                this.grillaLecturas.DataSource = lecturas;
                this.grillaLecturas.DataBind();
            }
            else
            {
                List<Lectura> lecturas = lecturasDAL.ObtenerLecturas(idMedidor);

                this.grillaLecturas.DataSource = lecturas;
                this.grillaLecturas.DataBind();
            }

        }

        protected void medidorDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int valor = Convert.ToInt32(this.medidorDdl.SelectedValue);
            cargarGrilla(valor);
        }

        protected void grillaLecturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                this.lecturasDAL.EliminarLectura(id);
                int valor = Convert.ToInt32(this.medidorDdl.SelectedValue);
                this.cargarGrilla(valor);
            }
        }
    }
}