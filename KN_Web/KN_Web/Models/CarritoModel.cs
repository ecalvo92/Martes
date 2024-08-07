using KN_Web.BaseDatos;
using KN_Web.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KN_Web.Models
{
    public class CarritoModel
    {
        public bool RegistrarCarrito(int IdProducto, int Cantidad)
        {
            var rowsAffected = 0;
        
            using (var context = new MARTES_BDEntities())
            {
                int Consecutivo = int.Parse(HttpContext.Current.Session["ConsecutivoUsuario"].ToString());
                rowsAffected = context.RegistrarCarrito(Consecutivo, IdProducto, Cantidad);
            }

            return (rowsAffected > 0 ? true : false);
        }

        public List<ConsultarCarrito_Result> ConsultarCarrito()
        {
            using (var context = new MARTES_BDEntities())
            {
                int Consecutivo = int.Parse(HttpContext.Current.Session["ConsecutivoUsuario"].ToString());
                return context.ConsultarCarrito(Consecutivo).ToList();
            }
        }

        public bool PagarCarrito()
        {
            var rowsAffected = 0;

            using (var context = new MARTES_BDEntities())
            {
                int Consecutivo = int.Parse(HttpContext.Current.Session["ConsecutivoUsuario"].ToString());
                rowsAffected = context.PagarCarrito(Consecutivo);
            }

            return (rowsAffected > 0 ? true : false);
        }

    }
}