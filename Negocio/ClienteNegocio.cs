using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using negocio;

namespace Negocio
{
    public class ClienteNegocio
    {
        public List<Cliente> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Cliente> Clientes = new List<Cliente>();

            try
            {
                Datos.setearProcedimiento("storedListarClientes");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Cliente Cliente = new Cliente();

                    Cliente.Id = (int)Datos.Lector["id_cliente"];
                    Cliente.Dni = (string)Datos.Lector["dni"];
                    Cliente.Nombre = (string)Datos.Lector["nombre"];
                    Cliente.Apellido = (string)Datos.Lector["apellido"];
                    Cliente.Email = (string)Datos.Lector["email"];
                    Cliente.Telefono = (string)Datos.Lector["telefono"];
                    Cliente.Direccion = (string)Datos.Lector["direccion"];
                    Cliente.Activo = (bool)Datos.Lector["activo"];

                    Clientes.Add(Cliente);
                }
                return Clientes;

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

        public void Agregar(Cliente nuevoCliente)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedAltaCliente");
                Datos.setearParametro("@dni", nuevoCliente.Dni);
                Datos.setearParametro("@nombre", nuevoCliente.Nombre);
                Datos.setearParametro("@apellido", nuevoCliente.Apellido);
                Datos.setearParametro("@email", nuevoCliente.Email);
                Datos.setearParametro("@telefono", nuevoCliente.Telefono);
                Datos.setearParametro("@direccion", nuevoCliente.Direccion);
                Datos.setearParametro("@activo", nuevoCliente.Activo);

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

                string query = "UPDATE CLIENTES SET activo = @activo WHERE id_cliente = @id";
                Datos.setearConsulta(query);
                Datos.setearParametro("@id", id);
                Datos.setearParametro("@activo", false);
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
        public void Modificar(Cliente cliente)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedModificarCliente");
                Datos.setearParametro("@id_cliente", cliente.Id);
                Datos.setearParametro("@nombre", cliente.Nombre);
                Datos.setearParametro("@apellido", cliente.Apellido);
                Datos.setearParametro("@email", cliente.Email);
                Datos.setearParametro("@telefono", cliente.Telefono);
                Datos.setearParametro("@direccion", cliente.Direccion);

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

        public Cliente GetCliente(int id)
        {
            AccesoDatos Datos = new AccesoDatos();
            Cliente cliente = null;

            try
            {
                string query = "SELECT id_cliente, dni, nombre, apellido, email, telefono, direccion, activo FROM CLIENTES WHERE id_cliente = @id";
                Datos.setearConsulta(query);
                Datos.setearParametro("@id", id);
                Datos.ejecutarLectura();

                if (Datos.Lector.Read())
                {
                    cliente = new Cliente();
                    cliente.Id = (int)Datos.Lector["id_cliente"];
                    cliente.Dni = (string)Datos.Lector["dni"];
                    cliente.Nombre = (string)Datos.Lector["nombre"];
                    cliente.Apellido = (string)Datos.Lector["apellido"];
                    cliente.Email = (string)Datos.Lector["email"];
                    cliente.Telefono = (string)Datos.Lector["telefono"];
                    cliente.Direccion = (string)Datos.Lector["direccion"];
                    cliente.Activo = (bool)Datos.Lector["activo"];
                }

                return cliente;
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
        public void Habilitar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE CLIENTES SET Activo = 1 WHERE id_cliente = @id");
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

   
 

