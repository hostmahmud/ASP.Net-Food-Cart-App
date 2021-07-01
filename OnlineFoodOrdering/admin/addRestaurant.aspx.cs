using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineFoodOrdering.admin.Classes;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace OnlineFoodOrdering.admin
{
    public partial class addRestaurant : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        public string Name { get; set; }
        public string Cat { get; set; }
        public string Desc { get; set; }
        public string BannerImg { get; set; }
        public string Logo { get; set; }

        //location
        public string Rid { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showMsg.Visible = false;
                GetRestaurantId();
                Array cities = Enum.GetValues(typeof(ECity));
                foreach (ECity city in cities)
                {
                    ddlCity.Items.Add(new ListItem(city.ToString()));
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Name = txtName.Text;
            Cat = ddlCategory.Text;
            Desc = txtDesc.Text;
            Rid = txtRestaurantId.Text;
            State = txtState.Text;
            City = ddlCity.Text;
            Address = txtAddress.Text;
            Zip = txtZip.Text;

            BannerImg = "restaurant-banner-" + Rid + Path.GetExtension(fileBanner.FileName);
            Logo = "restaurant-logo-" + Rid + Path.GetExtension(ImgLogo.FileName);

            if (Page.IsValid)
            {
                if (fileBanner.HasFile)
                {
                    fileBanner.SaveAs(Server.MapPath("restaurantImages//" + BannerImg));
                }
                if (ImgLogo.HasFile)
                {
                    ImgLogo.SaveAs(Server.MapPath("restaurantImages//" + Logo));
                }

                SqlTransaction transaction;
                con.Open();
                transaction = con.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Transaction = transaction;
                    cmd.Connection = con;
                    try
                    {
                        cmd.CommandText = "sp_insertRestaurantAndLocation";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Clear();
                        //restaurant
                        cmd.Parameters.Add(new SqlParameter("r_name", Name));
                        cmd.Parameters.Add(new SqlParameter("r_cat", Cat));
                        cmd.Parameters.Add(new SqlParameter("r_desc", Desc));
                        cmd.Parameters.Add(new SqlParameter("r_banner", BannerImg));
                        cmd.Parameters.Add(new SqlParameter("r_logo", Logo));

                        cmd.Parameters.Add(new SqlParameter("rid", Rid));
                        cmd.Parameters.Add(new SqlParameter("state", State));
                        cmd.Parameters.Add(new SqlParameter("city", City));
                        cmd.Parameters.Add(new SqlParameter("address", Address));
                        cmd.Parameters.Add(new SqlParameter("zip", Zip));

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            aspMsg.Text = "<i class='fas fa-check-circle fa-2x'></i> <span class='pt-1 pb-1 pl-1'><strong>Success!</strong> Data has been saved.</span";
                            showMsg.CssClass = "alert alert-dismissible fade show alert-success";
                            showMsg.Visible = true;
                            Clear();
                        }
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        aspMsg.Text = "<i class='fas fa-times-circle fa-2x'></i> <span class='pt-1 pb-1 pl-1'><strong>Oops!</strong> Something went wrong.</span>";
                        aspMsg.Text += ex.Message;
                        showMsg.Attributes.Add("class", "alert alert-dismissible fade show alert-danger");
                        showMsg.Visible = true;
                        Page.SetFocus(main.ClientID);
                        transaction.Rollback();
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            else
            {
                aspMsg.Text = "<i class='fas fa-times-circle fa-2x'></i> <span class='pt-1 pb-1 pl-1'><strong>Oops!</strong> Something went wrong.</span>";
                showMsg.Attributes.Add("class", "alert alert-dismissible fade show alert-danger");
                showMsg.Visible = true;
                Page.SetFocus(main.ClientID);
            }
        }
        private void GetRestaurantId()
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 r_id FROM tbl_restaurant ORDER BY r_id DESC", con))
            {
                using (SqlDataAdapter adpt = new SqlDataAdapter(cmd))
                {
                    using (DataTable dt = new DataTable())
                    {
                        adpt.Fill(dt);

                        if (dt.Rows.Count == 1)
                        {
                            int id = Convert.ToInt32(dt.Rows[0]["r_id"]);
                            txtRestaurantId.Text = (id + 1).ToString();
                        }
                        else
                        {
                            txtRestaurantId.Text = "1";
                        }
                    }
                }
            }
            con.Close();
        }

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (txtName.Text == string.Empty)
            {
                e.IsValid = false;
                txtNameErr.InnerText = "Name is required.";
            }
            else
            {
                txtNameErr.InnerText = "";
            }
            if (ddlCategory.Text == "--Select Category--")
            {
                e.IsValid = false;
                ddlCategoryErr.InnerText = "Category is required";
            }
            else
            {
                ddlCategoryErr.InnerText = "";
            }
            if (txtDesc.Text == string.Empty)
            {
                e.IsValid = false;
                txtDescErr.InnerText = "Description is required";
            }
            else
            {
                txtDescErr.InnerText = "";
            }
            if (!fileBanner.HasFile)
            {
                e.IsValid = false;
                bannerErr.InnerText = "Please choose banner image.";
            }
            else
            {
                e.IsValid = true;
                bannerErr.InnerText = "";
            }
            if (!ImgLogo.HasFile)
            {
                e.IsValid = false;
                logoErr.InnerText = "Please choose logo.";
            }
            else
            {
                e.IsValid = true;
                logoErr.InnerText = "";
            }
            if (ddlCity.Text == "--Select City--")
            {
                e.IsValid = false;
                ddlCityErr.InnerText = "City is required";
            }
            else
            {
                ddlCityErr.InnerText = "";
            }
            if (txtAddress.Text==string.Empty)
            {
                e.IsValid = false;
                txtAddressErr.InnerText = "Address is required";
            }
            else
            {
                txtAddressErr.InnerText = "";
            }
            if (txtZip.Text == string.Empty)
            {
                e.IsValid = false;
                txtZipErr.InnerText = "Zip code is required";
            }
            else
            {
                txtZipErr.InnerText = "";
            }
        }
        public void Clear()
        {
            txtName.Text = string.Empty;
            ddlCategory.Text = "--Select Category--";
            txtDesc.Text = string.Empty;
            ddlCity.Text = "--Select City--";
            txtAddress.Text = string.Empty;
            txtState.Text = string.Empty;
            txtZip.Text = string.Empty;
        }
    }
    enum ECity
    {
        Dhaka = 1,
        Chittagong,
        Comilla
    }
}