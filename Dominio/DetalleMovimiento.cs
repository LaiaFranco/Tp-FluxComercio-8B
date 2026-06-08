using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    abstract class DetalleMovimiento
    {
        int id { get; set; }
        Producto producto { get; set; }
        float cantidad { get; set; }
        float precioUnitario { get; set; }
        float subtotal { get; set; }
    }
}
