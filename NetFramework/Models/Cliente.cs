using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Cliente
    {
        [Display(Name = "Codigo")]
        public int idCliente { get; set; }
        [Display(Name = "Razon Social")]
        public string razonSocial { get; set; }
        [Display(Name = "Direccion")]
        public string direccion { get; set; }
        [Display(Name = "Telefono")]
        public string telefono { get; set; }
        [Display(Name = "Codigo Pais")]
        public int idPais { get; set; }
    }
}