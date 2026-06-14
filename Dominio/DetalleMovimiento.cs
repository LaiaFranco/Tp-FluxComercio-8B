using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleMovimiento
    {
       public int Id { get; set; }
       public List<Producto> ListaProducto { get; set; }
       public float Cantidad { get; set; }
       public float PrecioUnitario { get; set; }
       public float Subtotal { get; set; }

    }
}
