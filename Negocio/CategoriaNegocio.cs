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


        public void Agregar(Categoria Categoria)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaCategoria");
                Datos.ejecutarLectura();

                Datos.setearParametro("@nombre",Categoria.Nombre);
                Datos.setearParametro("@descripcion",Categoria.Descripcion);
                Datos.setearParametro("@activo",Categoria.Activo);

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
                Datos.setearProcedimiento("storedModificarCategoria");
                Datos.setearParametro("id_categoria",id);
                Datos.setearParametro("activo", activo);

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

        public void Modificar(Categoria categoria)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarCategoria");
                Datos.setearParametro("@id_categoria",categoria.Id);
                Datos.setearParametro("@nombre",categoria.Nombre);
                Datos.setearParametro("@descipcion",categoria.Descripcion);
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
