using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Producto
    {
        [Display(Name = "Código")]
        public int idProducto { get; set; }

        [Display(Name = "Producto")]
        public string nombreProducto { get; set; }

        [Display(Name = "Categoría")]
        public string nombreCategoria { get; set; }

        [Display(Name = "Precio Unitario")]
        public decimal precioUnitario { get; set; }

        [Display(Name = "Stock")]
        public int stock { get; set; }

        [Display(Name = "Monto")]
        public decimal monto { get { return precioUnitario * stock; } }
    }
}