using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineFoodOrdering.admin.Classes;
using System.Threading;
using System.Configuration;

namespace OnlineFoodOrdering
{
    public partial class restaurant : Page
    {
        //Connection1 con = new Connection1();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        string id = "0";
        string cartItems = string.Empty;

        //cart
        CookieCartParser cookieCartParser;
        Dictionary<string, string> dictionaryCart;
        DataTable dtMenus;
        DataTable dtCart;

        public void Page_Load(object sender, EventArgs e)
        {
            //populate cart items
            cookieCartParser = new CookieCartParser();
            var cookieCart = Request.Cookies["MahmudCookieCart"];
            if (cookieCart != null)
            {
                dictionaryCart = cookieCartParser.ToDictionary(cookieCart.Value);
                CreateDataTableCart();
                if (dtCart.Rows.Count > 0)
                {
                    GVCart.DataSource = dtCart;
                    GVCart.DataBind();
                }
            }
            //cart count
            HttpCookie cartCookieCount = HttpContext.Current.Request.Cookies["MahmudCookieCart"];
            if (cartCookieCount != null)
            {
                string cartCookieValuesCount = Server.HtmlEncode(cartCookieCount.Value);
                string[] cartIds = cartCookieValuesCount.Split(',');
                CartCountNumber.InnerText = cartIds.Count().ToString();
            }
            else CartCountNumber.InnerText = "0";
            
            
            //GET RESTAURANT ID FROM QUERY STRING
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != string.Empty )
                id = Request.QueryString["id"];
            else
                Response.Redirect("Default.aspx");
            
            //DISPLAY RESTAURANT INFORMATION
            GetRestaurant();
            //DISPLAY POPULAR MENU ITEMS FROM THE RESTAURANT
            BindListViewPopularMenus();
            BindListViewAllMenus();

            cookieCartParser = new CookieCartParser();

        }
        public void GetRestaurant()
        {
            con.Open();
            SqlDataReader sdr;
            SqlCommand cmd = new SqlCommand("SELECT r.r_id,r.r_name,r.r_category,r.r_desc,r.r_banner_img,r.r_logo,l.l_address,l.l_city,l.l_state,l.l_zip FROM tbl_restaurant r JOIN tbl_location AS l on l.r_id = r.r_id WHERE r.r_id = "+id+"", con);
            sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                restaurantName.InnerText = sdr["r_name"].ToString();
                restaurantAddress.InnerText = " "+sdr["l_address"].ToString();
                restaurantAddress.InnerText += ", "+sdr["l_city"].ToString();
                restaurantAddress.InnerText += ", "+sdr["l_state"].ToString();
                restaurantAddress.InnerText += ", "+sdr["l_zip"].ToString();
                cat.InnerText = " Food category: " + sdr["r_category"].ToString();
                //txtShortDesc.Text = sdr["r_desc"].ToString();
                resImg.Src = "..//admin//restaurantImages//" + sdr["r_logo"].ToString();
                resBanner.Src = "..//admin//restaurantImages//" + sdr["r_banner_img"].ToString();
                //txtAddress.Text=sdr["r_"]
            }
            con.Close();
        }

        protected void ListViewPopularMenu_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            { 
                case "AddToCart":
                    
                    var cookieCart = Request.Cookies["MahmudCookieCart"];
                    string itemID = e.CommandArgument.ToString();
                    if (cookieCart == null)
                    {
                        cookieCart = new HttpCookie("MahmudCookieCart");
                        cookieCart.Value = "";
                        cookieCart.Expires = DateTime.Now.AddDays(30);
                        cookieCart.Value = cookieCartParser.Add(itemID, cookieCart.Value);
                        Response.Cookies.Add(cookieCart);
                        Thread.Sleep(3000);
                        Response.Redirect(Request.RawUrl, true);
                    }
                    else
                    {
                        cookieCart.Value = cookieCartParser.Add(itemID, cookieCart.Value);
                        Response.Cookies["MahmudCookieCart"].Value = cookieCart.Value;
                        Thread.Sleep(3000);
                        Response.Redirect(Request.RawUrl, true);
                    }
                    break;
            }
        }
        private void BindListViewPopularMenus()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT TOP 3 Id,Title,Price,Image FROM tbl_RestaurantMenu WHERE RestaurantId=" + id + " ORDER BY Id DESC";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListViewPopularMenu.DataSource = dt;
                    ListViewPopularMenu.DataBind();
                }
                con.Close();
            }

        }
        private void BindListViewAllMenus()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT Id,Title,Price,Image FROM tbl_RestaurantMenu WHERE RestaurantId=" + id + " ORDER BY Id";
                con.Open();
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    LVAllMenuItems.DataSource = dt;
                    LVAllMenuItems.DataBind();
                }
                con.Close();
            }

        }
        public DataSet GetCartItems()
        {
            //CART ITEMS IN COOKIE
            HttpCookie cartCookie = HttpContext.Current.Request.Cookies["MahmudCookieCart"];
            if (cartCookie != null)
            {
                string cartCookieValues = Server.HtmlEncode(cartCookie.Value);
                string[] cartIds = cartCookieValues.Split(',');
                var count = 0;
                foreach (var i in cartIds)
                {
                    if (count > 0) cartItems += ",";
                    cartItems += i.Split('=')[0];
                    count++;
                }
                if (cartItems != "")
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT Id, Title, Price FROM tbl_RestaurantMenu WHERE Id IN(" + cartItems + ")";
                        con.Open();
                        cmd.Connection = con;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            con.Close();
                            return ds;
                        }
                    }
                }
                else
                {
                    return null;
                }
            }
            else return null;

        }
        protected void LVCartItems_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "RemoveFromCart":
                    string itemID = e.CommandArgument.ToString();
                    var cookieCart = Request.Cookies["MahmudCookieCart"];
                    cookieCart.Value = cookieCartParser.Remove(itemID, cookieCart.Value);
                    Response.Cookies["MahmudCookieCart"].Value = cookieCart.Value;
                    Response.Redirect(Request.RawUrl, true);
                    break;
            }
        }

        protected void LVAllMenuItems_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "AddToCart2":
                    var cookieCart = Request.Cookies["MahmudCookieCart"];
                    string itemID = e.CommandArgument.ToString();
                    if (cookieCart == null)
                    {
                        cookieCart = new HttpCookie("MahmudCookieCart");
                        cookieCart.Value = "";
                        cookieCart.Expires = DateTime.Now.AddDays(30);
                        cookieCart.Value = cookieCartParser.Add(itemID, cookieCart.Value);
                        Response.Cookies.Add(cookieCart);
                        Thread.Sleep(5000);
                        Response.Redirect(Request.RawUrl, true);
                    }
                    else
                    {
                        cookieCart.Value = cookieCartParser.Add(itemID, cookieCart.Value);
                        Response.Cookies["MahmudCookieCart"].Value = cookieCart.Value;
                        Thread.Sleep(5000);
                        Response.Redirect(Request.RawUrl, true);
                    }
                    break;
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
            rCarttotal.InnerText = subtotal.ToString();
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
    }
}