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

                    // pendiente terminar
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return Ventas;

        }
        public void Agregar() { }
        public void Eliminar() { }
        public void Modificar() { }
    }
}