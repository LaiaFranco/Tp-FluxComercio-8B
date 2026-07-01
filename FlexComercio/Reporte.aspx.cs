using System;
using System.Collections.Generic;
using System.Linq;
using Dominio;
using Negocio;

namespace FlexComercio
{
    public partial class Reporte : System.Web.UI.Page
    {
        VentasNegocio ventaNegocio = new VentasNegocio();
        ProductoNegocio productoNegocio = new ProductoNegocio();
        ClienteNegocio clienteNegocio = new ClienteNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarReportes();
            }
        }

        private void CargarReportes()
        {
            CargarVentas();
            CargarProductos();
            CargarClientes();
            CargarGanancia();
            CargarStockBajo();
            CargarUltimasVentas();
        }

        private void CargarVentas()
        {
            List<Venta> ventas = ventaNegocio.Listar();

            DateTime hoy = DateTime.Today;

            var ventasMes = ventas.Where(x =>
                    x.Fecha.Month == hoy.Month &&
                    x.Fecha.Year == hoy.Year).ToList();

            decimal total = ventasMes.Sum(x => x.Total);

            lblVentasTotales.Text = total.ToString("C");

            lblCantidadVentas.Text = ventasMes.Count + " ventas realizadas";
        }

        private void CargarProductos()
        {
            List<Dominio.Producto> productos = productoNegocio.Listar();

            lblProductos.Text = productos.Count.ToString();
        }

        private void CargarClientes()
        {
            List<Dominio.Cliente> clientes = clienteNegocio.Listar();

            lblClientes.Text = clientes.Count.ToString();
        }

        private void CargarGanancia()
        {
            decimal ganancia = ventaNegocio.ObtenerGananciaDelDia();

            lblGananciaTotal.Text = ganancia.ToString("C");

            decimal ventasDelDia = ventaNegocio.ObtenerVentasDelDia();

            decimal margen = 0;

            if (ventasDelDia > 0)
                margen = (ganancia / ventasDelDia) * 100;

            lblMargenPromedio.Text = margen.ToString("0.00") + "% de margen promedio";
        }

        private void CargarStockBajo()
        {
            List<Dominio.Producto> productos = productoNegocio.Listar();

            var bajos = productos.Where(x => x.StockActual <= 5).ToList();

            if (bajos.Count == 0)
            {
                lblStockBajo.Text = "No hay productos con stock bajo";
                return;
            }

            lblStockBajo.Text = "";

            foreach (Dominio.Producto p in bajos)
            {
                lblStockBajo.Text +=
                    p.Nombre + " (" + p.StockActual + " unidades)<br/>";
            }
        }

        private void CargarUltimasVentas()
        {
            List<Venta> ventas = ventaNegocio.Listar();

            var ultimas = ventas
                .OrderByDescending(x => x.Fecha)
                .Take(5)
                .ToList();

            if (ultimas.Count == 0)
            {
                lblUltimasVentas.Text = "No hay ventas registradas";
                return;
            }

            lblUltimasVentas.Text = "";

            foreach (Venta venta in ultimas)
            {
                lblUltimasVentas.Text +=
                    venta.Fecha.ToShortDateString() +
                    " - " +
                    venta.Cliente.Nombre +
                    " - " +
                    venta.Total.ToString("C") +
                    "<br/>";
            }
        }
    }
}