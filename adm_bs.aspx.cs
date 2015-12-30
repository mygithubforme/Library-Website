using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class adm_bs : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    SqlConnection con = new SqlConnection();
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetBookName(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from book where bname like @book+'%'", con);
        cmd.Parameters.AddWithValue("@book", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> BookNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!BookNames.Contains(dt.Rows[i][1].ToString()))
                BookNames.Add(dt.Rows[i][1].ToString());
        }
        con.Close();
        return BookNames;
    }
   
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetBookID(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from book where bid like @book+'%'", con);
        cmd.Parameters.AddWithValue("@book", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> BookIds = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!BookIds.Contains(dt.Rows[i][0].ToString()))
                BookIds.Add(dt.Rows[i][0].ToString());
        }
        con.Close();
        return BookIds;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetBookDept(string prefixText)
    {
        DataTable dt3 = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from book where dept like @book+'%'", con);
        cmd.Parameters.AddWithValue("@book", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt3);
        List<string> BookDept = new List<string>();
        for (int i = 0; i < dt3.Rows.Count; i++)
        {
            if (!BookDept.Contains(dt3.Rows[i][2].ToString()))
                BookDept.Add(dt3.Rows[i][2].ToString());
        }
        con.Close();
        return BookDept;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By Name"))
        {
            bid.Style.Add("display", "none");
            bname.Style.Add("display", "block");
            bissue.Style.Add("display", "none");
            bdept.Style.Add("display", "none");
            resbissuedate.Style.Add("display", "none");
            resbid.Style.Add("display", "none");
            resbname.Style.Add("display", "none");
            resbdept.Style.Add("display", "none");
              
        }
        else if (DropDownList1.SelectedValue.Equals("By Bookid"))
        {
            bid.Style.Add("display", "block");
            bname.Style.Add("display", "none");
            bissue.Style.Add("display", "none");
            bdept.Style.Add("display", "none");
            resbissuedate.Style.Add("display", "none");
            resbid.Style.Add("display", "none");
            resbname.Style.Add("display", "none");
            resbdept.Style.Add("display", "none");
       
        }
        else if (DropDownList1.SelectedValue.Equals("By Department"))
        {
            bid.Style.Add("display", "none");
            bname.Style.Add("display", "none");
            bissue.Style.Add("display", "none");
            bdept.Style.Add("display", "block");
            resbissuedate.Style.Add("display", "none");
            resbid.Style.Add("display", "none");
            resbname.Style.Add("display", "none");
            resbdept.Style.Add("display", "none");
       
        }
        else if (DropDownList1.SelectedValue.Equals("By Issue date"))
        {

            bid.Style.Add("display", "none");
            bname.Style.Add("display", "none");
            bissue.Style.Add("display", "block");
            bdept.Style.Add("display", "none");
            resbissuedate.Style.Add("display", "none");
            resbid.Style.Add("display", "none");
            resbname.Style.Add("display", "none");
            resbdept.Style.Add("display", "none");
       
        }
        else
        {
            bid.Style.Add("display", "none");
            bname.Style.Add("display", "none");
            bissue.Style.Add("display", "none");
            bdept.Style.Add("display", "none");
            resbissuedate.Style.Add("display", "none");
            resbid.Style.Add("display", "none");
            resbname.Style.Add("display", "none");
            resbdept.Style.Add("display", "none");  
        }

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        bname_bind();
        resbname.Style.Add("display", "block");
    }

    private void bname_bind()
    {   string cmd="SELECT * from book where bname= '" + TextBox1.Text + "' ";
        SqlDataAdapter adp=db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_BookName");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bid_bind();   
        resbid.Style.Add("display", "block");
    }

    private void bid_bind()
    {
        string cmd = "SELECT * from book where bid= '" + TextBox2.Text + "'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_BookId");
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        bdept_bind();       
        resbdept.Style.Add("display", "block");

    }

    private void bdept_bind()
    {
        string cmd = "SELECT * from book where dept= '" + TextBox3.Text + "' ";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_BookDept");
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        bissuedate_bind();        
        resbissuedate.Style.Add("display","block");
    }

    private void bissuedate_bind()
    {
        string cmd = "SELECT * FROM report WHERE (issuedate = '" + Convert.ToDateTime(TextBox4.Text).ToShortDateString() + "')";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_BookIssue");
        GridView4.DataSource = ds.Tables[0];
        GridView4.DataBind();

    }

    protected void bname_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
        GridView1.PageIndex = e.NewPageIndex;
        bname_bind();
    }

    protected void bid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView2.PageIndex = e.NewPageIndex;
        bid_bind();
    }

    protected void bdept_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView3.PageIndex = e.NewPageIndex;
        bdept_bind();
    }

    protected void bissuedate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView4.PageIndex = e.NewPageIndex;
        bissuedate_bind();
    }
}