using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practica_examen_II
{
    public partial class Suministros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fillGrid();
            fillPiezas();
            fillProveedores();
        }

        protected void fillGrid()
        {
            string cnxStr = ConfigurationManager.ConnectionStrings["cnxSuministros"].ConnectionString;
            using (SqlConnection cnx = new SqlConnection(cnxStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT piezas.Nombre as NombreDePieza, proveedores.Nombre as NomreDeProveedor, suministros.Precio FROM suministros JOIN piezas ON piezas.Codigo = suministros.CodigoPieza\r\nJOIN proveedores ON proveedores.Id = suministros.IdProveedor"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = cnx;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            dgSuministros.DataSource = dt;
                            dgSuministros.DataBind();
                        }
                    }
                }
            }
        }

        protected void fillPiezas()
        {
            string cnxStr = ConfigurationManager.ConnectionStrings["cnxSuministros"].ConnectionString;
            using(SqlConnection cnx = new SqlConnection(cnxStr))
            {
                using(SqlCommand cmd = new SqlCommand("SELECT * FROM piezas"))
                {
                    using(SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = cnx;
                        sda.SelectCommand = cmd;
                        using(DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            piezas.DataSource = dt;

                            piezas.DataTextField = dt.Columns["Nombre"].ToString();
                            piezas.DataValueField = dt.Columns["Codigo"].ToString();
                            piezas.DataBind();
                        }
                    }
                }
            }
        }

        protected void fillProveedores()
        {
            string cnxStr = ConfigurationManager.ConnectionStrings["cnxSuministros"].ConnectionString;
            using (SqlConnection cnx = new SqlConnection(cnxStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM proveedores"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = cnx;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            proveedores.DataSource = dt;

                            proveedores.DataTextField = dt.Columns["Nombre"].ToString();
                            proveedores.DataValueField = dt.Columns["Id"].ToString();
                            proveedores.DataBind();
                        }
                    }
                }
            }
        }

        protected void add()
        {
            try
            {
                string cnxStr = ConfigurationManager.ConnectionStrings["cnxSuministros"].ConnectionString;
                SqlConnection cnx = new SqlConnection(cnxStr);
                if(!precio.Text.Trim().Equals(""))
                {
                    float precioValue = float.Parse(precio.Text);
                    int piezaValue = int.Parse(piezas.SelectedValue.ToString().Trim());
                    string proveedoresValue = proveedores.SelectedValue.ToString().Trim();

                    string queryString = "INSERT INTO suministros(CodigoPieza, IdProveedor, Precio) VALUES (" + piezaValue + ",'" + proveedoresValue + "'," + precioValue + ")";

                    SqlCommand cmd = new SqlCommand(queryString, cnx);

                    cnx.Open();
                    cmd.ExecuteNonQuery();
                    cnx.Close();
                    Response.Redirect(Request.RawUrl);

                }
            }catch (Exception)
            {
                throw;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            add();
        }
    }
}