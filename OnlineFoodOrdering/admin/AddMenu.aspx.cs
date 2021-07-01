using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineFoodOrdering.admin.Classes;
using System.IO;
using System.Configuration;

namespace OnlineFoodOrdering.admin
{
    public partial class AddMenu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showMsg.Visible = false;

                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT r_id,r_name FROM tbl_restaurant";
                    con.Open();
                    cmd.Connection = con;
                    ddlRestaurantList.DataSource = cmd.ExecuteReader();
                    ddlRestaurantList.DataTextField = "r_name";
                    ddlRestaurantList.DataValueField = "r_id";
                    ddlRestaurantList.DataBind();
                    con.Close();
                }
                ddlRestaurantList.Items.Insert(0, new ListItem("--Select Restaurant--", "0"));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                RestaurantMenu rm = new RestaurantMenu();
                rm.RestaurantId = Convert.ToInt32(ddlRestaurantList.SelectedValue);
                rm.Title = txtTitle.Text;
                rm.Price = Convert.ToDecimal(txtPrice.Text);
                rm.ShortDesc = txtDesc.Text;
                rm.Image = "rest-menu-" + rm.RestaurantId + "-" + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + Path.GetExtension(foodItemImage.FileName);

                SqlTransaction transaction;
                con.Open();
                transaction = con.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Transaction = transaction;
                    cmd.Connection = con;
                    try
                    {
                        cmd.CommandText = "sp_insert_tbl_RestaurantMenu";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add(new SqlParameter("RestaurantId", rm.RestaurantId));
                        cmd.Parameters.Add(new SqlParameter("Title", rm.Title));
                        cmd.Parameters.Add(new SqlParameter("Price", rm.Price));
                        cmd.Parameters.Add(new SqlParameter("Desc", rm.ShortDesc));
                        cmd.Parameters.Add(new SqlParameter("Img", rm.Image));

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (foodItemImage.HasFile)
                            {
                                foodItemImage.SaveAs(Server.MapPath("restaurantImages//menuImg//" + rm.Image));
                            }
                            aspMsg.Text = "<i class='fas fa-check-circle fa-2x'></i> <span class='pt-1 pb-1 pl-1'><strong>Success!</strong> Data has been saved.</span";
                            showMsg.CssClass = "alert alert-dismissible fade show alert-success";
                            showMsg.Visible = true;
                            Page.SetFocus(main.ClientID);
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

        protected void resError_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (ddlRestaurantList.SelectedItem.Value == "0")
            {
                e.IsValid = false;
                resError.ErrorMessage = "Please select restaurant";
            }
        }

        protected void titleError_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (txtTitle.Text=="")
            {
                e.IsValid = false;
                titleError.ErrorMessage = "Please enter menu name.";
            }
        }

        protected void priceError_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (txtPrice.Text=="")
            {
                e.IsValid = false;
                priceError.ErrorMessage = "Enter menu price in BDT.";
            }
        }

        protected void descError_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (txtDesc.Text == "")
            {
                e.IsValid = false;
                descError.ErrorMessage = "Please enter item description.";
            }
        }
    }
}