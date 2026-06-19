using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
       public int Id { get; set; }
        public string Nombre { get; set; }
        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }
        public string Descripcion { get; set; }
        public int StockActual { get; set; }
        public int StockMinimo { get; set; }
        public float Precio { get;  set; }
        public float PorcentajeGanancia { get; set; }
        public Imagen Imagen { get; set; }
        public Proveedor Proveedor { get; set; }
        public bool Activo { get; set; }
    }
}

