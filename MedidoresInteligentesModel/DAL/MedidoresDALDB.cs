using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public class MedidoresDALDB : IMedidoresDAL
    {
        private MedidoresInteligentesEntities medidoresInteligentesDB = new MedidoresInteligentesEntities();
        public void AgregarMedidor(Medidor medidor)
        {
            this.medidoresInteligentesDB.Medidor.Add(medidor);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public void EliminarMedidor(int id)
        {
            Medidor medidor = this.medidoresInteligentesDB.Medidor.Find(id);
            this.medidoresInteligentesDB.Medidor.Remove(medidor);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public Medidor Obtener(int id)
        {
            return this.medidoresInteligentesDB.Medidor.Find(id);
        }

        public List<Medidor> ObtenerMedidores()
        {
            return this.medidoresInteligentesDB.Medidor.ToList();
        }

        public List<Medidor> ObtenerMedidores(int tipo)
        {
            //LINQ
            var query = from a in this.medidoresInteligentesDB.Medidor
                        where a.TipoMedidor.idTipo == tipo
                        select a;
            return query.ToList();
        }
    }
}
