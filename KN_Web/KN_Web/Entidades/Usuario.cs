namespace KN_Web.Entidades
{
    // Entidad - Objeto
    public class Usuario
    {
        //Atributos - Propiedades
        public int Consecutivo { get; set; }
        public string Correo { get; set; }
        public string Contrasenna { get; set; }
        public string ConfirmarContrasenna { get; set; }
        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public bool Estado { get; set; }
        public byte IdRol { get; set; }
    }
}