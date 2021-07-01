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
    public partial class SiteMaster : MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        string cartItems = string.Empty;

        //cart
        CookieCartParser cookieCartParser;
        Dictionary<string, string> dictionaryCart;
        DataTable dtMenus;
        DataTable dtCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            //header cart
            cookieCartParser = new CookieCartParser();
            var cookieCart = Request.Cookies["MahmudCookieCart"];
            if (cookieCart != null)
            {
                dictionaryCart = cookieCartParser.ToDictionary(cookieCart.Value);
                CreateDataTableCart();
                if (dtCart.Rows.Count > 0)
                {
                    GVCartMaster.DataSource = dtCart;
                    GVCartMaster.DataBind();
                }
            }

            //cart count
            HttpCookie cartCookieCount = HttpContext.Current.Request.Cookies["MahmudCookieCart"];
            if (cartCookieCount != null)
            {
                string cartCookieValuesCount = Server.HtmlEncode(cartCookieCount.Value);
                string[] cartIds = cartCookieValuesCount.Split(',');
                HeaderCartCountNumber.InnerText = cartIds.Count().ToString();

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
            double subtotal = 0;
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
                dtCart.Rows.Add(row);
            }
            CartSubtotalMaster.InnerText = subtotal.ToString();
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
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["email"] = null;
            Session["role"] = null;
            Session["fname"] = null;
            Session["lname"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void GVCartMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "RemoveCartItemMaster":
                    string itemID = e.CommandArgument.ToString();
                    var cookieCart = Request.Cookies["MahmudCookieCart"];
                    cookieCart.Value = cookieCartParser.Remove(itemID, cookieCart.Value);
                    Response.Cookies["MahmudCookieCart"].Value = cookieCart.Value;
                    Response.Redirect(Request.RawUrl, true);
                    break;
            }
        }
    }
}