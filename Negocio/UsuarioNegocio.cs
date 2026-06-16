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
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Usuario> Usuarios = new List<Usuario>();

            try
            {
                Datos.setearProcedimiento("storedListarUsuarios");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Usuario Usuario = new Usuario();

                    Usuario.Id = (int)Datos.Lector["id_usuario"];
                    Usuario.Dni = (string)Datos.Lector["dni"];
                    Usuario.Nombre = (string)Datos.Lector["nombre"];
                    Usuario.Email = (string)Datos.Lector["email"];
                    Usuario.Password = (string)Datos.Lector["password"];
                    Usuario.Activo = (bool)Datos.Lector["activo"];

                    // ROL
                    Rol Rol = new Rol();

                    Rol.Id = (int)Datos.Lector["id_rol"];
                    Rol.Nombre = (string)Datos.Lector["nombre_rol"];

                    Usuario.Rol = Rol;

                    // FOTO PERFIL
                    Imagen Imagen = new Imagen();

                    Imagen.Id = (int)Datos.Lector["id_imagen"];
                    Imagen.Url = (string)Datos.Lector["url_imagen"];

                    Usuario.FotoPerfil = Imagen;

                    Usuarios.Add(Usuario);
                }

                return Usuarios;
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

        public void Agregar(Usuario Usuario)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaUsuario");

                Datos.setearParametro("@dni", Usuario.Dni);
                Datos.setearParametro("@nombre", Usuario.Nombre);
                Datos.setearParametro("@email", Usuario.Email);
                Datos.setearParametro("@password", Usuario.Password);
                Datos.setearParametro("@id_rol", Usuario.Rol.Id);
                Datos.setearParametro("@id_imagen", Usuario.FotoPerfil.Id);
                Datos.setearParametro("@activo", Usuario.Activo);

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
                Datos.setearProcedimiento("storedModificarUsuario");

                Datos.setearParametro("@id_usuario", id);
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

        public void Modificar(Usuario Usuario)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarUsuario");

                Datos.setearParametro("@id_usuario", Usuario.Id);
                Datos.setearParametro("@dni", Usuario.Dni);
                Datos.setearParametro("@nombre", Usuario.Nombre);
                Datos.setearParametro("@email", Usuario.Email);
                Datos.setearParametro("@password", Usuario.Password);
                Datos.setearParametro("@id_rol", Usuario.Rol.Id);
                Datos.setearParametro("@id_imagen", Usuario.FotoPerfil.Id);
                Datos.setearParametro("@activo", Usuario.Activo);

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
