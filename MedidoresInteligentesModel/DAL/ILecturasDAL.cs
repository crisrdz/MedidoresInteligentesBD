using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public interface ILecturasDAL
    {
        List<Lectura> ObtenerLecturas();
        List<Lectura> ObtenerLecturas(int idMedidor);
        Lectura Obtener(int id);
        void AgregarLectura(Lectura lectura);
        void EliminarLectura(int id);
    }
}
