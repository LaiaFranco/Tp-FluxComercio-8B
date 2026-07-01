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
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Categoria> Categorias = new List<Categoria>();

            try
            {
                Datos.setearProcedimiento("storedListarCategorias");
                Datos.ejecutarLectura(); 

                while (Datos.Lector.Read())
                {
                    Categoria Categoria = new Categoria();

                    Categoria.Id = (int)Datos.Lector["id_categoria"]; 
                    Categoria.Nombre = (string)Datos.Lector["nombre"];
                    Categoria.Descripcion  = (string)Datos.Lector["descripcion"];
                    Categoria.Activo = (bool)Datos.Lector["activo"];

                    Categorias.Add(Categoria); 
                }

                return Categorias; 

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


        public bool Agregar(Categoria Categoria)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaCategoria");
                
                Datos.setearParametro("@nombre",Categoria.Nombre);
                Datos.setearParametro("@descripcion",Categoria.Descripcion);
                Datos.setearParametro("@activo",Categoria.Activo);

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

        public bool Eliminar(int id, bool activo = false)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedCambiarEstadoCategoria");
                Datos.setearParametro("@id_categoria",id);
                Datos.setearParametro("@activo", activo);
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

        public bool Modificar(Categoria categoria)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarCategoria");
                Datos.setearParametro("@id_categoria",categoria.Id);
                Datos.setearParametro("@nombre",categoria.Nombre);
                Datos.setearParametro("@descripcion", categoria.Descripcion);
                Datos.setearParametro("@activo", true);
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

        public bool ExisteMarca(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                            SELECT COUNT(*)
                            FROM CATEGORIAS
                            WHERE UPPER(Nombre) = UPPER(@nombre)");

                datos.setearParametro("@nombre", nombre.Trim());

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
                datos.setearConsulta("UPDATE CATEGORIAS SET Activo = 1 WHERE id_categoria = @id");
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
