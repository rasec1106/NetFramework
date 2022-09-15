using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NetFramework.Models;


namespace NetFramework.Controllers
{
    public class ProductoController : Controller
    {
        IEnumerable<Producto> productos()
        {
            List<Producto> productos = new List<Producto>();

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("exec sp_GetProductos", connection);
                connection.Open();
                
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    productos.Add(new Producto()
                    {
                        idProducto = reader.GetInt32(0),
                        nombreProducto = reader.GetString(1),
                        nombreCategoria = reader.GetString(2),
                        precioUnitario = reader.GetDecimal(3),
                        stock = reader.GetInt32(4)
                    });
                }
                reader.Close();
                connection.Close();
            }
            return productos;
        }
        // GET: Producto
        public ActionResult Listado()
        {
            return View(productos());
        }

        public ActionResult Paginacion(int pagina = 0)
        {
            int numProductos = productos().Count();
            int filas = 3;
            
            int numPaginas = numProductos % filas == 0 ? numProductos/filas : (numProductos/filas + 1);

            ViewBag.pagina = pagina;
            ViewBag.numPaginas = numPaginas;
            return View(productos().Skip(pagina*filas).Take(filas));
        }
    }
}