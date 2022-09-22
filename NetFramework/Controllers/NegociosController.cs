using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using NetFramework.Models;

namespace NetFramework.Controllers
{
    public class NegociosController : Controller
    {
        IEnumerable<Pais> paises()
        {
            List<Pais> paises = new List<Pais>();
            using(SqlConnection connection = 
                new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("exec sp_GetPaises", connection);
                connection.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    paises.Add(new Pais()
                    {
                        idPais = dr.GetInt32(0),
                        nombrePais = dr.GetString(1)
                    });
                }
                dr.Close();
                // No es necesario cerrar la conexion ya que estamos usando el 'using'
                // connection.Close();
            }
            return paises;
        }

        IEnumerable<Supervisor> supervisores()
        {
            List<Supervisor> supervisores = new List<Supervisor>();
            using (SqlConnection connection =
                new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("exec sp_GetSupervisores", connection);
                connection.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    supervisores.Add(new Supervisor()
                    {
                        idSupervisor = dr.GetInt32(0),
                        nombre = dr.GetString(1),
                        apellidos = dr.GetString(2),
                        direccion = dr.GetString(3),
                        email = dr.GetString(4),
                        idPais = dr.GetInt32(5)
                    });
                }
                dr.Close();
            }
            return supervisores;
        }

        Supervisor buscar(int id)
        {
            Supervisor supervisor = null;
            supervisor = supervisores().Where(item => item.idSupervisor == id).FirstOrDefault();
            return supervisor;
        }
        // GET: Negocios
        public ActionResult Index()
        {
            return View();
        }
    }
}