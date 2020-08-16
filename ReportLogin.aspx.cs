using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Reporting.WebForms;

public partial class ReportLogin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBookSaleDataBaseConnectionString"].ConnectionString);
    SqlCommand cmd = null;
    SqlDataAdapter adapt = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("LoginDataSet", DisplayLoginReport()));
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("LoginReport.rdlc");
                ReportViewer1.LocalReport.Refresh();
            }
        }
        catch (Exception ex) { }
    }
    public DataTable DisplayLoginReport()
    {
        try
        {
            BookShoppingDataSet.DtLoginDataTable dtLogin = new BookShoppingDataSet.DtLoginDataTable();
            string query = "select UserName,FirstName,LastName,Email,Mobile,City,State,PinCode,Address,DateOfBirth,Gender from Users";
            cmd = new SqlCommand(query, conn);
            adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dtLogin);
            return dtLogin;
        }
        catch (Exception)
        {

            throw;
        }
    }
}