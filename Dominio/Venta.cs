using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Venta
    {
        int id { get; set; }
        DetalleVenta detalleVenta { get; set; }
        DateTime fecha { get; set; }
        float total { get; set; }
        int numFactura { get; set; }
        Usuario usuario { get; set; }
        Cliente cliente { get; set; }
        Imagen imagen { get; set; }
    }
}
