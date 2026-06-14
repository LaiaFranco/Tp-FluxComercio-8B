using Dominio;
using negocio;
using Negocio; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Marca> Marcas = new List<Marca>();

            try
            {
                Datos.setearProcedimiento("storedListarMarcas");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Marca Marca = new Marca();

                    Marca.Id = (int)Datos.Lector["id_marca"];
                    Marca.Nombre = (string)Datos.Lector["nombre"];
                    Marca.Descripcion = (string)Datos.Lector["descripcion"];
                    Marca.Activo = (bool)Datos.Lector["activo"];

                    Marcas.Add(Marca);
                }

                return Marcas;
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

        public void Agregar(Marca Marca)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaMarca");

                Datos.setearParametro("@nombre", Marca.Nombre);
                Datos.setearParametro("@descripcion", Marca.Descripcion);
                Datos.setearParametro("@activo", Marca.Activo);

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
                Datos.setearProcedimiento("storedModificarMarca");
                Datos.setearParametro("@id_marca", id);
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

        public void Modificar(Marca marca)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarMarca");

                Datos.setearParametro("@id_marca", marca.Id);
                Datos.setearParametro("@nombre", marca.Nombre);
                Datos.setearParametro("@descripcion", marca.Descripcion);
                Datos.setearParametro("@activo", marca.Activo);

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
