using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Usuario
    {
        int id { get; set;}
        string nombre { get; set; }
        string email { get; set; }
        string password { get; set; }
        Rol rol { get; set; }
        Imagen fotoPerfil { get; set; }
        bool activo { get; set; }
    }
}


