using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using negocio;

namespace Negocio
{
    public class DetalleCompraNegocio
    {
        public List<DetalleCompra> Listar()
        {
            List<DetalleCompra> lista = new List<DetalleCompra>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedListarCompraDetalles");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    DetalleCompra aux = new DetalleCompra();

                    aux.Id = (int)datos.Lector["id_detalle"];

                   /* aux.producto = new Producto();
                    aux.producto.id = (int)datos.Lector["id_producto"];*/

                    aux.Cantidad = float.Parse(datos.Lector["cantidad"].ToString());
                    aux.PrecioUnitario = float.Parse(datos.Lector["precio_unitario"].ToString());
                    aux.Subtotal = float.Parse(datos.Lector["subtotal"].ToString());

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}