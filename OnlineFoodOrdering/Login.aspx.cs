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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Response.Cookies["username"] != null && Response.Cookies["password"] != null)
                {
                    inputPassword.Value = Response.Cookies["password"].Value;
                    chkRemember.Checked = true;
                }
            }

            if (Session["role"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_users WHERE email=@u AND password=@p"))
                    {
                        cmd.Parameters.AddWithValue("@u", inputEmail.Value);
                        cmd.Parameters.AddWithValue("@p", inputPassword.Value);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        con.Open();
                        cmd.Connection = con;
                        sda.Fill(dt);
                        con.Close();
                        if (dt.Rows.Count == 1)
                        {
                            if (chkRemember.Checked)
                            {
                                Response.Cookies["username"].Value = inputEmail.Value;
                                Response.Cookies["password"].Value = inputPassword.Value;

                                Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                            }
                            else
                            {
                                Response.Cookies["username"].Expires = DateTime.Now.AddDays(10);
                                Response.Cookies["password"].Expires = DateTime.Now.AddDays(10);
                            }
                            Session["id"] = dt.Rows[0][0];
                            Session["fname"] = dt.Rows[0][1];
                            Session["lname"] = dt.Rows[0][2];
                            Session["email"] = inputEmail.Value;
                            Session["role"] = dt.Rows[0][5];
                            string role = dt.Rows[0][5].ToString();
                            if (role == "admin")
                            {
                                Response.Redirect("admin");
                            }
                            else if (role == "customer")
                            {
                                Response.Redirect("Default.aspx");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid username or password')</script>");
                        }
                    }
                }
            }
        }
    }
}