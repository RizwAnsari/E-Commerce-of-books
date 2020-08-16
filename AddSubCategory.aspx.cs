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

public partial class AddSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fnFillCategories();
            FillGridWithSubCategory();
            divSubCategory.Visible = false;
        }
    }

    private void FillGridWithSubCategory()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsCategory = new DataSet();
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select sc.SubCategoryId , c.CategoryName ,sc.SubCategoryName  from [dbo].[SubCategory] sc inner join [dbo].[Category] c on sc.CategoryId = c.CategoryId ";
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsCategory);
            GvSubCategory.DataSource = dsCategory;
            GvSubCategory.DataBind();

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

    private void fnFillCategories()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsCategory = new DataSet();
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
    protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
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

    private void InsertData()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into SubCategory(CategoryId,SubCategoryName) values (@CategoryId,@SubCategoryName)";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryId", fnSelectCategoryID());
            cmd.Parameters.AddWithValue("@SubCategoryName", TxtSubCategory.Text);
            cmd.ExecuteNonQuery();
            FillGridWithSubCategory();
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
            string sql = "Update SubCategory Set SubCategoryName = @SubCategoryName , CategoryId=@CategoryId where SubCategoryId=@SubCategoryId";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryId", fnSelectCategoryID());
            cmd.Parameters.AddWithValue("@SubCategoryName", TxtSubCategory.Text);
            cmd.Parameters.AddWithValue("@SubCategoryId", ViewState["CategoryId"]);
            cmd.ExecuteNonQuery();
            FillGridWithSubCategory();
            divSubCategory.Visible = false;
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

    protected void BtnAddSubCategory_Click(object sender, EventArgs e)
    {
        fnClearAll();
        divSubCategory.Visible = true;
    }

    protected void BtnNewSubCategory_Click(object sender, EventArgs e)
    {
        if (BtnNewSubCategory.Text == "Add")
        {
            InsertData();
        }
        else
        {
            UpdateData();
        }
    }
    protected void GvSubCategory_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int SubCategoryId = Convert.ToInt32(e.Keys[0].ToString());
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "delete from SubCategory where SubCategoryId =" + SubCategoryId;

            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();

            FillGridWithSubCategory();

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
    protected void GvSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        fnClearAll();
        BtnNewSubCategory.Text = "Update";
        divSubCategory.Visible = true;

        int index = GvSubCategory.SelectedIndex;
        int SubCategoryId = Convert.ToInt32(GvSubCategory.DataKeys[index].Value);

        GetSingleSubCategory(SubCategoryId);
        ViewState["CategoryId"] = SubCategoryId;
    }



    private void GetSingleSubCategory(int CategoryId)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from SubCategory where SubCategoryId =" + CategoryId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                drpCategory.SelectedItem.Value = fnSelectCategory(Convert.ToInt32(dr["CategoryId"]));
                TxtSubCategory.Text = dr["SubCategoryName"].ToString();
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

    private string fnSelectCategory(int subCategoryId)
    {
        string id = string.Empty;
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Category where CategoryId =" + subCategoryId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                id = dr["CategoryName"].ToString();

            }
        }
        catch (Exception)
        {
        }
        finally
        {

        }
        return id;
    }

    public void fnClearAll()
    {
        TxtSubCategory.Text = string.Empty;
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        TxtSubCategory.Text = string.Empty;
    }
}
