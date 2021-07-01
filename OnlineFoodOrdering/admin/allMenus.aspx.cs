using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineFoodOrdering.admin.Classes;

namespace OnlineFoodOrdering.admin
{
    public partial class allMenus : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            getAllRestaurantMenus();
        }
        public string getAllRestaurantMenus()
        {
            string restaurantId = Request.QueryString["restaurant"];
            if (restaurantId == null)
            {
                string htmlStr = "";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Id,Title,Price,Image FROM tbl_RestaurantMenu";
                    con.Open();
                    cmd.Connection = con;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string name = reader.GetString(1);
                        string price = reader.GetDecimal(2).ToString();
                        string logo = reader.GetString(3);
                        htmlStr += "<tr role='row'><td>" + id + "</td><td><img class='img-profile rounded-circle' src='restaurantImages/menuImg/" + logo + "'></td><td>" + name + "</td><td>" + price + "</td><td><a class='btn btn-sm btn-warning mr-3'><i class='fa fa-edit text-white'></i></a><a class='btn btn-sm btn-danger'><i class='fa fa-trash text-white'></i></a></td></tr>";
                    }

                    con.Close();
                    return htmlStr;
                }
            }
            else
            {
                string htmlStr = "";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Id,Title,Price,Image FROM tbl_RestaurantMenu WHERE RestaurantId=" + restaurantId + "";
                    con.Open();
                    cmd.Connection = con;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string name = reader.GetString(1);
                        string price = reader.GetDecimal(2).ToString();
                        string logo = reader.GetString(3);
                        htmlStr += "<tr role='row'><td>" + id + "</td><td><img class='img-profile rounded-circle' src='restaurantImages/menuImg/" + logo + "'></td><td>" + name + "</td><td>" + price + "</td><td><a class='btn btn-sm btn-warning mr-3'><i class='fa fa-edit text-white'></i></a><a class='btn btn-sm btn-danger'><i class='fa fa-trash text-white'></i></a></td></tr>";
                    }

                    con.Close();
                    return htmlStr;
                }
            }

        }
    }
}