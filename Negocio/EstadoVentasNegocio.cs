using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EstadoVentasNegocio
    {

        public List<EstadoVentas> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<EstadoVentas> EstaVentasLista = new List<EstadoVentas>();

            try
            {

                Datos.setearConsulta("SELECT id_estado_venta,nombre FROM ESTADO_VENTA");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {

                    EstadoVentas Estado = new EstadoVentas();

                    Estado.Id = (int)Datos.Lector["id_estado_venta"];
                    Estado.Nombre = (string)Datos.Lector["nombre"];

                    EstaVentasLista.Add(Estado);
                }

                return EstaVentasLista;
            


            }catch(Exception ex)
            {

                throw ex;
            }
        }
    }
}
