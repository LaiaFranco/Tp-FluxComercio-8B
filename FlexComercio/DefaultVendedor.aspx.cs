using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class DefaultCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["usuarioIngresado"];

                lblVentasHoy.Text = ObtenerVentasHoy(usuario.Id).ToString("C");
                CargarDashboard();
            }
        }

        private void CargarDashboard()
        {
            Usuario usuario = (Usuario)Session["usuarioIngresado"];

            lblVentasHoy.Text = ObtenerVentasHoy(usuario.Id).ToString("C");

            lblProductos.Text = ObtenerCantidadProductos().ToString();

            lblStockBajo.Text = ObtenerProductosBajoStock().ToString();

            lblGanancia.Text = ObtenerGananciaHoy(usuario.Id).ToString("C");
        }

        private decimal ObtenerVentasHoy(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT ISNULL(SUM(Total),0)
            FROM VENTAS
            WHERE CAST(Fecha AS DATE) = CAST(GETDATE() AS DATE)
            AND id_usuario = @idUsuario");

                datos.setearParametro("@idUsuario", idUsuario);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToDecimal(datos.Lector[0]);

                return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        private int ObtenerCantidadProductos()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT COUNT(*)
            FROM PRODUCTOS
            WHERE activo = 1");

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToInt32(datos.Lector[0]);

                return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        private int ObtenerProductosBajoStock()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT COUNT(*)
            FROM PRODUCTOS
            WHERE stock_actual <= stock_minimo
            AND activo = 1");

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToInt32(datos.Lector[0]);

                return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        private decimal ObtenerGananciaHoy(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT ISNULL(SUM(
                (
                    vd.precio_unitario -
                    (vd.precio_unitario / (1 + p.porcentaje_ganancia / 100.0))
                ) * vd.cantidad
            ),0)
            FROM VENTA_DETALLES vd
            INNER JOIN VENTAS v
                ON vd.id_venta = v.id_venta
            INNER JOIN PRODUCTOS p
                ON vd.id_producto = p.id_producto
            WHERE v.id_usuario = @idUsuario
            AND CAST(v.fecha AS DATE) = CAST(GETDATE() AS DATE)
            AND v.activo = 1");

                datos.setearParametro("@idUsuario", idUsuario);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToDecimal(datos.Lector[0]);

                return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}