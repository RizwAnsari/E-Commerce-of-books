using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Main : System.Web.UI.MasterPage
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
    SqlCommand cmd = null;

    AddToCART atc = new AddToCART();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCart.Text = atc.fnLoadCartCount();
        LBtnLogout.Visible = false;
        if (Session["UserName"] == string.Empty)
        {
            LBtnLogout.Visible = false;
            Label2.Visible = false;
        }
        else if (Session["UserName"] != null)
        {
            Label1.Visible = true;
            Label1.Text = "Welcome  " + Session["UserName"].ToString() + ". ";
            LBtnLogout.Visible = true;
            Label2.Visible = true;
            lblCart.Visible = true;
        }
        else
        {

            LBtnLogout.Visible = false;
            Label2.Visible = false;
        }
        if (!IsPostBack)
        {

        }
        if (Session["UserName"] == null)
        {
            loginPageStatus.Visible = true;
        }
        else
        {
            loginPageStatus.Visible = false;
        }
    }

    public string setCountText
    {
        get { return lblCart.Text; }
        set { lblCart.Text = value; }
    }

    public void setTExt()
    {
        object b = new object();
        EventArgs e = new EventArgs();
        Page_Load(b, e);
    }

    protected void LBtnLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
