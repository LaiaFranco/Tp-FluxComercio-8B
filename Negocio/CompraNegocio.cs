using Dominio; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;


namespace Negocio
{
    public class CompraNegocio
    {
        public List<Compra> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Compra> Compras = new List<Compra>();

            try
            {
                Datos.setearProcedimiento("storedListarCompras");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Compra Compra = new Compra();

                    /*Compra.Id = (int)Datos.Lector["id_compra"];
                    Compra.Total = (float)Datos.Lector["total"];
                    Compra.Fecha = (DateTime)Datos.Lector["fecha"];


                    Proveedor Proveedor = new Proveedor();
                    Proveedor.Id = (int)Datos.Lector["id_proveedor"];
                    Proveedor.Cuil = (string)Datos.Lector["cuil"];
                    Proveedor.Nombre = (string)Datos.Lector["nombre_proveedor"];
                    Proveedor.Activo = (bool)Datos.Lector["activo"];

                    Usuario Usuario = new Usuario();
                    Usuario.Id = (int)Datos.Lector["id_usuario"];
                    Usuario.Rol = (Rol)Datos.Lector["rol_usuario"];

                    DetalleCompra DetalleCompra = new DetalleCompra();
                    DetalleCompra.Id = (int)Datos.Lector["id_detalleCompra"];


                    Compra.Usuario = Usuario;
                    Compra.Proveedor = Proveedor;*/

                    Compras.Add(Compra); 
                }
                
                return Compras;     
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
