using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFoodOrdering
{
    public partial class MyOrders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                id = Session["id"].ToString();
            }
            SqlDataAdapter sda = new SqlDataAdapter("select * from tbl_orders where CustomerId="+id+"", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptrOrder.DataSource = dt;
            rptrOrder.DataBind();
        }
    }
}