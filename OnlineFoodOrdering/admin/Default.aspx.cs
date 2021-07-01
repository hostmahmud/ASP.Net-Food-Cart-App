using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFoodOrdering.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //total restaurant
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from tbl_restaurant";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    totalRestaurant.InnerText = dt.Rows.Count.ToString()+" Total Restaurants";
                }
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from tbl_RestaurantMenu";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    totalMenu.InnerText = dt.Rows.Count.ToString() + " Total Menus";
                }
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from tbl_orders";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    totalOrders.InnerText = dt.Rows.Count.ToString() + " Total Orders";
                }
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from tbl_users";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    totalUsers.InnerText = dt.Rows.Count.ToString() + " Total Users";
                }
                con.Close();
            }
        }
    }
}