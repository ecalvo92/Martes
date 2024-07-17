using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace KN_Web.Models
{
    public class FiltroSeguridad : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session["NombreUsuario"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "controller", "Login" },
                    { "action", "Index" }
                });
            }

            base.OnActionExecuting(filterContext);
        }
    }

    public class FiltroAdmin : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session["RolUsuario"].ToString() != "2")
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "controller", "Login" },
                    { "action", "Home" }
                });
            }

            base.OnActionExecuting(filterContext);
        }
    }
}