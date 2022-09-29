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
        IEnumerable<PedidoVenta> getPedidosVentaPorFechas(DateTime? fechaInicio, DateTime? fechaFin)
        {
            List<PedidoVenta> pedidoVentas = new List<PedidoVenta>();
            using (
                SqlConnection connection = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["connection"].ConnectionString
                )
            )
            {
                SqlCommand sqlCommand = new SqlCommand("exec sp_GetPedidosPorFecha @prmdatFechaInicio, @prmdatFechaFin", connection);
                sqlCommand.Parameters.AddWithValue("@prmdatFechaInicio", fechaInicio);
                sqlCommand.Parameters.AddWithValue("@prmdatFechaFin", fechaFin);

                connection.Open();

                SqlDataReader dr = sqlCommand.ExecuteReader();
                while (dr.Read())
                {
                    pedidoVentas.Add(new PedidoVenta()
                    {
                        idPedidoVenta = dr.GetInt32(0),
                        codigo = dr.GetString(1),
                        fechaEmision = dr.GetDateTime(2).ToString("dd/MM/yyyy"),
                        idCliente = dr.GetInt32(3),
                        razonSocial = dr.GetString(4),
                        total = dr.GetDecimal(5)
                    });
                }
            }
                return pedidoVentas;
        }
        // GET: Negocios
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetPedidosVentaPorFechas(DateTime? fechaInicio, DateTime? fechaFin, int pagina = 0)
        {
            if (fechaInicio == null)
            {
                fechaInicio = DateTime.Today;
            }
            if (fechaFin == null)
            {
                fechaFin = DateTime.Today;
            }
            IEnumerable<PedidoVenta> temporalPedidos = getPedidosVentaPorFechas(fechaInicio, fechaFin);
            int filasTotales = temporalPedidos.Count();
            int filasPorPagina = 2;
            int numPaginas = 0;

            /*if( filasTotales % filasPorPagina == 0)
            {
                numPaginas = filasTotales / filasPorPagina;
            }
            else
            {
                numPaginas = filasTotales / filasPorPagina + 1;
            }*/

            numPaginas = filasTotales%filasPorPagina==0 ? filasTotales / filasPorPagina : (filasTotales / filasPorPagina)+1;

            ViewBag.numPaginas = numPaginas;
            ViewBag.pagina = pagina;
            ViewBag.fechaInicio = fechaInicio;
            ViewBag.fechaFin = fechaFin;

            return View(temporalPedidos.Skip(pagina*filasPorPagina).Take(filasPorPagina));
        }
    }
}