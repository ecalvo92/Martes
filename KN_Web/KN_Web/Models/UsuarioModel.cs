using KN_Web.BaseDatos;
using KN_Web.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KN_Web.Models
{
    public class UsuarioModel
    {
        public bool RegistrarUsuario(Usuario user)
        {
            var rowsAffected = 0;

            //var tabla = new tUsuario();
            //tabla.Identificacion = user.Identificacion;
            //tabla.Nombre = user.Nombre;
            //tabla.Correo = user.Correo;
            //tabla.Contrasenna = user.Contrasenna;
            //tabla.Estado = true;
            //tabla.IdRol = 1;

            //using (var context = new MARTES_BDEntities())
            //{
            //    context.tUsuario.Add(tabla);
            //    rowsAffected = context.SaveChanges();
            //}

            using (var context = new MARTES_BDEntities())
            {
                rowsAffected = context.RegistrarUsuario(user.Identificacion, user.Nombre, user.Correo, user.Contrasenna);
            } 

            return (rowsAffected > 0 ? true : false);
        }

        public IniciarSesion_Result IniciarSesion(Usuario user)
        {
            //using (var context = new MARTES_BDEntities())
            //{
            //    rowsCount = (from x in context.tUsuario
            //                     where x.Correo == user.Correo
            //                     && x.Contrasenna == user.Contrasenna
            //                     && x.Estado == true
            //                     select x).ToList().Count();
            //}

            using (var context = new MARTES_BDEntities())
            {
                return context.IniciarSesion(user.Correo, user.Contrasenna).FirstOrDefault();
            }
        }

        public List<tUsuario> ConsultarUsuarios()
        {
            using (var context = new MARTES_BDEntities())
            {
                return (from x in context.tUsuario
                             select x).ToList();
            }
        }

    }
}