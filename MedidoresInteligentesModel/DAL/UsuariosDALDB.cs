using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel.DAL
{
    public class UsuariosDALDB : IUsuariosDAL
    {
        private MedidoresInteligentesEntities medidoresInteligentesDB = new MedidoresInteligentesEntities();
        public void AgregarUsuario(Usuario usuario)
        {
            this.medidoresInteligentesDB.Usuario.Add(usuario);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public void EliminarUsuario(int id)
        {
            Usuario usuario = this.medidoresInteligentesDB.Usuario.Find(id);
            this.medidoresInteligentesDB.Usuario.Remove(usuario);
            this.medidoresInteligentesDB.SaveChanges();
        }

        public Usuario Obtener(int id)
        {
            return this.medidoresInteligentesDB.Usuario.Find(id);
        }

        public List<Usuario> ObtenerUsuarios()
        {
            return this.medidoresInteligentesDB.Usuario.ToList();
        }
    }
}
