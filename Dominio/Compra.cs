using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Compra
    {
        int id { get; set; }
        Proveedor proveedor { get; set; }
        DateTime fecha { get; set; }
        float total { get; set; }
        Usuario usuario { get; set; }
        DetalleCompra detalleCompra { get; set; }
    }
}
