﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace KN_Web.Models
{
    public class GeneralModel
    {

        public string CreatePassword()
        {
            int length = 6;
            const string valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public void EnviarCorreo(string destino, string asunto, string contenido)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("clasesphp@outlook.com");
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential("clasesphp@outlook.com","phpclases2024*");
            client.EnableSsl = true;
            client.Send(message);
        }

    }
}