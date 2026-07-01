using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using negocio;
using System.Data;

namespace Negocio
{
    public class CompraNegocio
    {
        public List<Compra> Listar()
        {
            List<Compra> lista = new List<Compra>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedListarCompras");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();

                    aux.Id = (int)datos.Lector["id_compra"];
                    aux.Fecha = (DateTime)datos.Lector["fecha"];
                    aux.Total = (decimal)datos.Lector["total"];

                    aux.Proveedor = new Proveedor();
                    aux.Proveedor.Id = (int)datos.Lector["id_proveedor"];
                    aux.Proveedor.Cuil = (string)datos.Lector["cuil"];
                    aux.Proveedor.Nombre = (string)datos.Lector["nombre_proveedor"];

                    aux.Usuario = new Usuario();
                    aux.Usuario.Id = (int)datos.Lector["id_usuario"];
                    aux.Usuario.Nombre = (string)datos.Lector["nombre_usuario"];

                    aux.Usuario.Rol = new Rol();
                    aux.Usuario.Rol.Id = (int)datos.Lector["id_rol"];
                    aux.Usuario.Rol.Nombre = (string)datos.Lector["nombre_rol"];

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

        public List<Producto> ListarPorProveedor(int idProveedor)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista = negocio.Listar();

            return lista.Where(p => p.Proveedor.Id == idProveedor).ToList();
        }

        public int Agregar(Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                DataTable detalles = new DataTable();

                detalles.Columns.Add("id_producto", typeof(int));
                detalles.Columns.Add("cantidad", typeof(int));
                detalles.Columns.Add("precio_unitario", typeof(decimal));

                foreach (DetalleCompra detalle in compra.Detalles)
                {
                    detalles.Rows.Add(
                        detalle.Producto.Id,
                        detalle.Cantidad,
                        Math.Round((decimal)detalle.PrecioUnitario, 2)
                    );
                }

                datos.setearProcedimiento("storedRegistrarCompra");

                datos.setearParametro("@fecha", compra.Fecha);
                datos.setearParametro(
                    "@id_proveedor",
                    compra.Proveedor.Id
                );
                datos.setearParametro(
                    "@id_usuario",
                    compra.Usuario.Id
                );

                datos.setearParametroTabla(
                    "@detalles",
                    detalles,
                    "dbo.TipoDetalleCompra"
                );

                object resultado = datos.ejecutarAccionScalar();

                return Convert.ToInt32(resultado);
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