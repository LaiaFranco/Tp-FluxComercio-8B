using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using negocio;
using Negocio;

namespace Negocio
{
    internal class VentasNegocio
    {

        public List<Venta> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Venta> Ventas = new List<Venta>();

            try
            {
               

                Datos.setearProcedimiento("storedVentas");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {

                    Venta Venta = new Venta();

                    Venta.Id = (int)Datos.Lector["Id_Venta"];
                    Venta.Fecha = (DateTime)Datos.Lector["Fecha"];

                    Usuario User = new Usuario();
                    User.Id = (int)Datos.Lector["Id_Usuario"];
                    User.Dni = (string)Datos.Lector["Dni"];
                    User.Nombre = (string)Datos.Lector["Nombre"];
                    User.Activo = (bool)Datos.Lector["Activo"];
                    Venta.Usuario = User;

                    Cliente Cliente = new Cliente();

                    Cliente.Id = (int)Datos.Lector["Id_Cliente"];
                    Cliente.Nombre = (string)Datos.Lector["Nombre"];
                    Cliente.Apellido = (string)Datos.Lector["Apellido"];
                    Cliente.Email = (string)Datos.Lector["Email"];
                    Cliente.Dni = (string)Datos.Lector["Dni"];
                    Cliente.Telefono = (string)Datos.Lector["Telefono"];
                    
                    Venta.Cliente = Cliente;

                    Venta.Total = (decimal)Datos.Lector["Total"];
                    Venta.NumFactura = (int)Datos.Lector["Numero_Factura"];

                    Ventas.Add(Venta);
                }

                return Ventas;

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

        public void Agregar(Venta NuevaVenta) {

            AccesoDatos Datos = new AccesoDatos();

            try
            {

                Datos.setearProcedimiento("storedVentas");
                Datos.setearParametro("@idCliente", NuevaVenta.Cliente.Id);
                Datos.setearParametro("@idUsuario", NuevaVenta.Usuario.Id);
                Datos.setearParametro("@total", NuevaVenta.Total);
                Datos.ejecutarAccion();

            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        
        }
        public void Eliminar(int id ,bool activo = false) {

            AccesoDatos Datos = new AccesoDatos();

            try
            {

                Datos.setearProcedimiento("storedActualizarVenta");
                Datos.setearParametro("@idVenta", id);
                Datos.setearParametro("@activo", activo);  
                Datos.ejecutarAccion();


            }
            catch(Exception ex)
            {
                throw ex;
            }
        
        }

        public void Modificar(Venta Venta) {

            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearProcedimiento("storedActualizarVenta");
                Datos.setearParametro("@id", Venta.Id);
                Datos.setearParametro("@idCliente", Venta.Cliente.Id);
                Datos.setearParametro("@idUsuario", Venta.Usuario.Id);
                Datos.setearParametro("@total", Venta.Id);
                Datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally {
                Datos.cerrarConexion();
            }
           
        }
    }
}