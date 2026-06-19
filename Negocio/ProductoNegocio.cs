using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Negocio;
using Dominio;
using negocio;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Producto> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Producto> Productos = new List<Producto>();

            try
            {
                Datos.setearProcedimiento("storedListarProductos");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Producto producto = new Producto();

                    producto.Id = Convert.ToInt32(Datos.Lector["id_producto"]);
                    producto.Nombre = Datos.Lector["nombre"].ToString();

                    producto.Descripcion = Datos.Lector["descripcion"] == DBNull.Value
                        ? ""
                        : Datos.Lector["descripcion"].ToString();

                    producto.StockActual = (int)Datos.Lector["stock_actual"];
                    producto.StockMinimo = (int)Datos.Lector["stock_minimo"];

                    producto.Precio = Convert.ToSingle(Datos.Lector["precio"]);
                    producto.PorcentajeGanancia = Convert.ToSingle(Datos.Lector["porcentaje_ganancia"]);

                    producto.Activo = Convert.ToBoolean(Datos.Lector["activo"]);

                    // MARCA
                    producto.Marca = new Marca();
                    producto.Marca.Id = Convert.ToInt32(Datos.Lector["id_marca"]);
                    producto.Marca.Nombre = Datos.Lector["nombre_marca"].ToString();

                    // CATEGORIA
                    producto.Categoria = new Categoria();
                    producto.Categoria.Id = Convert.ToInt32(Datos.Lector["id_categoria"]);
                    producto.Categoria.Nombre = Datos.Lector["nombre_categoria"].ToString();

                    // PROVEEDOR
                    producto.Proveedor = new Proveedor();
                    producto.Proveedor.Id = Convert.ToInt32(Datos.Lector["id_proveedor"]);
                    producto.Proveedor.Nombre = Datos.Lector["nombre_proveedor"].ToString();

                    if (Datos.Lector["cuil"] != DBNull.Value)
                        producto.Proveedor.Cuil = Datos.Lector["cuil"].ToString();

                    // IMAGEN
                    producto.Imagen = new Imagen();

                    if (Datos.Lector["id_imagen"] != DBNull.Value &&
                         Datos.Lector["url_imagen"] != DBNull.Value)
                    {
                        producto.Imagen.Id = Convert.ToInt32(Datos.Lector["id_imagen"]);
                        producto.Imagen.Url = Datos.Lector["url_imagen"].ToString();
                    }
                    else
                    {
                        producto.Imagen.Id = 0;
                        producto.Imagen.Url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLyxIVWg1RJUCYrlPYfWA_gzwdBHqEjNSLs2q88bW0Gr-OrEgGzR2MHzU&s=10";
                    }

                    Productos.Add(producto);
                }

                return Productos;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar productos: " + ex.Message, ex);
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public bool Agregar(Producto Producto)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaProducto");

                Datos.setearParametro("@nombre", Producto.Nombre);
                Datos.setearParametro("@descripcion", Producto.Descripcion);
                Datos.setearParametro("@id_marca", Producto.Marca.Id);
                Datos.setearParametro("@id_categoria", Producto.Categoria.Id);
                Datos.setearParametro("@id_proveedor", Producto.Proveedor.Id);
                Datos.setearParametro("@precio", Math.Round((decimal)Producto.Precio, 2));
                Datos.setearParametro("@stock_actual", Producto.StockActual);
                Datos.setearParametro("@stock_minimo", Producto.StockMinimo);
                Datos.setearParametro("@porcentaje_ganancia", Math.Round((decimal)Producto.PorcentajeGanancia, 2));
                Datos.setearParametro("@url_imagen", Producto.Imagen.Url);
                Datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public void Eliminar(int id, bool activo = false)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarProducto");

                Datos.setearParametro("@id_producto", id);
                Datos.setearParametro("@activo", activo);

                Datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public void Modificar(Producto Producto)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarProducto");

                Datos.setearParametro("@id_producto", Producto.Id);
                Datos.setearParametro("@nombre", Producto.Nombre);
                Datos.setearParametro("@id_marca", Producto.Marca.Id);
                Datos.setearParametro("@id_categoria", Producto.Categoria.Id);
                Datos.setearParametro("@descripcion", Producto.Descripcion);
                Datos.setearParametro("@stock_actual", Producto.StockActual);
                Datos.setearParametro("@stock_minimo", Producto.StockMinimo);
                Datos.setearParametro("@porcentaje_ganancia", Producto.PorcentajeGanancia);
                Datos.setearParametro("@id_imagen", Producto.Imagen.Id);
                Datos.setearParametro("@id_proveedor", Producto.Proveedor.Id);
                Datos.setearParametro("@activo", Producto.Activo);

                Datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

    }
}
