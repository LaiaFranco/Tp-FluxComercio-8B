using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;


namespace Negocio
{
    public class InicioNegocio
    {
        public decimal ObtenerTotalVentasDelDia()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedTotalVentasDelDia");

                object resultado = datos.ejecutarAccionScalar();

                if (resultado == null || resultado == DBNull.Value)
                    return 0;

                return Convert.ToDecimal(resultado);
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

        public int ObtenerCantidadProductosActivos()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedCantidadProductosActivos");

                object resultado = datos.ejecutarAccionScalar();

                if (resultado == null || resultado == DBNull.Value)
                    return 0;

                return Convert.ToInt32(resultado);
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
        public int ObtenerCantidadProductosBajoStock()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento(
                    "storedCantidadProductosBajoStock"
                );

                object resultado = datos.ejecutarAccionScalar();

                if (resultado == null || resultado == DBNull.Value)
                    return 0;

                return Convert.ToInt32(resultado);
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

        public decimal ObtenerGananciaEstimadaVentas()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento(
                    "storedGananciaEstimadaVentas"
                );

                object resultado = datos.ejecutarAccionScalar();

                if (resultado == null || resultado == DBNull.Value)
                    return 0;

                return Convert.ToDecimal(resultado);
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
    }
}