using KN_Web.Entidades;
using KN_Web.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class PerfilController : Controller
    {
        UsuarioModel usuarioM = new UsuarioModel();

        [HttpGet]
        public ActionResult PerfilUsuario()
        {
            var respuesta = usuarioM.ConsultarUsuarioConsecutivo(int.Parse(Session["ConsecutivoUsuario"].ToString()));
            return View(respuesta);
        }

        [HttpPost]
        public ActionResult ActualizarPerfil(Usuario user)
        {
            var respuesta = usuarioM.ActualizarUsuario(user);

            if (respuesta)
                return RedirectToAction("PerfilUsuario", "Perfil");
            else
            {
                ViewBag.msj = "No se ha podido actualizar su información de perfil";
                return View();
            }
        }



        [HttpGet]
        public ActionResult ActualizarContrasenna()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ActualizarContrasenna(Usuario user)
        {
            if (user.Contrasenna != user.ConfirmarContrasenna)
            {
                ViewBag.msj = "Las contraseñas ingresadas no coinciden";
                return View();
            }

            int Consecutivo = int.Parse(Session["ConsecutivoUsuario"].ToString());
            var respuesta = usuarioM.CambiarContrasennaUsuario(Consecutivo,user.Contrasenna, false, DateTime.Now);

            if (respuesta)
                return RedirectToAction("CerrarSesion", "Login");
            else
            {
                ViewBag.msj = "No se ha podido actualizar su contraseña";
                return View();
            }
        }


    }
}