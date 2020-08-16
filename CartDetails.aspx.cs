using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class CartDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DvCreditCardDetails.Visible = false;
        DvShippingDetails.Visible = false;
        lblstatus.Visible = false;
        if (!IsPostBack)
        {
            GridView1.DataSource = (DataTable)Session["item"];
            GridView1.DataBind();
            fnFillYear();
        }
    }

    private void fnFillYear()
    {
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 1));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 2));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 3));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 4));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 5));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 6));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 7));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 8));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 9));
        DrpYear.Items.Add(Convert.ToString(DateTime.Now.Year + 10));

    }
    public int fnGenerateTransID()
    {
        int Transid = 0;
        string Price = string.Empty;
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "select max(TransactionId) from  dbo.CartDetails";
            cmd = new SqlCommand(sql, conn);

            string id = Convert.ToString(cmd.ExecuteScalar());
            if (id != "")
            { Transid = Convert.ToInt32(id) + 1; }
            else { Transid += 1; }


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
        return Transid;
    }

    private void InsertCartDetails()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            Session["TransactionId"] = fnGenerateTransID();
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into CartDetails(TransactionId, Quantity, TotalCost) values (@TransactionId, @Quantity, @TotalCost)";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TransactionId", fnGenerateTransID());
            cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(ViewState["NoofItems"]));
            cmd.Parameters.AddWithValue("@TotalCost", Convert.ToInt32(ViewState["TotalCost"]));
            cmd.ExecuteNonQuery();

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

    private void InsertCartItemDetails(int BookID, int NoofBooks, int price)
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into CartItemDetails(TransactionId,BookId, Quantity, Price, AddedOn, AddedBy) values (@TransactionId,@BookId, @Quantity, @Price, @AddedOn, @AddedBy)";
            cmd = new SqlCommand(sql, conn);
            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.Parameters.AddWithValue("@BookId", BookID);
            cmd.Parameters.AddWithValue("@TransactionId", fnGenerateTransID());
            cmd.Parameters.AddWithValue("@Quantity", NoofBooks);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@AddedOn", sqlFormattedDate);
            cmd.Parameters.AddWithValue("@AddedBy", Session["UserName"]);
            cmd.ExecuteNonQuery();
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

    public static int NoofItems = 0;
    public static int TotalCost = 0;

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (RBtnPaypal.Checked == true)
        {
                InsertCreditCardShippingDetails();
                fnAddCartDetails();
                fnSendConfirmation();
        }
        else if (RBtnCOD.Checked == true)
        {
            InsertCODShippingDetails();
            fnAddCartDetails();
            fnSendConfirmation();
        }
        Response.Redirect("TransactionSuccessful.aspx");
    }

    public void fnAddCartDetails()
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            Control cl = GridView1.Rows[i].FindControl("txtquantity");
            TextBox txt = (TextBox)cl;
            int BookID = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
            int price = Convert.ToInt32(GridView1.Rows[i].Cells[3].Text);
            int NoofBooks = Convert.ToInt32(txt.Text);
            int TotalBookPrice = price * NoofBooks;

            InsertCartItemDetails(BookID, NoofBooks, TotalBookPrice);
            NoofItems = NoofItems + NoofBooks;
            TotalCost = TotalCost + TotalBookPrice;
            ViewState["NoofItems"] = NoofItems;
            ViewState["TotalCost"] = TotalCost;
        }
        InsertCartDetails();

    }



    protected void RBtnPaypal_CheckedChanged(object sender, EventArgs e)
    {
        DvCreditCardDetails.Visible = true;
        DvShippingDetails.Visible = true;
    }
    protected void RBtnCOD_CheckedChanged(object sender, EventArgs e)
    {
        DvCreditCardDetails.Visible = false;
        DvShippingDetails.Visible = true;
    }

    private void InsertCreditCardShippingDetails()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into CreditCardShippingDetails(TransactionId, TransactionDate, Name, ShippingAddress, City, State, Pincode, ContactNo, CardHolderName, CreditCardNo, CVVNo, ExpiryMonth, ExpiryYear, AddedBy) values (@TransactionId, @TransactionDate, @Name, @ShippingAddress, @City, @State, @Pincode, @ContactNo, @CardHolderName, @CreditCardNo, @CVVNo, @ExpiryMonth, @ExpiryYear, @AddedBy)";
            cmd = new SqlCommand(sql, conn);
            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.Parameters.AddWithValue("@TransactionId", fnGenerateTransID());
            cmd.Parameters.AddWithValue("@TransactionDate", sqlFormattedDate);
            cmd.Parameters.AddWithValue("@Name", TxtName.Text);
            cmd.Parameters.AddWithValue("@ShippingAddress", TxtShippingAddress.Text);
            cmd.Parameters.AddWithValue("@City", TxtCity.Text);
            cmd.Parameters.AddWithValue("@State", TxtState.Text);
            cmd.Parameters.AddWithValue("@Pincode", TxtPincode.Text);
            cmd.Parameters.AddWithValue("@ContactNo", TxtContactNo.Text);
            cmd.Parameters.AddWithValue("@CardHolderName", TxtCardHolderName.Text);
            cmd.Parameters.AddWithValue("@CreditCardNo", TxtCreditCardNo.Text);
            cmd.Parameters.AddWithValue("@CVVNo", TxtCVVNo.Text);
            cmd.Parameters.AddWithValue("@ExpiryMonth", DrpMonth.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@ExpiryYear", DrpYear.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@AddedBy", Session["UserName"]);
            cmd.ExecuteNonQuery();

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

    private void InsertCODShippingDetails()
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
            conn.Open();
            string sql = "Insert into CODShippingDetails(TransactionId, TransactionDate, Name, ShippingAddress, City, State, PinCode, ContactNo, AddedBy) values (@TransactionId, @TransactionDate, @Name, @ShippingAddress, @City, @State, @Pincode, @ContactNo, @AddedBy)";
            cmd = new SqlCommand(sql, conn);
            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.Parameters.AddWithValue("@TransactionId", fnGenerateTransID());
            cmd.Parameters.AddWithValue("@TransactionDate", sqlFormattedDate);
            cmd.Parameters.AddWithValue("@Name", TxtName.Text);
            cmd.Parameters.AddWithValue("@ShippingAddress", TxtShippingAddress.Text);
            cmd.Parameters.AddWithValue("@City", TxtCity.Text);
            cmd.Parameters.AddWithValue("@State", TxtState.Text);
            cmd.Parameters.AddWithValue("@Pincode", TxtPincode.Text);
            cmd.Parameters.AddWithValue("@ContactNo", TxtContactNo.Text);
            cmd.Parameters.AddWithValue("@AddedBy", Session["UserName"]);
            cmd.ExecuteNonQuery();
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

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int BookId = Convert.ToInt32(e.Keys[0].ToString());
        //SqlConnection conn = null;
        //SqlCommand cmd = null;
        try
        {
            DataTable dt = (DataTable)Session["item"];
            dt.Rows.RemoveAt(e.RowIndex);
            GridView1.DataSource = dt;
            Session["item"] = dt;
            GridView1.DataBind();
            fnCalculate();

        }
        catch (Exception)
        {
        }
        finally
        {
            // if (conn.State == ConnectionState.Open)
            //{
            //  conn.Close();
            //}
        }
    }

    protected void BtnCalculateTotal_Click(object sender, EventArgs e)
    {
        fnCalculate();
    }


    public void fnCalculate()
    {
        int noofitems = 0;
        int totalcost = 0;
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            Control cl = GridView1.Rows[i].FindControl("txtquantity");
            TextBox txt = (TextBox)cl;
            int price = Convert.ToInt32(GridView1.Rows[i].Cells[3].Text);
            // int BookID = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
            int NoofBooks = Convert.ToInt32(txt.Text);
            int TotalBookPrice = price * NoofBooks;

            noofitems = noofitems + NoofBooks;
            totalcost = totalcost + TotalBookPrice;
        }
        ViewState["NoofItems"] = noofitems;
        ViewState["TotalCost"] = totalcost;
        LblTotalCost.Text = "Rs." + Convert.ToString(totalcost);
    }

    private void fnSendConfirmation()
    {
        SmtpClient smtpServer = null;
        DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
        try
        {
            String sql = "Select Email FROM Users Where UserName= '" + Session["UserName"] + "'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();
            String str = ds.Tables[0].Rows[0]["Email"].ToString();

            MailMessage mail = new MailMessage();
            string from = "thebookshelf.in@gmail.com";
            string to = str;
            string password = "Qwerty1!";
            string body = "Hi, you transaction has been successful" + "\n" + "Your transaction Id is :" + (fnGenerateTransID()-1);
            string subject = "Your order confirmation";

            if (to.EndsWith("gmail.com") || to.EndsWith("gmail.in") || to.EndsWith("gmail.co.in"))
            {
                smtpServer = new SmtpClient("smtp.gmail.com");
            }
            else if (to.EndsWith("yahoo.com") || to.EndsWith("yahoo.in") || to.EndsWith("yahoo.co.in") || to.EndsWith("ymail.com"))
            {
                smtpServer = new SmtpClient("smtp.mail.yahoo.com");
            }

            mail.From = new MailAddress(from);
            mail.Subject = subject;
            mail.Body = body;

            mail.To.Add(to);
            smtpServer.Port = 587;
            smtpServer.Credentials = new System.Net.NetworkCredential("thebookshelf.in@gmail.com", password);
            smtpServer.EnableSsl = true;
            smtpServer.Send(mail);
        }
        catch (Exception ex)
        {
            Console.Write(ex);
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        TxtCardHolderName.Text = string.Empty;
        TxtCreditCardNo.Text = string.Empty;
        TxtCVVNo.Text = string.Empty;
        TxtName.Text = string.Empty;
        TxtShippingAddress.Text = string.Empty;
        TxtCity.Text = string.Empty;
        TxtState.Text = string.Empty;
        TxtPincode.Text = string.Empty;
        TxtContactNo.Text = string.Empty;
        RBtnPaypal.Checked = false;
        RBtnCOD.Checked = false;
    }
}