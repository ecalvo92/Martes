using KN_Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    public class CarritoController : Controller
    {
        CarritoModel carritoM = new CarritoModel();

        [HttpGet]
        public ActionResult ConsultarCarrito()
        {
            var datos = carritoM.ConsultarCarrito();
            return View(datos);
        }

        [HttpPost]
        public ActionResult PagarCarrito()
        {
            carritoM.PagarCarrito();
            return RedirectToAction("Home", "Login");
        }
    }
}