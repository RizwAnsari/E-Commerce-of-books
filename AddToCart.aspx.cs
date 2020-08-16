using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddToCart : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
    SqlCommand cmd = null;
    SqlDataAdapter da = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        LblCartStatus.Visible = false;
        HLlogin.Visible = false;
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["BookID"]);
            getSingleBooktoAdd(id);
        }
    }

    private void SearchResult(int BId)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {

            string searchtext = Session["SearchText"].ToString();
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select BookId,Image,Title,Author,Price from Books where Title like @name";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", searchtext + "%");
            da.SelectCommand = cmd;
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();


        }
        catch (Exception ex)
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

    private void getSingleBooktoAdd(int id)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter adp = null;
        DataSet ds = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Books where BookId =" + id;
            cmd = new SqlCommand(sql, conn);
            ds = new DataSet();
            adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
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

    protected void BtnAddToCart_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != string.Empty && Session["UserName"] != null)
        {
            LblCartStatus.Visible = true;
            LblCartStatus.Text = "Product has been added to your Cart";
        }
        else
        {
            LblCartStatus.Visible = true;
            LblCartStatus.Text = "You need to Login!";
            HLlogin.Visible = true;
        }
    }

    protected void BtnAddToCart_Command(object sender, CommandEventArgs e)
    {
        if (Session["UserName"] != string.Empty && Session["UserName"] != null)
        {
            string BookID = e.CommandArgument.ToString();
            string BookName = getBookName(Convert.ToInt32(BookID));
            string Price = getPrice(Convert.ToInt32(BookID));
            AddToCART atc = new AddToCART();
            atc.AddToCart(Convert.ToInt32(BookID), BookName, Convert.ToInt32(Price));
        }
    }

    public string getBookName(int BookId)
    {
        string BookName = string.Empty;
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Books where BookId =" + BookId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                BookName = dr["Title"].ToString();
            }
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
        return BookName;
    }

    public string getPrice(int BookId)
    {
        string Price = string.Empty;
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Books where BookId =" + BookId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Price = dr["Price"].ToString();
            }
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
        return Price;
    }
}
