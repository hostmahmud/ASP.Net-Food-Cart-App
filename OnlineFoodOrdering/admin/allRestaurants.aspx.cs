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
    public partial class allRestaurants : System.Web.UI.Page
    {
        //Connection con = new Connection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            getAllRestaurant();
        }
        public string getAllRestaurant()
        {
            string htmlStr = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT r_id,r_name,r_category,r_logo FROM tbl_restaurant";
                con.Open();
                cmd.Connection = con;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string cat = reader.GetString(2);
                    string logo = reader.GetString(3);
                    htmlStr += "<tr role='row'><td>"+id+"</td><td><img class='img-profile rounded-circle' src='restaurantImages/" + logo+"'></td><td>" + name + "</td><td>" + cat + "</td><td><a href='allMenus.aspx?restaurant="+id+ "'>View Menus</a></td><td><a class='btn btn-sm btn-info mr-3' href='/restaurant.aspx?id="+id+ "' target='_blank'><i class='fa fa-eye text-white'></i></a><a class='btn btn-sm btn-warning mr-3' href='/admin/EditRestaurant.aspx?id=" + id + "' target='_blank'><i class='fa fa-edit text-white'></i></a></td></tr>";
                }

                con.Close();
                return htmlStr;
            }
                
        }
    }
}