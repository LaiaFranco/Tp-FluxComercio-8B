using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
       public int Id { get; set; }
       public DetalleVenta DetalleVenta { get; set; }
       public DateTime Fecha { get; set; }
       public float Total { get; set; }
       public int NumFactura { get; set; }
       public Usuario Usuario { get; set; }
       public Cliente Cliente { get; set; }
        public Imagen Imagen { get; set; }
    }
}
