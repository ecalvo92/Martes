using KN_Web.Entidades;
using KN_Web.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace KN_Web.Controllers
{
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class LoginController : Controller
    {
        UsuarioModel usuarioM = new UsuarioModel();
        GeneralModel generalM = new GeneralModel();
        ProductoModel productoM = new ProductoModel();
        CarritoModel carritoM = new CarritoModel();

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
                if (respuesta.EsClaveTemporal == true && respuesta.ClaveVencimiento <= DateTime.Now)
                {
                    ViewBag.msj = "Su contraseña temporal ha caducado";
                    return View();
                }

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



        //Recupera la contraseña del usuario
        [HttpGet]
        public ActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarAcceso(Usuario user)
        {
            var respuesta = usuarioM.ConsultarUsuarioIdentificacion(user.Identificacion);

            if (respuesta != null)
            {
                var contrasennaTemporal = generalM.CreatePassword();
                var fechaVencimientoTemporal = DateTime.Now.AddMinutes(30);
                var actualizacion = usuarioM.CambiarContrasennaUsuario(respuesta.Consecutivo, contrasennaTemporal, true, fechaVencimientoTemporal);

                if (actualizacion)
                {
                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "Password.html";
                    string contenido = System.IO.File.ReadAllText(ruta);
                    contenido = contenido.Replace("@@Nombre", respuesta.Nombre);
                    contenido = contenido.Replace("@@Contrasenna", contrasennaTemporal);
                    contenido = contenido.Replace("@@Vencimiento", fechaVencimientoTemporal.ToString("dd/MM/yyyy hh:mm:ss tt"));
                    generalM.EnviarCorreo(respuesta.Correo, "Recuperar Acceso SistemaWEB KN", contenido);
                }
                
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.msj = "No fue posible obtener su información";
                return View();
            }
        }



        //Muestra la pantalla principal del sistema
        [FiltroSeguridad]
        [HttpGet]
        public ActionResult Home()
        {
            CargarVariablesCarrito();
            var respuesta = productoM.ConsultarProductos();
            return View(respuesta);
        }

        [FiltroSeguridad]
        [HttpPost]
        public ActionResult RegistrarCarrito(int IdProducto, int Cantidad)
        {
            carritoM.RegistrarCarrito(IdProducto, Cantidad);
            CargarVariablesCarrito();
            return Json("",JsonRequestBehavior.AllowGet);
        }

        private void CargarVariablesCarrito()
        {
            var carritoActual = carritoM.ConsultarCarrito();
            Session["Cantidad"] = carritoActual.Sum(c => c.Cantidad);
            Session["SubTotal"] = carritoActual.Sum(c => c.SubTotal);
            Session["Total"] = carritoActual.Sum(c => c.Total);
        }

    }
}