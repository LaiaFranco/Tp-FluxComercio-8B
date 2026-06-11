using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
       public int id { get; set; }
        public string nombre { get; set; }
        public Marca marca { get; set; }
        public Categoria categoria { get; set; }
        public string descripcion { get; set; }
        public float stocmkActual { get; set; }
        public float stockMinimo { get; set; }
        public float porcentajeGanancia { get; set; }
        public Imagen imagen { get; set; }
        public Proveedor proveedor { get; set; }
        public bool activo { get; set; }
    }
}

