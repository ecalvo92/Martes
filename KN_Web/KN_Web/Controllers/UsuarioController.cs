using KN_Web.Entidades;
using KN_Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    public class UsuarioController : Controller
    {
        UsuarioModel usuarioM = new UsuarioModel();

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Usuario user)
        {
            var respuesta = usuarioM.IniciarSesion(user);

            if (respuesta)
                return RedirectToAction("Home", "Usuario");
            else
            {
                ViewBag.msj = "Su información no es correcta";
                return View();
            }
        }


        [HttpGet]
        public ActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registro(Usuario user)
        {
            var respuesta = usuarioM.RegistrarUsuario(user);

            if (respuesta)
                return RedirectToAction("Index", "Usuario");
            else
            {
                ViewBag.msj = "Su información no se ha registrado";
                return View();
            }
        }


        [HttpGet]
        public ActionResult Home()
        {
            return View();
        } 

    }
}