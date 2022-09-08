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
    public class NegociosController : Controller
    {
        string cadena = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        IEnumerable<Cliente> clientes(int prmIntIdPais)
        {
            List<Cliente> clientes = new List<Cliente>();
            SqlConnection connection = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand("SELECT * FROM CLIENTE WHERE idPais = @prmIntIdPais or @prmIntIdPais = 0", connection);
            cmd.Parameters.Add("@prmIntIdPais", SqlDbType.Int);
            cmd.Parameters["@prmIntIdPais"].Value = prmIntIdPais;

            connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                clientes.Add(new Cliente()
                {
                    idCliente = dr.GetInt32(0),
                    razonSocial = dr.GetString(1),
                    direccion = dr.GetString(2),
                    telefono = dr.GetString(3),
                    idPais = dr.GetInt32(4),

                });
            }
            dr.Close();
            connection.Close();

            return clientes;
        }
        IEnumerable<Cliente> clientes2(int prmIntIdPais, int prmIntIdCliente)
        {
            List<Cliente> clientes = new List<Cliente>();
            SqlConnection connection = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand("exec sp_getClientesByIdPais @prmIntIdPais, @prmIntIdPais ", connection);
            cmd.Parameters.Add("@prmIntIdPais", SqlDbType.Int);
            cmd.Parameters.Add("@prmIntIdCliente", SqlDbType.Int);
            cmd.Parameters["@prmIntIdPais"].Value = prmIntIdPais;
            cmd.Parameters["@prmIntIdCliente"].Value = prmIntIdCliente;

            connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                clientes.Add(new Cliente()
                {
                    idCliente = dr.GetInt32(0),
                    razonSocial = dr.GetString(1),
                    direccion = dr.GetString(2),
                    telefono = dr.GetString(3),
                    idPais = dr.GetInt32(4),

                });
            }
            dr.Close();
            connection.Close();

            return clientes;
        }
        // GET: Negocios
        public ActionResult Index(int prmIntIdPais = 0, int prmIntIdCliente = 0)
        {
            return View(clientes2(prmIntIdPais, prmIntIdCliente));
        }
    }
}