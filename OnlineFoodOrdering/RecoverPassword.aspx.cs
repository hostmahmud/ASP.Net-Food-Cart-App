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
    public partial class RecoverPassword : Page
    {
        string guidValue;
        int uId;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            guidValue = Request.QueryString["id"];
            if (guidValue != null)
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_forgetPassword WHERE Id=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", guidValue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    uId = Convert.ToInt32(dt.Rows[0][1]);
                }
            }
            else Response.Redirect("Login.aspx");
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE tbl_users SET password=@p where uId=@u", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@p", inputPassword.Value);
                cmd.Parameters.AddWithValue("@u", uId);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    showMsg.InnerHtml = "<i class='fa fa-check-circle'></i> Password reset successful. Please go to <a href='Login.aspx'>Login</a> page to login to your account";
                    showMsg.Attributes.Add("class", "d-block alert alert-success text-center");
                }
                else
                {
                    showMsg.InnerHtml = "<i class='fa fa-info-circle'></i> Oops! Something went wrong...";
                    showMsg.Attributes.Add("class", "d-block alert alert-danger text-center");
                }
                con.Close();
                GC.Collect();
            }
        }
    }
}