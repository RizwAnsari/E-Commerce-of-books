using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Reporting.WebForms;

public partial class ReportBill : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
    SqlCommand cmd = null;
    SqlDataAdapter adapt = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("BillDS", DisplayBillReport()));
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportBill.rdlc");
                ReportViewer1.LocalReport.Refresh();
            }
        }
        catch (Exception ex) { }
    }

    public DataTable DisplayBillReport()
    {
        try
        {
            BillDataSet.DtBillDataTable DtBill = new BillDataSet.DtBillDataTable();
            string query = "select b.Title,b.Author,b.PublishedYear,b.ISBN13,b.ISBN10,cid.Quantity,cid.Price,cd.TotalCost from CartItemDetails cid inner join Books b on b.BookId=cid.BookId inner join CartDetails cd on cd.TransactionId=cid.TransactionId where cid.TransactionId=@TransactionId";
            cmd = new SqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
            //cmd.Parameters.AddWithValue("@TransactionId",Convert.ToInt32(Session["TransactionId"]));
            // cmd.Parameters.AddWithValue("@UserName", Session["UserName"]);
            cmd.Parameters.AddWithValue("@TransactionId", Convert.ToInt32(Session["TransactionId"]));
            adapt = new SqlDataAdapter(cmd);
            adapt.Fill(DtBill);
            return DtBill;
        }
        catch (Exception)
        {

            throw;
        }
    }
}