
using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data;
using Newtonsoft.Json;
using System.Linq;

namespace Negocio
{
    public class VentasNegocio
    {
        public List<Venta> Listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Venta> ventas = new List<Venta>();

            try
            {
                datos.setearProcedimiento("storedListarVentas");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Venta venta = new Venta();
                    venta.Id = (int)datos.Lector["id_venta"];
                    venta.Fecha = (DateTime)datos.Lector["fecha"];
                    venta.NumFactura = datos.Lector["numero_factura"].ToString();
                    venta.Total = (decimal)datos.Lector["total"];

                    // Cliente
                    venta.Cliente = new Cliente();
                    venta.Cliente.Nombre = (string)datos.Lector["nombre_cliente"].ToString();
                    venta.Cliente.Apellido = (string)datos.Lector["apellido_cliente"].ToString();
                    venta.Cliente.Dni = (string)datos.Lector["dni"].ToString();

                    ventas.Add(venta);
                }
                return ventas;
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


        public List<DetalleVenta> VerDetallesPorVenta(int id)
        {
            List<DetalleVenta> detalles = new List<DetalleVenta>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
               
                string consulta = @"
            SELECT 
                d.id_detalle,
                d.id_venta,
                d.id_producto,
                d.cantidad,
                d.precio_unitario,
                d.subtotal,
                p.nombre AS nombre_producto,
                p.precio_actual,
                p.stock_actual,
                c.nombre AS nombre_categoria,
                i.url AS url_imagen
            FROM VENTA_DETALLES d
            INNER JOIN PRODUCTOS p ON d.id_producto = p.id_producto
            INNER JOIN CATEGORIAS c ON p.id_categoria = c.id_categoria
            LEFT JOIN IMAGENES i ON p.id_producto = i.id_producto AND i.es_principal = 1
            WHERE d.id_venta = @idVenta";

                datos.setearConsulta(consulta);
                datos.setearParametro("@idVenta", id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    DetalleVenta detalle = new DetalleVenta();
                    detalle.Id = (int)datos.Lector["id_detalle"];
                    detalle.Cantidad = (int)datos.Lector["cantidad"];
                    detalle.PrecioUnitario = (float)datos.Lector["precio_unitario"];
                    detalle.Subtotal = (float)datos.Lector["subtotal"];

                    // Producto
                    Producto producto = new Producto();
                    producto.Id = (int)datos.Lector["id_producto"];
                    producto.Nombre = (string)datos.Lector["nombre_producto"];
                    producto.Precio = (float)datos.Lector["precio_actual"];
                    producto.StockActual = (int)datos.Lector["stock_actual"];

                    // Categoría
                    producto.Categoria = new Categoria();
                    producto.Categoria.Nombre = (string)datos.Lector["nombre_categoria"];

                    // Imagen 
                    producto.Imagen = new Imagen();
                    producto.Imagen.Url = datos.Lector["url_imagen"] != DBNull.Value
                        ? (string)datos.Lector["url_imagen"]
                        : string.Empty;

                    detalle.Producto = producto;
                    detalles.Add(detalle);
                }

                return detalles;
            }
            catch (Exception ex)
            {
                throw  ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public Venta VerVenta(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Venta venta = new Venta();

            try
            {

                string consulta = @"
                            SELECT 
                                v.id_venta,
                                v.fecha,
                                v.id_cliente,
                                v.total,
                                v.numero_factura,
                                c.nombre AS nombre_cliente,
                                c.apellido AS apellido_cliente
                            FROM VENTAS v
                            INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
                            WHERE v.id_venta = @idVenta";

                datos.setearConsulta(consulta);
                datos.setearParametro("@idVentas", id);
                datos.ejecutarLectura();

               

                if (datos.Lector.Read())
                {

                    venta.Id = (int)datos.Lector["id_venta"];
                    venta.Fecha = (DateTime)datos.Lector["fecha"];
                    venta.NumFactura = datos.Lector["numero_factura"].ToString();
                    venta.Total = (decimal)datos.Lector["total"];

                    // Cliente

                    venta.Cliente = new Cliente();
                    venta.Cliente.Id = (int)datos.Lector["id_cliente"];
                    venta.Cliente.Nombre = (string)datos.Lector["nombre_cliente"];
                    venta.Cliente.Apellido = (string)datos.Lector["apellido_cliente"];

                    return venta;

                }

                return null;

            }
            catch(Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();    
            }
        }

        public void Agregar(Venta nuevaVenta)
        {
           
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("storedAltaVentaConUnDetalle");
                datos.setearParametro("@id_cliente", nuevaVenta.Cliente.Id);
                datos.setearParametro("@fecha", nuevaVenta.Fecha);

                string jsonDetalles = JsonConvert.SerializeObject(nuevaVenta.Detalle);

                datos.setearParametro("@DetallesJSO", jsonDetalles);


                datos.ejecutarEscalar();

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

        public void Modificar(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("storedModificarVentaConUnDetalle");


                string jsonDetalles = JsonConvert.SerializeObject(venta.Detalle.Select(d => new {
                    ProductoId = d.Producto.Id,
                    Cantidad = d.Cantidad,
                    PrecioUnitario = d.PrecioUnitario
                }));

                datos.setearParametro("@id_venta", venta.Id);
                datos.setearParametro("@id_cliente", venta.Cliente.Id);
                datos.setearParametro("@fecha", venta.Fecha);


                datos.setearParametro("@DetallesJSO", jsonDetalles);


                datos.ejecutarAccion();

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