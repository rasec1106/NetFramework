using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Producto
    {
        [Display(Name = "ID Producto")]
        public int idProducto { get; set; }

        [Display(Name = "Razon Social")]
        [Required]
        public string razonSocial { get; set; }

        [Display(Name = "Precio Unitario")]
        public decimal precioUnitario { get; set; }

        [Display(Name = "Stock")]
        public int stock { get; set; }

        [Display(Name = "ID Categoria")]
        public int idCategoria { get; set; }

        [Display(Name = "Nombre Categoria")]
        public string nombreCategoria { get; set; }
    }
}