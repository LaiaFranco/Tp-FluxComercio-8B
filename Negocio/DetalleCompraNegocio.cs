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

                    aux.compra = new Compra();
                    aux.compra.Id = (int)datos.Lector["id_compra"];

                    aux.producto = new Producto();
                    aux.producto.Id = (int)datos.Lector["id_producto"];

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


        public List<DetalleCompra> ListarPorCompra(int idCompra)
        {
            List<DetalleCompra> lista = new List<DetalleCompra>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select CD.id_detalle, CD.id_compra, CD.id_producto, P.nombre as nombre_producto, CD.cantidad, CD.precio_unitario, CD.subtotal from COMPRA_DETALLES CD inner join PRODUCTOS P on P.id_producto = CD.id_producto where CD.id_compra = @idCompra");
                datos.setearParametro("@idCompra", idCompra);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    DetalleCompra aux = new DetalleCompra();

                    aux.Id = (int)datos.Lector["id_detalle"];

                    aux.compra = new Compra();
                    aux.compra.Id = (int)datos.Lector["id_compra"];

                    aux.producto = new Producto();
                    aux.producto.Id = (int)datos.Lector["id_producto"];
                    aux.producto.Nombre = (string)datos.Lector["nombre_producto"];

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
