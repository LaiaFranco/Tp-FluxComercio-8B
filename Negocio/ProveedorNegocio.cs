using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using negocio;

namespace Negocio
{
    public class ProveedorNegocio
    {
        public List<Proveedor> Listar()
        {
            List<Proveedor> lista = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedListarProveedores");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Proveedor aux = new Proveedor();

                    aux.Id = (int)datos.Lector["id_proveedor"];
                    aux.Cuil = (string)datos.Lector["cuil"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Email = (string)datos.Lector["email"];
                    aux.Telefono = (string)datos.Lector["telefono"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.Activo = (bool)datos.Lector["activo"];

                   

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


        public List<Producto> Productos(int idProveerdor)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Producto> ListaDeProductos = new List<Producto>();
            try
            {
                datos.setearProcedimiento("storedListarProductosPorProveedor");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto NuevoProducto = new Producto();

                    NuevoProducto.Id = (int)datos.Lector["id_producto"];
                    NuevoProducto.Nombre = (string)datos.Lector["id_producto"];
                    NuevoProducto.Descripcion = (string)datos.Lector["descripcion"];

                    Marca NuevaMarca = new Marca();
                    NuevoProducto.Id = (int)datos.Lector["id_marca"];

                    Proveedor NuevoProveedor = new Proveedor();
                    NuevoProveedor.Id = (int)datos.Lector["id_proveedor"];

                    NuevoProducto.StockActual = (int)datos.Lector["id_producto"];
                    NuevoProducto.StockMinimo= (int)datos.Lector["id_producto"];
                    NuevoProducto.Precio = (float)datos.Lector["id_producto"];
                    NuevoProducto.Activo = (bool)datos.Lector["activo"];
                    NuevoProducto.PorcentajeGanancia = (float)datos.Lector["procentaje_ganacia"];

           

                    ListaDeProductos.Add(NuevoProducto);

                }

                return ListaDeProductos;

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


        public void Agregar(Proveedor nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedAltaProveedor");
                datos.setearParametro("@cuil", nuevo.Cuil);
                datos.setearParametro("@nombre", nuevo.Nombre);
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@telefono", nuevo.Telefono);
                datos.setearParametro("@direccion", nuevo.Direccion);
                datos.setearParametro("@activo", nuevo.Activo);

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
        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedEliminarProveedor");
                datos.setearParametro("@id_proveedor", id);
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
        public Proveedor ListarPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Proveedor aux = new Proveedor();

            try
            {
                datos.setearProcedimiento("storedListarProveedorPorId");
                datos.setearParametro("@id_proveedor", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    aux.Id = (int)datos.Lector["id_proveedor"];
                    aux.Cuil = (string)datos.Lector["cuil"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Email = (string)datos.Lector["email"];
                    aux.Telefono = (string)datos.Lector["telefono"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.Activo = (bool)datos.Lector["activo"];
                }

                return aux;
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
        public void Modificar(Proveedor proveedor)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedModificarProveedor");
                datos.setearParametro("@id_proveedor", proveedor.Id);
                datos.setearParametro("@cuil", proveedor.Cuil);
                datos.setearParametro("@nombre", proveedor.Nombre);
                datos.setearParametro("@email", proveedor.Email);
                datos.setearParametro("@telefono", proveedor.Telefono);
                datos.setearParametro("@direccion", proveedor.Direccion);
                datos.setearParametro("@activo", proveedor.Activo);

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

        public bool ExisteProveedor(string nombre, string cuil)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    SELECT COUNT(*)
                    FROM PROVEEDORES
                    WHERE UPPER(Nombre) = UPPER(@nombre)
                       OR Cuil = @cuil");

                datos.setearParametro("@nombre", nombre.Trim());
                datos.setearParametro("@cuil", cuil.Trim());

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToInt32(datos.Lector[0]) > 0;

                return false;
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
        public void Habilitar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE PROVEEDORES SET Activo = 1 WHERE id_proveedor = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}