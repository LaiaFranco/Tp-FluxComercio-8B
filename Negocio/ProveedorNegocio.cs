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

                    aux.id = (int)datos.Lector["id_proveedor"];
                    aux.cuil = (string)datos.Lector["cuil"];
                    aux.nombre = (string)datos.Lector["nombre"];
                    aux.email = (string)datos.Lector["email"];
                    aux.telefono = (string)datos.Lector["telefono"];
                    aux.direccion = (string)datos.Lector["direccion"];
                    aux.activo = (bool)datos.Lector["activo"];

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