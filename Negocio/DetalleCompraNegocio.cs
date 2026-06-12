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

                    aux.id = (int)datos.Lector["id_detalle"];

                    aux.compra = new Compra();
                    aux.compra.id = (int)datos.Lector["id_compra"];

                    aux.producto = new Producto();
                    aux.producto.id = (int)datos.Lector["id_producto"];

                    aux.cantidad = float.Parse(datos.Lector["cantidad"].ToString());
                    aux.precioUnitario = float.Parse(datos.Lector["precio_unitario"].ToString());
                    aux.subtotal = float.Parse(datos.Lector["subtotal"].ToString());

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