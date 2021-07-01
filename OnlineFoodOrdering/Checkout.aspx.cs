using OnlineFoodOrdering.admin.Classes;
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
    public partial class Checkout : Page
    {
        //Connection con = new Connection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);

        string cartItems = string.Empty;
        string custId;

        //cart
        CookieCartParser cookieCartParser;
        Dictionary<string, string> dictionaryCart;
        DataTable dtMenus;
        DataTable dtCart;

        string itemQuantityPrice = string.Empty;
        double subtotal = 0;
        string orderid = DateTime.Now.ToString("ttMddyyyyhhmmss");
        protected void Page_Load(object sender, EventArgs e)
        {
            //user restriction
            if (Session["role"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            custId = Session["id"].ToString();

            //populate cart items
            cookieCartParser = new CookieCartParser();
            var cookieCart = Request.Cookies["MahmudCookieCart"];
            if (cookieCart != null)
            {
                dictionaryCart = cookieCartParser.ToDictionary(cookieCart.Value);
                CreateDataTableCart();
                if (dtCart.Rows.Count > 0)
                {
                    GVCartCheckout.DataSource = dtCart;
                    GVCartCheckout.DataBind();
                }
            }
        }
        private void CreateDataTableCart()
        {
            PopulateData();

            dtCart = new DataTable();

            dtCart.Columns.Add("Id");
            dtCart.Columns.Add("Title");
            dtCart.Columns.Add("Price");
            dtCart.Columns.Add("Quantity");
            dtCart.Columns.Add("ItemTotal");
            foreach (KeyValuePair<string, string> item in dictionaryCart)
            {
                DataRow[] selectedRow = dtMenus.Select("Id = " + item.Key);
                DataRow row = dtCart.NewRow();
                row["Id"] = int.Parse(item.Key);
                row["Title"] = selectedRow[0]["Title"];
                row["Price"] = selectedRow[0]["Price"];
                row["Quantity"] = item.Value;
                row["ItemTotal"] = double.Parse(row["Price"].ToString()) * int.Parse(item.Value);

                subtotal += double.Parse(row["Price"].ToString()) * int.Parse(item.Value);

                itemQuantityPrice += (selectedRow[0]["Title"] + " x " + item.Value +" = "+ (double.Parse(row["Price"].ToString()) * int.Parse(item.Value)) + "<br>").ToString();

                dtCart.Rows.Add(row);
            }
            CheckoutItemSubTotal.InnerText = "Tk. "+subtotal.ToString();
            CheckoutItemTotal.InnerText = "Tk. " + (subtotal + 50).ToString();
            checkoutPayTotal.InnerText = "Tk. " + (subtotal + 50).ToString();
            checkoutPayTotalCC.InnerText = "Tk. " + (subtotal + 50).ToString();
        }

        private void PopulateData()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT Id,Title,Price,Image FROM tbl_RestaurantMenu";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    dtMenus = new DataTable();
                    sda.Fill(dtMenus);
                }
                con.Close();
            }
        }

        protected void GVCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "RemoveCartItem":
                    string itemID = e.CommandArgument.ToString();
                    var cookieCart = Request.Cookies["MahmudCookieCart"];
                    cookieCart.Value = cookieCartParser.Remove(itemID, cookieCart.Value);
                    Response.Cookies["MahmudCookieCart"].Value = cookieCart.Value;
                    Response.Redirect(Request.RawUrl, true);
                    break;
            }
        }

        protected void btnCheckoutCC_Click(object sender, EventArgs e)
        {
            if (isValidate() == true && isValidateCC() == true)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString))
                {
                    SqlTransaction transaction;
                    conn.Open();
                    transaction = conn.BeginTransaction();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Transaction = transaction;
                        cmd.Connection = conn;
                        try
                        {
                            cmd.CommandText = "sp_Insert_tblOrders_tblCardDetails";
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Clear();
                            cmd.Parameters.Add(new SqlParameter("OrderId", orderid));
                            cmd.Parameters.Add(new SqlParameter("customerId", custId));
                            cmd.Parameters.Add(new SqlParameter("Items", itemQuantityPrice));
                            cmd.Parameters.Add(new SqlParameter("Subtotal", subtotal));
                            cmd.Parameters.Add(new SqlParameter("Charge", "50"));
                            cmd.Parameters.Add(new SqlParameter("Total", subtotal+50));
                            cmd.Parameters.Add(new SqlParameter("pMethod", "Card"));
                            cmd.Parameters.Add(new SqlParameter("ODate", DateTime.Now.ToShortDateString()));
                            cmd.Parameters.Add(new SqlParameter("street", street.Value));
                            cmd.Parameters.Add(new SqlParameter("city", city.Value));
                            cmd.Parameters.Add(new SqlParameter("zip", zip.Value));
                            cmd.Parameters.Add(new SqlParameter("status", "Pending"));

                            cmd.Parameters.Add(new SqlParameter("CardNumber", ccNumber.Value));
                            cmd.Parameters.Add(new SqlParameter("CardExpiry", ccExpire.Value));
                            cmd.Parameters.Add(new SqlParameter("CardCVV", cvv.Value));
                            cmd.Parameters.Add(new SqlParameter("CardholderName", ccName.Value));
                            cmd.ExecuteNonQuery();
                            
                            transaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            showMsgDiv.InnerHtml = "something wrong! " + ex.Message;
                        }
                        finally
                        {
                            conn.Close();
                            Response.Cookies["MahmudCookieCart"].Expires = DateTime.Now.AddDays(-1);
                            Response.Redirect("ThankYou.aspx");
                        }
                    }
                }
            }
            else
            {
                showMsgDiv.Attributes.Add("class", "alert alert-danger alert-dismissible fade show d-block");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (isValidate() == true)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("insert into tbl_orders values('"+ orderid + "',"+ Session["id"] + ",'"+itemQuantityPrice+ "','"+subtotal+"','50','"+ (subtotal + 50) + "','cod',GETDATE(),'" + street.Value+"','"+city.Value+"','"+zip.Value+"','Pending')"))
                    {
                        con.Open();
                        cmd.Connection = con;
                        if (cmd.ExecuteNonQuery()>0)
                        {
                            con.Close();
                            Response.Cookies["MahmudCookieCart"].Expires = DateTime.Now.AddDays(-1);
                            Response.Redirect("ThankYou.aspx");
                        }
                    }
                }
                
            }
            else
            {
                showMsgDiv.Attributes.Add("class", "alert alert-danger alert-dismissible fade show d-block");
            }
        }
        protected bool isValidate()
        {
            if (street.Value == "")
            {
                street.Focus();
                street.Style.Add("border","1px solid red");
                street.Style.Add("background", "#ff00000d;");
                return false;
            }
            else if (city.Value == "")
            {
                city.Focus();
                city.Style.Add("border", "1px solid red");
                city.Style.Add("background", "#ff00000d;");
                return false;
            }
            else if (zip.Value == "")
            {
                zip.Focus();
                zip.Style.Add("border", "1px solid red");
                zip.Style.Add("background", "#ff00000d;");
                return false;
            }
            return true;
        }
        protected bool isValidateCC()
        {
            if (ccNumber.Value == "")
            {
                ccNumber.Focus();
                ccNumber.Style.Add("border", "1px solid red");
                ccNumber.Style.Add("background", "#ff00000d;");
                return false;
            }
            else if (ccExpire.Value == "")
            {
                ccExpire.Focus();
                ccExpire.Style.Add("border", "1px solid red");
                ccExpire.Style.Add("background", "#ff00000d;");
                return false;
            }
            else if (cvv.Value == "")
            {
                cvv.Focus();
                cvv.Style.Add("border", "1px solid red");
                cvv.Style.Add("background", "#ff00000d;");
                return false;
            }
            else if (ccNumber.Value == "")
            {
                ccNumber.Focus();
                ccNumber.Style.Add("border", "1px solid red");
                ccNumber.Style.Add("background", "#ff00000d;");
                return false;
            }
            return true;
        }
    }
}