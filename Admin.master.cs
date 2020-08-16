using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserName"] != string.Empty)
        {
            Label1.Visible = true;
            Label1.Text = "Welcome  " + Session["UserName"].ToString() + ". ";
            LBtnLogout.Visible = true;
        }
        else
        {
            LBtnLogout.Visible = false;
        }
    }
    protected void LBtnLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session.Abandon();
        Response.Redirect("Home.aspx");
    }
}
