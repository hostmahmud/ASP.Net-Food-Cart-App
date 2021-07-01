using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

namespace OnlineFoodOrdering
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (isFormValid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO tbl_users VALUES('" + inputfName.Text + "','" + inputlName.Text + "', '" + inputEmail.Text + "','" + inputPassword.Text + "','customer','10/10/2010')"))
                    {
                        con.Open();
                        cmd.Connection = con;
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Redirect("Login.aspx");
                        }
                        con.Close();
                    }
                }
            }
        }
        public bool isFormValid()
        {
            if (inputfName.Text == "")
            {
                Response.Write("<script>alert('First name is required!')</script>");
                return false;
            }
            if (inputlName.Text == "")
            {
                Response.Write("<script>alert('Last name is required!')</script>");
                return false;
            }
            else if (inputEmail.Text == "")
            {
                Response.Write("<script>alert('Email is required!')</script>");
                return false;
            }
            else if (inputPassword.Text == "")
            {
                Response.Write("<script>alert('Password is required!')</script>");
                return false;
            }
            else if (inputPassword2.Text != "" && inputPassword2.Text != inputPassword.Text)
            {
                Response.Write("<script>alert('Password does not match!')</script>");
                return false;
            }
            else
            return true;
        }
    }
}