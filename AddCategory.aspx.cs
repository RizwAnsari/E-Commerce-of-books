using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridWithCategory();
            divCategory.Visible = false;
        }
    }

    private void FillGridWithCategory()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsCategory = new DataSet();
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Category";
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsCategory);
            GvCategory.DataSource = dsCategory;
            GvCategory.DataBind();
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

    protected void BtnAddCategory_Click(object sender, EventArgs e)
    {
        fnClearAll();
        divCategory.Visible = true;
    }

    protected void BtnNewCategory_Click(object sender, EventArgs e)
    {
        if (BtnNewCategory.Text == "Add")
        {
            InsertData();
        }
        else
        {
            UpdateData();
        }
    }

    private void InsertData()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into Category(CategoryName) values (@CategoryName)";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryName", TxtCategory.Text);
            cmd.ExecuteNonQuery();
            FillGridWithCategory();
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
            string sql = "Update Category Set CategoryName = @CategoryName where CategoryId=@CategoryId";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CategoryId", Convert.ToInt32(ViewState["CategoryId"]));
            cmd.Parameters.AddWithValue("@CategoryName", TxtCategory.Text);
            cmd.ExecuteNonQuery();
            FillGridWithCategory();
            divCategory.Visible = false;
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

    private void GetSingleCategory(int CategoryId)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from Category where CategoryId =" + CategoryId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TxtCategory.Text = dr["CategoryName"].ToString();
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

    public void fnClearAll()
    {
        TxtCategory.Text = string.Empty;
    }
    protected void GvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int CategoryId = Convert.ToInt32(e.Keys[0].ToString());
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "delete from Category where CategoryId =" + CategoryId;
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();

            FillGridWithCategory();
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

    protected void GvCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        fnClearAll();
        BtnNewCategory.Text = "Update";
        divCategory.Visible = true;
        int index = GvCategory.SelectedIndex;
        int CategoryId = Convert.ToInt32(GvCategory.DataKeys[index].Value);

        GetSingleCategory(CategoryId);
        ViewState["CategoryId"] = CategoryId;
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        TxtCategory.Text = string.Empty;
    }
}
