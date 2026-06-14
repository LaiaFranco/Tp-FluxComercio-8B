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
                    Producto Producto = new Producto();

                    Producto.Id = (int)Datos.Lector["id_producto"];
                    Producto.Nombre = (string)Datos.Lector["nombre"];
                    Producto.Descripcion = (string)Datos.Lector["descripcion"];
                    Producto.StocmkActual = Convert.ToSingle(Datos.Lector["stock_actual"]);
                    Producto.StockMinimo = Convert.ToSingle(Datos.Lector["stock_minimo"]);
                    Producto.PorcentajeGanancia = Convert.ToSingle(Datos.Lector["porcentaje_ganancia"]);
                    Producto.Activo = (bool)Datos.Lector["activo"];

                    // MARCA
                    Marca Marca = new Marca();

                    Marca.Id = (int)Datos.Lector["id_marca"];
                    Marca.Nombre = (string)Datos.Lector["nombre_marca"];

                    Producto.Marca = Marca;

                    // CATEGORIA
                    Categoria Categoria = new Categoria();

                    Categoria.Id = (int)Datos.Lector["id_categoria"];
                    Categoria.Nombre = (string)Datos.Lector["nombre_categoria"];

                    Producto.Categoria = Categoria;

                    // IMAGEN
                    Imagen Imagen = new Imagen();

                    Imagen.Id = (int)Datos.Lector["id_imagen"];
                    Imagen.Url = (string)Datos.Lector["url_imagen"];

                    Producto.Imagen = Imagen;

                    // PROVEEDOR
                    Proveedor Proveedor = new Proveedor();

                    Proveedor.Id = (int)Datos.Lector["id_proveedor"];
                    Proveedor.Nombre = (string)Datos.Lector["nombre_proveedor"];
                    Proveedor.Cuil = (string)Datos.Lector["cuil"]; 

                    Producto.Proveedor = Proveedor;

                    Productos.Add(Producto);
                }

                return Productos;
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

        public void Agregar(Producto Producto)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaProducto");

                Datos.setearParametro("@nombre", Producto.Nombre);
                Datos.setearParametro("@id_marca", Producto.Marca.Id);
                Datos.setearParametro("@id_categoria", Producto.Categoria.Id);
                Datos.setearParametro("@descripcion", Producto.Descripcion);
                Datos.setearParametro("@stock_actual", Producto.StocmkActual);
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
                Datos.setearParametro("@stock_actual", Producto.StocmkActual);
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
