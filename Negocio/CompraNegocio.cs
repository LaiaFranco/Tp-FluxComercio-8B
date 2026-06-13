using Dominio; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;


namespace Negocio
{
    internal class CompraNegocio
    {
        public List<Compra> Listar()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Compra> Compras = new List<Compra>();

            try
            {



                return Compras; 
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
