  
    using Dominio;
    using negocio;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using Newtonsoft.Json;
    using System.Linq;
    using System.Security.Policy;

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

                        //Usuario
                        venta.Usuario = new Usuario();
                        venta.Usuario.Id = (int)datos.Lector["id_usuario"];
                        venta.Usuario.Nombre = (string)datos.Lector["nombre_usuario"].ToString();

                    //Estado
                    venta.Estado = new EstadoVentas();
                    venta.Estado.Id = (int)datos.Lector["id_estado_venta"];
                    venta.Estado.Nombre = (string)datos.Lector["nombre_estado"];

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
                p.precio,
                p.stock_actual,
                c.nombre AS nombre_categoria,
                i.url AS url_imagen
            FROM VENTA_DETALLES d
            INNER JOIN PRODUCTOS p ON d.id_producto = p.id_producto
            INNER JOIN CATEGORIAS c ON p.id_categoria = c.id_categoria
            LEFT JOIN IMAGENES i ON p.id_producto = i.id_entidad
                                AND i.tipo_entidad = 'PRODUCTO'
                                AND i.activo = 1
            WHERE d.id_venta = @idVenta";

                datos.setearConsulta(consulta);
                datos.setearParametro("@idVenta", id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    DetalleVenta detalle = new DetalleVenta();
                    detalle.Id = Convert.ToInt32(datos.Lector["id_detalle"]);
                    detalle.Cantidad = Convert.ToInt32(datos.Lector["cantidad"]);

                    // Conversión explícita de decimal a float
                    detalle.PrecioUnitario = (float)Convert.ToDecimal(datos.Lector["precio_unitario"]);
                    detalle.Subtotal = (float)Convert.ToDecimal(datos.Lector["subtotal"]);

                    Producto producto = new Producto();
                    producto.Id = Convert.ToInt32(datos.Lector["id_producto"]);      // ← corregido
                    producto.Nombre = datos.Lector["nombre_producto"].ToString();
                    producto.Precio = (float)Convert.ToDecimal(datos.Lector["precio"]);  // ← conversión explícita
                    producto.StockActual = Convert.ToInt32(datos.Lector["stock_actual"]); // ← corregido

                    // Categoría
                    producto.Categoria = new Categoria();  // ← instancia necesaria
                    producto.Categoria.Nombre = datos.Lector["nombre_categoria"].ToString();

                    // Imagen
                    producto.Imagen = new Imagen();
                    producto.Imagen.Url = datos.Lector["url_imagen"] != DBNull.Value
                        ? datos.Lector["url_imagen"].ToString()
                        : string.Empty;

                    detalle.Producto = producto;
                    detalles.Add(detalle);
                }
                return detalles;
            }
            catch (Exception ex)
            {
                throw;   // ← preserva la pila de llamadas original
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

               

                    datos.setearProcedimiento("storeVerVenta");
                    datos.setearParametro("@id_venta", id);
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

                        //Usuaurio
                        venta.Usuario = new Usuario();
                        venta.Usuario.Id = (int)datos.Lector["id_usuario"];
                        venta.Usuario.Nombre = (string)datos.Lector["nombre_usuario"];
                        venta.Usuario.Activo = (bool)datos.Lector["activo_usuario"];

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
                    datos.setearProcedimiento("storedAltaVenta");
                    datos.setearParametro("@id_cliente", nuevaVenta.Cliente.Id);
                    datos.setearParametro("@fecha", nuevaVenta.Fecha);
                    datos.setearParametro("@id_usuario", nuevaVenta.Usuario.Id);
                      datos.setearParametro("@id_estado_venta", nuevaVenta.Estado.Id);


                object resultado = datos.ejecutarEscalar();
                    int idVentaGenerado = resultado != null ? Convert.ToInt32(resultado) : 0;

                    foreach (DetalleVenta detalle in nuevaVenta.Detalle)
                    {
                   
                        datos = new AccesoDatos(); 
                        datos.setearProcedimiento("storedAltaVentaDetalle");
                        datos.setearParametro("@id_venta", idVentaGenerado);
                        datos.setearParametro("@id_producto", detalle.Producto.Id);
                        datos.setearParametro("@cantidad", detalle.Cantidad);
                        datos.setearParametro("@precio_unitario", detalle.PrecioUnitario);
                        datos.ejecutarAccion();
                    }
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

            public void Modificar(Venta nuevaVenta)
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearProcedimiento("storedModificarVenta");

                    datos.setearParametro("@id_venta", nuevaVenta.Id);
                    datos.setearParametro("@id_cliente", nuevaVenta.Cliente.Id);
                    datos.setearParametro("@fecha", nuevaVenta.Fecha);
                    datos.setearParametro("@id_usuario", nuevaVenta.Usuario.Id);


                    object resultado = datos.ejecutarEscalar();
                    int idVentaGenerado = resultado != null ? Convert.ToInt32(resultado) : 0;

                    foreach (DetalleVenta detalle in nuevaVenta.Detalle)
                    {
                   
                        datos = new AccesoDatos();
                        datos.setearProcedimiento("storedModificarVentaDetalle");
                        datos.setearParametro("@id_venta", idVentaGenerado);
                        datos.setearParametro("@id_producto", detalle.Producto.Id);
                        datos.setearParametro("@cantidad", detalle.Cantidad);
                        datos.setearParametro("@precio_unitario", detalle.PrecioUnitario);
                        datos.ejecutarAccion();
                    }

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


           public List<DetalleVenta> GetDetalle(int id)
           {

                AccesoDatos datos = new AccesoDatos();
                List<DetalleVenta> ListaVentas = new List<DetalleVenta>();

                try {

                    datos.setearProcedimiento("storeDetalleVenta");
                    datos.setearParametro("@id_venta", id);
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        DetalleVenta detalle = new DetalleVenta();

                        detalle.Id = (int)datos.Lector["id_detalle"];
                        detalle.Cantidad = (int)datos.Lector["cantidad"];
                        detalle.Subtotal = Convert.ToSingle(datos.Lector["subtotal"]);

                    Producto nuevoProducto = new Producto();

                        nuevoProducto.Id = (int)datos.Lector["id_producto"];
                        nuevoProducto.Precio = Convert.ToSingle(datos.Lector["precio"]);
                        nuevoProducto.Nombre = (string)datos.Lector["nombre"];

                        detalle.Producto = nuevoProducto;

                        ListaVentas.Add(detalle);   
                    }

                    return ListaVentas;
            
                }catch(Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
           }
            public decimal ObtenerVentasDelDia()
            {
                AccesoDatos datos = new AccesoDatos();

                try
                {
                    datos.setearConsulta(@"
                SELECT ISNULL(SUM(total),0)
                FROM VENTAS
                WHERE CAST(fecha AS DATE) = CAST(GETDATE() AS DATE)");

                    datos.ejecutarLectura();

                    if (datos.Lector.Read())
                        return (decimal)datos.Lector[0];

                    return 0;
                }
                finally
                {
                    datos.cerrarConexion();
                }

            }

        public decimal ObtenerGananciaDelDia()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT ISNULL(SUM(
                dv.cantidad *
                (p.precio * p.porcentaje_ganancia / 100)
            ),0)
            FROM VENTA_DETALLES dv
            INNER JOIN PRODUCTOS p
                ON p.id_producto = dv.id_producto
            INNER JOIN VENTAS v
                ON v.id_venta = dv.id_venta
            WHERE CAST(v.fecha AS DATE) = CAST(GETDATE() AS DATE)");

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return (decimal)datos.Lector[0];

                return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


    }
    }