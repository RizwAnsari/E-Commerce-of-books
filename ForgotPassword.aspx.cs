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
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        sendMail();
    }


    private void sendMail()
    {
        DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
        try
        {
            String sql = "Select UserName,Password FROM Users Where Email = '" + TxtEmail.Text.Trim() + "'";

            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {


                MailMessage mailmsg = new MailMessage();
                //mailmsg is an object of class MailMessage
                string fromMail = "thebookshelf.in@gmail.com";
                string toMail = TxtEmail.Text;
                string body = "Hi,Please check your Login Details:" + "\n" + "Your Username: " + ds.Tables[0].Rows[0]["UserName"] + "\n" + "Your Password: " + ds.Tables[0].Rows[0]["Password"];
                string subject = "Your Password Details";


                //Configuring basic properties
                mailmsg.From = new MailAddress(fromMail);
                mailmsg.To.Add(toMail);
                mailmsg.Body = body;
                mailmsg.Subject = subject;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("thebookshelf.in@gmail.com", "Qwerty1!");
                smtp.EnableSsl = true;
                smtp.Send(mailmsg);
                //Msg = null;
                lblError.Text = "Your Password Details have been sent to your email address.";
                //smtpclient is Object of Class SmtpClient;
                //SmtpClient smtpclient = new SmtpClient();
                //smtpclient.EnableSsl = true;

                //sending MailMessage Object to server
                //smtpclient.Send(mailmsg);

                //lblError.Text = "Your message has been sent successfully";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        TxtEmail.Text = string.Empty;
        TxtUserName.Text = string.Empty;
    }
}