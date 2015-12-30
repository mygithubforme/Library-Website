using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By Date"))
        {
            date.Style.Add("display", "block");
            res_date.Style.Add("display", "none");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = Convert.ToDateTime(TextBox1.Text).ToShortDateString();
        retDate_bind();
        res_date.Style.Add("display", "block");
    }

    private void retDate_bind()
    {
        string cmd = "SELECT  bid, bname, dept, stuid, facusername FROM report WHERE (returndate = '" + Convert.ToDateTime(TextBox1.Text).ToShortDateString() + "')";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Report_RetDate");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
       
    }
    protected void retDate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        retDate_bind();
    }
}