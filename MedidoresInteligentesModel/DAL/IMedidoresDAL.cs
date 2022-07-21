using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public interface IMedidoresDAL
    {
        List<Medidor> ObtenerMedidores();
        List<Medidor> ObtenerMedidores(int tipo);
        Medidor Obtener(int id);
        void AgregarMedidor(Medidor medidor);
        void EliminarMedidor(int id);
    }
}
