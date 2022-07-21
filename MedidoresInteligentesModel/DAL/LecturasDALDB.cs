using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public class LecturasDALDB : ILecturasDAL
    {
        private MedidoresInteligentesEntities medidoresInteligentesDB = new MedidoresInteligentesEntities();
        public void AgregarLectura(Lectura lectura)
        {
            this.medidoresInteligentesDB.Lectura.Add(lectura);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public void EliminarLectura(int id)
        {
            Lectura lectura = this.medidoresInteligentesDB.Lectura.Find(id);
            this.medidoresInteligentesDB.Lectura.Remove(lectura);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public Lectura Obtener(int id)
        {
            return this.medidoresInteligentesDB.Lectura.Find(id);
        }

        public List<Lectura> ObtenerLecturas()
        {
            return this.medidoresInteligentesDB.Lectura.ToList();
        }

        public List<Lectura> ObtenerLecturas(int idMedidor)
        {
            //LINQ
            var query = from a in this.medidoresInteligentesDB.Lectura
                        where a.Medidor.idMedidor == idMedidor
                        select a;
            return query.ToList();
        }
    }
}
