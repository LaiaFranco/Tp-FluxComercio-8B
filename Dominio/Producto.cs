using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Producto
    {
        int id { get; set; }
        string nombre { get; set; }
        Marca marca { get; set; }
        Categoria categoria { get; set; }
        string descripcion { get; set; }
        float stocmkActual { get; set; }
        float stockMinimo { get; set; }
        float porcentajeGanancia { get; set; }
        Imagen imagen { get; set; }
        Proveedor proveedor { get; set; }
        bool activo { get; set; }
    }
}

