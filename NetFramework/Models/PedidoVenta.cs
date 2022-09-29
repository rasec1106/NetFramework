using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class PedidoVenta
    {
        [Display(Name ="ID")]
        public int idPedidoVenta { get; set; }
        [Display(Name = "Codigo")]
        public String codigo { get; set; }
        [Display(Name = "Fecha Emision")]
        public String fechaEmision { get; set; }
        [Display(Name = "ID Cliente")]
        public int idCliente { get; set; }
        [Display(Name = "Razon Social")]
        public String razonSocial { get; set; }
        [Display(Name = "Total")]
        public decimal total { get; set; }
    }
}