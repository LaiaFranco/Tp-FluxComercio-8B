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
                Datos.setearProcedimiento("storedModificarCliente");
                Datos.setearParametro("@idVenta", id);
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
                Datos.setearParametro("@nombre", cliente.Nombre);
                Datos.setearParametro("@apellido", cliente.Apellido);
                Datos.setearParametro("@email", cliente.Email);
                Datos.setearParametro("@telefono", cliente.Telefono);
                Datos.setearParametro("@direccion", cliente.Direccion);
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
