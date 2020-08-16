using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Butreg_Click(object sender, ImageClickEventArgs e)
    {
        bool isAvailable = fnCheckAvailability(TextBoxUN.Text);
        if (!isAvailable)
        {

            InsertRegistrationDetails();
            Response.Redirect("Login.aspx");
        }

    }
    private void InsertRegistrationDetails()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into Users (UserName,FirstName,LastName,Email,Password,Mobile,City,State,PinCode,Address,DateOfBirth,Gender) values (@UserName,@FirstName,@LastName,@Email,@Password,@Mobile,@City,@State,@PinCode,@Address,@DateOfBirth,@Gender)";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserName", TextBoxUN.Text);
            cmd.Parameters.AddWithValue("@FirstName", TextBoxFN.Text);
            cmd.Parameters.AddWithValue("@LastName", TextBoxLN.Text);
            cmd.Parameters.AddWithValue("@Email", TextBoxEM.Text);
            cmd.Parameters.AddWithValue("@Password", TextBoxPass.Text);
            cmd.Parameters.AddWithValue("@Mobile", TextBoxMob.Text);
            cmd.Parameters.AddWithValue("@City", DropDownListCity.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@State", DropDownListState.Text);
            cmd.Parameters.AddWithValue("@PinCode", TextBoxPin.Text);
            cmd.Parameters.AddWithValue("@Address", TextBoxAdd.Text);
            cmd.Parameters.AddWithValue("@DateOfBirth", TextBoxDOB.Text);
            cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedItem.Text);
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
    protected void ButtonAvailability_Click(object sender, EventArgs e)
    {
        fnCheckAvailability(TextBoxUN.Text);
    }

    private bool fnCheckAvailability(string UserName)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        bool isavailable = false;
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            string query = "select count(*) from Users where UserName=@UserName";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", UserName);
            int result = Convert.ToInt32(cmd.ExecuteScalar());
            if (result > 0)
            {
                LabelStatus.Visible = true;
                LabelStatus.Text = "Please Enter a different user name";
                isavailable = true;
            }
            else
            {
                LabelStatus.Visible = true;
                LabelStatus.Text = "Username is available";
            }
        }
        catch (Exception e)
        {
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        return isavailable;
    }

    protected void Butclear_Click(object sender, ImageClickEventArgs e)
    {
        TextBoxFN.Text = string.Empty;
        TextBoxLN.Text = string.Empty;
        TextBoxUN.Text = " ";
        TextBoxMob.Text = " ";
        TextBoxEM.Text = " ";
        TextBoxPass.Text = " ";
        TextBoxCP.Text = " ";
        //DropDownListc.SelectedItem.Text = " ";
        DropDownListState.Text = " ";
        TextBoxPin.Text = " ";
        TextBoxAdd.Text = " ";
        DropDownListCity.SelectedItem.Text = " ";
        TextBoxDOB.Text = " ";
        DropDownListGender.SelectedItem.Text = " ";
    }

}