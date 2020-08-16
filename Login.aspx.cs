using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            loginPageStatus.Visible = true;
        }
        else
        {
            loginPageStatus.Visible = false;
        }

    }

    private void fnLogin()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        //string Type = string.Empty;
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select * from Users where UserName=@UserName and Password=@Password";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserName", TextBoxUN.Text);
            cmd.Parameters.AddWithValue("@Password", TextBoxPass.Text);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    //Type = Convert.ToString(reader["Type"]);
                    Session["UserName"] = Convert.ToString(reader["UserName"]);

                }
                Label6.Visible = false;
                Response.Redirect("Home.aspx");
                /*if (Type == "User")
                {
                    Response.Redirect("Home.aspx");
                }
                else if (Type == "Admin")
                {
                    Response.Redirect("AdminHome.aspx");
                }*/
            }
            else
            {
                Label6.Visible = true;
                Label6.Text = "You entered either wrong username or password";
                //Label6.Text = string.Empty;
                TextBoxPass.Text = string.Empty;
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
    protected void ImageButtonLogIn_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBoxUN.Text == "RizwanAdmin" && TextBoxPass.Text == "Admin")
        {
            Session["UserName"] = "Admin";
            Response.Redirect("AdminHome.aspx");
        }
        else
        {
            fnLogin();
        }
    }
    protected void ImageButtonCancel_Click(object sender, ImageClickEventArgs e)
    {
        TextBoxUN.Text = string.Empty;
        TextBoxPass.Text = string.Empty;
    }

}