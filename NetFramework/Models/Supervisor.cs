using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Supervisor
    {
        public int idSupervisor { get; set; }

        [Required]
        [Display(Name = "Nombre")]
        public string nombre { get; set; }

        [Required] 
        [Display(Name = "Apellidos")]
        public string apellidos { get; set; }

        [Display(Name = "Dirección")]
        public string direccion { get; set; }

        [Required]
        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress)]
        public string email { get; set; }

        [Required]
        [Display(Name = "Id País")]
        public int idPais { get; set; }
    }
}