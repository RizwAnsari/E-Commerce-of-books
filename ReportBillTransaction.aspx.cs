using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ReportBillTransaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridWithTransaction();
        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = GridView1.SelectedIndex;
        int BookId = Convert.ToInt32(GridView1.DataKeys[index].Value);
        Session["TransactionId"] = BookId;
        Response.Redirect("ReportBill.aspx");
    }

    private void FillGridWithTransaction()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsTransaction = new DataSet();
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select cd.TransactionId ,cid.AddedBy, b.Title,b.Author,cd.Quantity  from CartDetails cd inner join CartItemDetails cid on cd.TransactionId = cid.TransactionId inner join Books b on cid.BookId =b.BookId";
            cmd = new SqlCommand(sql, conn);
            //cmd.Parameters.AddWithValue("@TransactionId", Session["TransactionId"]);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsTransaction);
            GridView1.DataSource = dsTransaction;
            GridView1.DataBind();
        }
        catch (Exception)
        {
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
}