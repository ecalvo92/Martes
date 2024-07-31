using KN_Web.BaseDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KN_Web.Models
{
    public class ProductoModel
    {

        public List<tProducto> ConsultarProductos()
        {
            using (var context = new MARTES_BDEntities())
            {
                return context.tProducto.Include("tCategoria").ToList();
                //return context.ConsultarProductos().ToList();
            }
        }

    }
}