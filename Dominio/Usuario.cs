using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int id { get; set;}

        public string dni { get; set;}
        public string nombre { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public  Rol rol { get; set; }
        public Imagen fotoPerfil { get; set; }
        public bool activo { get; set; }
    }
}


