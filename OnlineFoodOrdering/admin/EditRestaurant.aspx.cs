using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFoodOrdering.admin
{
    public partial class EditRestaurant : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Array cities = Enum.GetValues(typeof(ECity));
                foreach (ECity city in cities)
                {
                    ddlCity1.Items.Add(new ListItem(city.ToString()));
                }

                if (Request.QueryString["id"] != null)
                {
                    string id = Request.QueryString["id"];

                    conn.Open();
                    SqlDataReader sdr;
                    using (SqlCommand cmd = new SqlCommand("SELECT r.r_id,r.r_name,r.r_category,r.r_desc,r.r_banner_img,r.r_logo,l.l_id,l.l_address,l.l_city,l.l_state,l.l_zip FROM tbl_restaurant r JOIN tbl_location AS l on l.r_id = r.r_id WHERE r.r_id = " + id + "", conn))
                    {
                        sdr = cmd.ExecuteReader();
                        if (sdr.Read())
                        {
                            txtRestaurantId.Text = sdr["r_id"].ToString();
                            txtName1.Text = sdr["r_name"].ToString();
                            ddlCategory1.Text = sdr["r_category"].ToString();
                            txtDesc1.Text = sdr["r_desc"].ToString();
                            bannerPreview.Src = "/admin/restaurantImages/" + sdr["r_banner_img"].ToString();
                            oldBannerImageName.InnerText = sdr["r_banner_img"].ToString();
                            logoPreview.Src = "/admin/restaurantImages/" + sdr["r_logo"].ToString();
                            oldLogoImageName.InnerText = sdr["r_logo"].ToString();

                            ddlCity1.Text = sdr["l_city"].ToString();
                            txtAddress1.Text = sdr["l_address"].ToString();
                            txtState1.Text = sdr["l_state"].ToString();
                            txtZip1.Text = sdr["l_zip"].ToString();
                            lid.InnerText = sdr["l_id"].ToString();
                        }
                        conn.Close();
                    }
                }
                else
                {
                    Response.Redirect("/admin/allRestaurants.aspx");
                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string BannerImg = oldBannerImageName.InnerText;
            string Logo = oldLogoImageName.InnerText;

            if (fileBanner.HasFile)
            {
                BannerImg = "restaurant-banner-" + txtRestaurantId.Text + Path.GetExtension(fileBanner.FileName);
                fileBanner.SaveAs(Server.MapPath("restaurantImages//" + BannerImg));
            }
            if (ImgLogo.HasFile)
            {
                Logo = "restaurant-logo-" + txtRestaurantId.Text + Path.GetExtension(ImgLogo.FileName);
                ImgLogo.SaveAs(Server.MapPath("restaurantImages//" + Logo));
            }
            conn.Open();
            string updateRestaurant = "update tbl_restaurant set r_name='"+txtName1.Text+"',r_category='"+ddlCategory1.Text+"',r_desc='"+txtDesc1.Text+"',r_banner_img='"+BannerImg+"',r_logo='"+Logo+"' where r_id = "+txtRestaurantId.Text+"";
            using (var cmd = new SqlCommand(updateRestaurant, conn))
            {
                cmd.ExecuteNonQuery();
            }

            string updateLocation = @"update tbl_location set l_address='"+txtAddress1.Text+"',l_city='"+ddlCity1.Text+"',l_state='"+txtState1.Text+"',l_zip='"+txtZip1.Text+"' where l_id="+lid.InnerText+"";
            using (var cmd = new SqlCommand(updateLocation, conn))
            {
                cmd.ExecuteNonQuery();
            }
            conn.Close();

        }
    }
}