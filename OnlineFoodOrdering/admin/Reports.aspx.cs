using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFoodOrdering.admin
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodDB"].ConnectionString);
        ReportDocument rd = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select uId,firstName+' '+lastName 'name' from tbl_users";
                    con.Open();
                    cmd.Connection = con;
                    ddlCustomer.DataSource = cmd.ExecuteReader();
                    ddlCustomer.DataTextField = "name";
                    ddlCustomer.DataValueField = "uId";
                    ddlCustomer.DataBind();
                    con.Close();
                }
                ddlCustomer.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }
        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            rd.Load(Server.MapPath("~/admin/OrdersReport.rpt"));
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_orders", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rd.SetDataSource(dt);
            rd.SetParameterValue("CustomerId", ddlCustomer.SelectedValue.ToString());
            CrystalReportViewer1.ReportSource = rd;
            CrystalReportViewer1.DataBind();
        }
    }
}