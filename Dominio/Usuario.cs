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
        public int Id { get; set;}

        public string Dni {  get; set;}    
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public Rol Rol { get; set; }
        public Imagen FotoPerfil { get; set; }
        public bool Activo { get; set; }
    }
}


