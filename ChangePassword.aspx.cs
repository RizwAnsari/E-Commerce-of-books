using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            dvLogin.Visible = false;
            dvChangePass.Visible = true;
        }
        else if (Session["UserName"] == null)
        {
            dvLogin.Visible = true;
            dvChangePass.Visible = false;
        }


    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        TxtCurrentPassword.Text = string.Empty;
        TxtNewPassword.Text = string.Empty;
        TxtConfirmNewPassword.Text = string.Empty;
    }

    protected void BtnSaveChanges_Click(object sender, EventArgs e)
    {
        ChangePasswordDetails();
    }
    byte up;
    private void ChangePasswordDetails()
    {
        SqlConnection conn = null;
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);

        SqlCommand cmd = null;
         
        if (Session["UserName"] != null)
        {
            conn.Open();
            string str = "select * from Users";
            cmd = new SqlCommand(str, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                    if (TxtCurrentPassword.Text == reader["Password"].ToString())
                    {
                        up = 1;
                        
                    }
                   
            }

                conn.Close();
                if (up == 1)
                {
                    str = "update Users set Password=@Password where UserName='" + Session["UserName"].ToString() + "'";
                    conn.Open();

                    cmd = new SqlCommand(str, conn);
                    cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50));
                    cmd.Parameters["@Password"].Value = TxtNewPassword.Text;
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblCError.Text = "Password changed Successfully";
                }
                else
                {
                    lblError.Text = "Please enter correct Current password";
                }
        }
    }

}