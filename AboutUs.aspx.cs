using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != string.Empty && Session["UserName"] != null)
        {
            LogInStatus.Visible = false;
            DvComment.Visible = true;
        }
        else
        {
            DvComment.Visible = false;
            LogInStatus.Visible = true;
            LogInStatus.Text = "Login to comment your Review!";
        }

        if (!IsPostBack)
        {
            // DvComment.Visible = false ;
            GetComments();
        }
    }

    private void GetComments()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        DataSet dsComment = new DataSet();

        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            String sql = "Select * from Comments Order By AddedOn Desc";

            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsComment);
            Repeater1.DataSource = dsComment;
            Repeater1.DataBind();

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



    protected void btnComment_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            String sql = "Insert into CommentsMetaData(UserName,Email,Comment,AddedOn) values (@UserName,@Email,@Comment,@AddedOn)";
            cmd = new SqlCommand(sql, conn);
            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@Comment", txtComments.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@AddedOn", sqlFormattedDate);
            cmd.ExecuteNonQuery();
            GetComments();
            fnClearAll();
            if (txtComments.Text != null)
            {
                LblCommentStatus.Text = "Your Comment is under Verification";
            }
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

    public void fnClearAll()
    {
        txtName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtComments.Text = string.Empty;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtComments.Text = string.Empty;
    }
}