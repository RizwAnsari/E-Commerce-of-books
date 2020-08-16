using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class VerifyComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridWithComments();
        }
    }

    private void FillGridWithComments()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsComment = new DataSet();
       
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from CommentsMetaData";
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsComment);
            GvComment.DataSource = dsComment;
            GvComment.DataBind();
        
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        
    }



    protected void GvComment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int CommentMetadataId = Convert.ToInt32(e.Keys[0].ToString());
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "delete from CommentsMetaData where CommentsMetaDataID =" + CommentMetadataId;
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();

            FillGridWithComments();
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

    private void GetSingleComment(int CommentMetadataId)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select * from CommentsMetaData where CommentsMetaDataID =" + CommentMetadataId;
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtName.Text = dr["UserName"].ToString();
                txtEmailID.Text = dr["Email"].ToString();
                txtComments.Text = dr["Comment"].ToString();
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

    protected void GvComment_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = GvComment.SelectedIndex;
        int CommentMetadataId = Convert.ToInt32(GvComment.DataKeys[index].Value);

        GetSingleComment(CommentMetadataId);
        ViewState["CommentsMetaDataID"] = CommentMetadataId;
    }

    private void InsertComment()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            String sql = "Insert into Comments (UserName,Email,Comment,AddedOn) values (@UserName,@Email,@Comment,@AddedOn)";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@Comment", txtComments.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@AddedOn", myDateTime);
            cmd.ExecuteNonQuery();
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


    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (RbtnYes.Checked == true)
        {
            InsertComment();
            fnClearAll();
            Lblstatus.Text = "Comment is verified.";
        }
        else
        {
            Lblstatus.Text = "Invalid Comment to be Deleted";
        }
    }

    public void fnClearAll()
    {
        txtName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtComments.Text = string.Empty;
        RbtnYes.Checked = false;
        RbtnNo.Checked = false;
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        txtName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtComments.Text = string.Empty;
        RbtnYes.Checked = false;
        RbtnNo.Checked = false;
    }
}