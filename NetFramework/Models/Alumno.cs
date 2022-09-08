using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NetFramework.Models
{
    public class Alumno
    {
        [Display(Name = "Codigo")]
        public string IdAlumno { get; set; }
        [Display(Name = "Apellidos")]
        public string Apellidos { get; set; }
        [Display(Name = "Nombres")]
        public string Nombres { get; set; }
        [Display(Name = "Edad")]
        public Int16 Edad { get; set; }
        [Display(Name = "Sexo")]
        public string Sexo { get; set; }
    }
}