using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public class TiposMedidoresDALDB : ITiposMedidoresDAL
    {
        private MedidoresInteligentesEntities medidoresInteligentesDB = new MedidoresInteligentesEntities();
        public List<TipoMedidor> ObtenerTiposMedidores()
        {
            return medidoresInteligentesDB.TipoMedidor.ToList();
        }
    }
}
