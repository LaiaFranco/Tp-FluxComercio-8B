using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleMovimiento
    {
       public int id { get; set; }
       public Producto producto { get; set; }
       public float cantidad { get; set; }
       public float precioUnitario { get; set; }
       public float subtotal { get; set; }
    }
}
