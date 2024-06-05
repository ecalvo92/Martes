using KN_Web.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    public class HomeController : Controller
    {
        //Sirve para abrir las vistas
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        //Sirve para ejecutar las acciones dentro de una vista
        [HttpPost]
        public ActionResult Index(Usuario entidad)
        {
            //Validar los credenciales para determinar si lo dejamos continuar o lo rechazamos
            return View();
        }


        [HttpGet]
        public ActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registro(Usuario entidad)
        {
            return View();
        }


        public ActionResult Home()
        {
            return View();
        }
    }
}