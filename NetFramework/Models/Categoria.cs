using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Categoria
    {
        [Display(Name ="ID Categoria")]
        public int idCategoria { get; set; }
        [Display(Name = "Nombre Categoria")]
        public string nombreCategoria { get; set; }
    }
}