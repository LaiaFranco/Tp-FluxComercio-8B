using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Proveedor
    {
        int id { get; set; }
        string cuil { get; set; }
        string nombre { get; set; }
        string email { get; set; }
        string telefono { get; set; }
        string direccion { get; set; }
        bool activo { get; set; }
    }
}
