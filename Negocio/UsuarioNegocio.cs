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
                    Usuario.Nombre = (string)Datos.Lector["nombre"];
                    Usuario.Email = (string)Datos.Lector["email"];
                    Usuario.Password = (string)Datos.Lector["password_u"];
                    Usuario.Activo = (bool)Datos.Lector["activo"];

                    // ROL
                    Rol Rol = new Rol();

                    Rol.Id = (int)Datos.Lector["id_rol"];
                    Rol.Nombre = (string)Datos.Lector["nombre_rol"];

                    Usuario.Rol = Rol;

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

                Datos.setearParametro("@nombre", Usuario.Nombre);
                Datos.setearParametro("@email", Usuario.Email);
                Datos.setearParametro("@password_u", Usuario.Password);
                Datos.setearParametro("@id_rol", Usuario.Rol.Id);
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

                string query = "UPDATE USUARIOS SET activo = @activo WHERE id_usuario = @id_usuario";

                Datos.setearConsulta(query);
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
                Datos.setearParametro("@nombre", Usuario.Nombre);
                Datos.setearParametro("@email", Usuario.Email);
                Datos.setearParametro("@password_u", Usuario.Password);
                Datos.setearParametro("@id_rol", Usuario.Rol.Id);
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

        public Usuario GetUsuario(int id)
        {

            AccesoDatos Datos = new AccesoDatos();


            try
            {

                string query = @"SELECT 
                            u.id_usuario,
                            u.nombre,
                            u.email,
                            u.id_rol,
                            u.activo
                            FROM USUARIOS u
                            INNER JOIN ROLES r ON u.id_rol = r.id_rol
                            WHERE u.id_usuario = @id";

                Datos.setearConsulta(query);
                Datos.setearParametro("@id", id);
                Datos.ejecutarLectura();

                if (Datos.Lector != null && Datos.Lector.Read())
                {

                    Usuario NuevoUsuario = new Usuario();

                    NuevoUsuario.Id = (int)Datos.Lector["id_usuario"];

                    NuevoUsuario.Rol = new Rol();
                    NuevoUsuario.Rol.Id = (int)Datos.Lector["id_rol"];
                    NuevoUsuario.Activo = (bool)Datos.Lector["activo"];
                    NuevoUsuario.Email = (string)Datos.Lector["email"];
                    NuevoUsuario.Nombre = (string)Datos.Lector["nombre"];

            

                    return NuevoUsuario;
                }

                return null;

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

        public Usuario GetUsuarioCredenciales(string email,string passowrd)
        {
            AccesoDatos Datos = new AccesoDatos();


            try
            {

                string query = @"SELECT 
                            u.id_usuario,
                            u.nombre,
                            u.email,
                            u.id_rol,
                            r.nombre AS nombre_rol,
                            u.activo
                            FROM USUARIOS u
                            INNER JOIN ROLES r ON u.id_rol = r.id_rol
                            WHERE u.email = @email AND u.password = @password";

                Datos.setearConsulta(query);
                Datos.setearParametro("@email", email);
                Datos.setearParametro("@password", passowrd);

                if (Datos.Lector.Read())
                {

                    Usuario NuevoUsuario = new Usuario();

                    NuevoUsuario.Id = (int)Datos.Lector["id_usuario"];

                    NuevoUsuario.Rol = new Rol();
                    NuevoUsuario.Rol.Id = (int)Datos.Lector["id_rol"];
                    NuevoUsuario.Rol.Nombre = (string)Datos.Lector["nombre_rol"];
                    NuevoUsuario.Activo = (bool)Datos.Lector["activo"];
                    NuevoUsuario.Nombre = (string)Datos.Lector["nombre"];

                    return NuevoUsuario;
                }

                return null;

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
