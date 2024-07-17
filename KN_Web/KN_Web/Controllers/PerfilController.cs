﻿using KN_Web.Entidades;
using KN_Web.Models;
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
            var respuesta = usuarioM.ConsultarUsuario(int.Parse(Session["ConsecutivoUsuario"].ToString()));
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

        

    }
}