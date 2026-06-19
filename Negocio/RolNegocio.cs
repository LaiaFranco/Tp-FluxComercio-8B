using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class RolNegocio
    {
        
       public List<Rol> Listar()
        {

            AccesoDatos Datos = new AccesoDatos();
            List<Rol> Roles = new List<Rol>();
            try
            {

                Datos.setearProcedimiento("storedListarRoles");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Rol NuevoRol = new Rol();

                    NuevoRol.Id = (int)Datos.Lector["id_rol"];
                    NuevoRol.Nombre = (string)Datos.Lector["nombre"];

                    Roles.Add(NuevoRol);
                }

                return Roles;

            }catch (Exception ex)
            {
                throw ex;
            }
    }
}}
