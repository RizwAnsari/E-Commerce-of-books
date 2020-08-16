using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AddToCART
/// </summary>
public class AddToCART
{
    public AddToCART()
    {

    }

    public void AddToCart(int id, string name, int price)
    {
        DataTable dt = new DataTable();
        if (System.Web.HttpContext.Current.Session["item"] == null)
        {
            dt.Columns.Add("BookId");
            dt.Columns.Add("Title");
            dt.Columns.Add("Price");
        }
        else
        {
            dt = (DataTable)System.Web.HttpContext.Current.Session["item"];
        }

        DataRow dr = dt.NewRow();
        dr["BookId"] = id;
        dr["Title"] = name;
        dr["Price"] = price;
        dt.Rows.Add(dr);
        System.Web.HttpContext.Current.Session["item"] = dt;
    }

    public string fnLoadCartCount()
    {
        int count = 0;
        System.Data.DataTable dtTempcount = new System.Data.DataTable();
        dtTempcount = (System.Data.DataTable)System.Web.HttpContext.Current.Session["item"];
        if (dtTempcount != null)
        {
            count = dtTempcount.Rows.Count;
        }
        return Convert.ToString(count);
    }

}