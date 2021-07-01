using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace OnlineFoodOrdering
{
    public partial class Forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_users WHERE email=@u"))
                {
                    cmd.Parameters.AddWithValue("@u", inputEmail.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    con.Open();
                    cmd.Connection = con;
                    sda.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count == 1)
                    {
                        string guid = Guid.NewGuid().ToString();
                        int Uid = Convert.ToInt32(dt.Rows[0][0]);
                        using (SqlCommand cmd1 = new SqlCommand("insert into tbl_forgetPassword values('" + guid + "','" + Uid+"',GETDATE())"))
                        {
                            con.Open();
                            cmd1.Connection = con;
                            if (cmd1.ExecuteNonQuery() > 0)
                            {
                                string to = inputEmail.Value;
                                string fName = dt.Rows[0][1].ToString();
                                string body = "Hi "+fName+ ", <br/><br/>Click the link bellow to reset your account password.<br/><br/> http://localhost:49265/RecoverPassword?id="+ guid+"<br/><br/><br/><br/>Thanks,<br/>Mahmud Sabuj<br/>IsDB BISEW<br/>Round: 45";
                                MailMessage message = new MailMessage("sabujsmtp@gmail.com", to);
                                message.Body = body;
                                message.IsBodyHtml = true;
                                message.Subject = "Reset Password";
                                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com",587);
                                smtpClient.Credentials = new NetworkCredential()
                                {
                                    UserName = "smtp@gmail.com",
                                    Password= "IDB1234"
                                };
                                smtpClient.EnableSsl = true;
                                smtpClient.Send(message);

                                //Response.Write("<script>alert('Reset linkk sent')</script>");
                                showMsg.InnerHtml = "<i class='fa fa-check-circle'></i> We sent an email to <strong>" + inputEmail.Value + "</strong> with a link to get back into your account.";
                                showMsg.Attributes.Add("class", "d-block alert alert-success text-center");

                            }
                        }
                    }
                    else
                    {
                        showMsg.InnerHtml = "<i class='fa fa-info-circle'></i> The email address you entered <strong>" + inputEmail.Value + "</strong> is not found in our database.";
                        showMsg.Attributes.Add("class", "d-block alert alert-danger text-center");
                    }
                }
            }
        }
    }
}