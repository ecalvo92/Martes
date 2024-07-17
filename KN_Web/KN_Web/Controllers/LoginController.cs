using KN_Web.Entidades;
using KN_Web.Models;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class LoginController : Controller
    {
        UsuarioModel usuarioM = new UsuarioModel();


        //Iniciar Sesión
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Usuario user)
        {
            var respuesta = usuarioM.IniciarSesion(user);

            if (respuesta != null)
            {
                Session["NombreUsuario"] = respuesta.Nombre;
                Session["ConsecutivoUsuario"] = respuesta.Consecutivo;
                Session["RolUsuario"] = respuesta.IdRol.ToString();
                return RedirectToAction("Home", "Login");
            }
            else
            {
                ViewBag.msj = "Su información no es correcta";
                return View();
            }
        }



        //Cierra la sesión del usuario logueado
        [FiltroSeguridad]
        [HttpGet]
        public ActionResult CerrarSesion()
        {
            Session.Clear();
            return RedirectToAction("Index", "Login");
        }



        //Registro de usuarios desde fuera del sistema
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
                return RedirectToAction("Index", "Login");
            else
            {
                ViewBag.msj = "Su información ya existe en nuestro sistema";
                return View();
            }
        }



        //Muestra la pantalla principal del sistema
        [FiltroSeguridad]
        [HttpGet]
        public ActionResult Home()
        {
            return View();
        }



    }
}