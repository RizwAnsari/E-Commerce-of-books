using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridWithBook();
            fnFillBook();
            divBook.Visible = false;
        }
    }


    private void fnFillBook()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string query = "select * from Category";
            cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            Hashtable ht = new Hashtable();

            while (reader.Read())
            {
                ht.Add(reader["CategoryId"], reader["CategoryName"]);
            }
            drpCategory.Items.Clear();
            drpCategory.Items.Add("Select Category");
            ViewState["Category"] = ht;
            foreach (int key in ht.Keys)
            {
                drpCategory.Items.Add(Convert.ToString(ht[key]));
            }

            conn.Close();

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

    private void fnFillSubCategory()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string query = "select * from SubCategory where CategoryId=@CategoryId";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("CategoryId", fnSelectCategoryID());
            SqlDataReader reader = cmd.ExecuteReader();

            Hashtable htSubCategory = new Hashtable();

            while (reader.Read())
            {
                htSubCategory.Add(reader["SubCategoryId"], reader["SubCategoryName"]);
            }

            drpSubCategory.Items.Clear();
            ViewState["SubCategory"] = htSubCategory;
            foreach (int key in htSubCategory.Keys)
            {
                drpSubCategory.Items.Add(Convert.ToString(htSubCategory[key]));
            }

            conn.Close();

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
    protected void GvBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int BookId = Convert.ToInt32(e.Keys[0].ToString());
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "delete from Books where BookId =" + BookId;
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();

            FillGridWithBook();
            fnClearAll();
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
    protected void GvBook_SelectedIndexChanged(object sender, EventArgs e)
    {
        BtnNewBook.Text = "Update";
        divBook.Visible = true;

        int index = GvBook.SelectedIndex;
        int BookId = Convert.ToInt32(GvBook.DataKeys[index].Value);

        GetSingleBook(BookId);
        ViewState["CategoryId"] = BookId;
    }
    private void GetSingleBook(int BookId)
    {
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
                TxtBook.Text = dr["Title"].ToString();
                TxtAuthor.Text = dr["Author"].ToString();
                TxtPrice.Text = dr["Price"].ToString();
                TxtDescription.Text = dr["Description"].ToString();
                TxtPublisher.Text = dr["Publisher"].ToString();
                TxtPublishedYear.Text = dr["PublishedYear"].ToString();
                TxtISBN13.Text = dr["ISBN13"].ToString();
                TxtISBN10.Text = dr["ISBN10"].ToString();
                TxtLanguage.Text = dr["Language"].ToString();
                TxtBinding.Text = dr["Binding"].ToString();
                TxtNoOfPages.Text = dr["NumberOfPages"].ToString();
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
    protected void drpSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    private int fnSelectCategoryID()
    {
        int id = 0;
        Hashtable ht = new Hashtable();
        ht = (Hashtable)ViewState["Category"];

        foreach (int key in ht.Keys)
        {
            if (drpCategory.SelectedItem.Value == Convert.ToString(ht[key]))
            {
                id = key;
                break;
            }
        }
        return id;
    }

    private int fnSelectSubCategoryID()
    {
        int id = 0;
        Hashtable ht = new Hashtable();
        ht = (Hashtable)ViewState["SubCategory"];

        foreach (int key in ht.Keys)
        {
            if (drpSubCategory.SelectedItem.Value == Convert.ToString(ht[key]))
            {
                id = key;
                break;
            }
        }
        return id;
    }
    protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        fnFillSubCategory();
    }

    private void InsertData()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into Books(CategoryId,SubCategoryId,Image,Title,Author,Price,Description,Publisher,PublishedYear,ISBN13,ISBN10,Language,Binding,NumberOfPages) values (@CategoryId,@SubCategoryId,@Image,@Title,@Author,@Price,@Description,@Publisher,@PublishedYear,@ISBN13,@ISBN10,@Language,@Binding,@NumberOfPages)";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryId", fnSelectCategoryID());
            cmd.Parameters.AddWithValue("@SubCategoryId", fnSelectSubCategoryID());

            string filename = string.Empty;
            if (ImgUpload.HasFile)
            {
                string folderpath = Server.MapPath("Images/Upload");
                string guid = Guid.NewGuid().ToString();
                filename = guid + ImgUpload.FileName;
                ImgUpload.SaveAs(folderpath + @"\" + filename);
            }

            cmd.Parameters.AddWithValue("@Image", filename);

            cmd.Parameters.AddWithValue("@Title", TxtBook.Text);
            cmd.Parameters.AddWithValue("@Author", TxtAuthor.Text);
            cmd.Parameters.AddWithValue("@Price", TxtPrice.Text);
            cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
            cmd.Parameters.AddWithValue("@Publisher", TxtPublisher.Text);
            cmd.Parameters.AddWithValue("@PublishedYear", TxtPublishedYear.Text);
            cmd.Parameters.AddWithValue("@ISBN13", TxtISBN13.Text);
            cmd.Parameters.AddWithValue("@ISBN10", TxtISBN10.Text);
            cmd.Parameters.AddWithValue("@Language", TxtLanguage.Text);
            cmd.Parameters.AddWithValue("@Binding", TxtBinding.Text);
            cmd.Parameters.AddWithValue("@NumberOfPages", TxtNoOfPages.Text);
            cmd.ExecuteNonQuery();
            FillGridWithBook();
            divBook.Visible = false;
            fnClearAll();
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

    private void UpdateData()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Update Books Set CategoryId=@CategoryId, SubCategoryId=@SubCategoryId, Image=@Image, Title=@Title, Author=@Author, Price=@Price, Description=@Description, Publisher=@Publisher, PublishedYear=@PublishedYear, [ISBN13]=@ISBN13, [ISBN10]=@ISBN10, Language=@Language, Binding=@Binding, NumberOfPages=@NumberOfPages where BookId=@BookId";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryId", fnSelectCategoryID());
            cmd.Parameters.AddWithValue("@SubCategoryId", fnSelectSubCategoryID());

            string filename = string.Empty;
            if (ImgUpload.HasFile)
            {
                string folderpath = Server.MapPath("Images/Upload");
                string guid = Guid.NewGuid().ToString();
                filename = guid + ImgUpload.FileName;
                ImgUpload.SaveAs(folderpath + @"\" + filename);
            }

            cmd.Parameters.AddWithValue("@Image", filename);

            cmd.Parameters.AddWithValue("@Title", TxtBook.Text);
            cmd.Parameters.AddWithValue("@Author", TxtAuthor.Text);
            cmd.Parameters.AddWithValue("@Price", TxtPrice.Text);
            cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
            cmd.Parameters.AddWithValue("@Publisher", TxtPublisher.Text);
            cmd.Parameters.AddWithValue("@PublishedYear", TxtPublishedYear.Text);
            cmd.Parameters.AddWithValue("@ISBN13", TxtISBN13.Text);
            cmd.Parameters.AddWithValue("@ISBN10", TxtISBN10.Text);
            cmd.Parameters.AddWithValue("@Language", TxtLanguage.Text);
            cmd.Parameters.AddWithValue("@Binding", TxtBinding.Text);
            cmd.Parameters.AddWithValue("@NumberOfPages", TxtNoOfPages.Text);
            cmd.Parameters.AddWithValue("@BookId", Convert.ToInt32(ViewState["CategoryId"]));
            cmd.ExecuteNonQuery();
            FillGridWithBook();
            divBook.Visible = false;
            fnClearAll();
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

    public void fnClearAll()
    {

        TxtBook.Text = string.Empty;
        TxtAuthor.Text = string.Empty;
        TxtPrice.Text = string.Empty;
        TxtDescription.Text = string.Empty;
        TxtPublisher.Text = string.Empty;
        TxtPublishedYear.Text = string.Empty;
        TxtISBN13.Text = string.Empty;
        TxtISBN10.Text = string.Empty;
        TxtLanguage.Text = string.Empty;
        TxtBinding.Text = string.Empty;
        TxtNoOfPages.Text = string.Empty;
    }


    protected void BtnNewBook_Click(object sender, EventArgs e)
    {
        if (BtnNewBook.Text == "Add")
        {
            InsertData();
        }
        else
        {
            UpdateData();
        }
    }

    private void FillGridWithBook()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsBook = new DataSet();
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Books";
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsBook);
            GvBook.DataSource = dsBook;
            GvBook.DataBind();
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
    protected void BtnAddBook_Click(object sender, EventArgs e)
    {
        BtnNewBook.Text = "Add";
        fnClearAll();
        divBook.Visible = true;
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        TxtBook.Text = string.Empty;
        TxtAuthor.Text = string.Empty;
        TxtPrice.Text = string.Empty;
        TxtDescription.Text = string.Empty;
        TxtPublisher.Text = string.Empty;
        TxtPublishedYear.Text = string.Empty;
        TxtISBN13.Text = string.Empty;
        TxtISBN10.Text = string.Empty;
        TxtLanguage.Text = string.Empty;
        TxtBinding.Text = string.Empty;
        TxtNoOfPages.Text = string.Empty;
    }
}