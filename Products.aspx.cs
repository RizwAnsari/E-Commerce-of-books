using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Products : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);

    SqlCommand cmd = null;
    SqlDataAdapter da = null;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            FillGridWithSearchBook();
        }


    }

    private void SearchResult()
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {


            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select BookId,Image,Title,Author,Price,Description from Books where Title like @name";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim() + "%");
            da.SelectCommand = cmd;
            da.Fill(ds);
            RepeaterBook.DataSource = ds;
            RepeaterBook.DataBind();


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


    static DataSet dsBook = new DataSet();
    private void FillGridWithSearchBook()
    {

        try
        {

            conn.Open();
            string sql = "select bk.BookId , c.CategoryName , sb.SubCategoryName , bk.Title , bk.Price , bk.Author , bk.Description  ,bk.Image   from Books bk inner join Category c on bk.CategoryId = c.CategoryId  inner join SubCategory sb on  bk.SubCategoryId = sb.SubCategoryId ";
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            dsBook = new DataSet();
            da.Fill(dsBook);
            RepeaterBook.DataSource = dsBook;
            RepeaterBook.DataBind();

            DataTable dtCategory = dsBook.Tables[0].DefaultView.ToTable(true, "CategoryName");
            DataTable dtSubCategory = dsBook.Tables[0].DefaultView.ToTable(true, "SubCategoryName");

            DrpCategory.Items.Clear();
            DrpSubCategory.Items.Clear();
            DrpCategory.Items.Add("Select Category");
            DrpSubCategory.Items.Add("Select Sub Category");
            foreach (DataRow dr in dtCategory.Rows)
            {
                DrpCategory.Items.Add(dr[0].ToString());
            }
            foreach (DataRow dr in dtSubCategory.Rows)
            {
                DrpSubCategory.Items.Add(dr[0].ToString());
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
    }

    protected void DrpCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView dv = new DataView(dsBook.Tables[0]);
        string val = DrpCategory.SelectedItem.Value;
        string valsub = DrpSubCategory.SelectedItem.Value;
        if (DrpSubCategory.SelectedIndex != 0 && DrpCategory.SelectedIndex != 0)
        {
            dv.RowFilter = "CategoryName ='" + val + "' and SubCategoryName='" + valsub + "'";
        }
        else if (DrpCategory.SelectedIndex != 0)
        {
            dv.RowFilter = "CategoryName ='" + val + "'";
        }
        else
        {
            RepeaterBook.DataSource = dsBook.Tables[0];
        }
        RepeaterBook.DataSource = dv;
        RepeaterBook.DataBind();
    }
    protected void DrpSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView dv = new DataView(dsBook.Tables[0]);
        string valcat = DrpCategory.SelectedItem.Value;
        string valsub = DrpSubCategory.SelectedItem.Value;
        if (DrpSubCategory.SelectedIndex != 0 && DrpCategory.SelectedIndex != 0)
        {
            dv.RowFilter = "CategoryName ='" + valcat + "' and SubCategoryName='" + valsub + "'";
        }
        else if (DrpSubCategory.SelectedIndex != 0)
        {
            dv.RowFilter = "SubCategoryName ='" + valsub + "'";
        }
        else
        {
            RepeaterBook.DataSource = dsBook.Tables[0];
        }
        RepeaterBook.DataSource = dv;
        RepeaterBook.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text.Trim() != string.Empty)
        {
            SearchResult();
        }
        else
        {
        }
    }



}