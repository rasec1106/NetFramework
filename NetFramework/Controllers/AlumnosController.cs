using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using NetFramework.Models;
using System.Configuration;

namespace NetFramework.Controllers
{
    public class AlumnosController : Controller
    {
        string cadena = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        IEnumerable<Alumno> alumnos()
        {
            List<Alumno> alumnos = new List<Alumno>();
            SqlConnection connection = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand("SELECT * FROM ALUMNO", connection);
            // cmd.Parameters.Add("@prmIntIdPais", SqlDbType.Int);
            // cmd.Parameters["@prmIntIdPais"].Value = prmIntIdPais;

            connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                alumnos.Add(new Alumno()
                {
                    IdAlumno = dr.GetString(0),
                    Apellidos = dr.GetString(1),
                    Nombres = dr.GetString(2),
                    Edad = dr.GetInt16(3),
                    Sexo = dr.GetString(4),

                });
            }
            dr.Close();
            connection.Close();

            return alumnos;
        }

        // GET: Alumnos
        public ActionResult Index()
        {
            return View(alumnos());
        }
    }
}