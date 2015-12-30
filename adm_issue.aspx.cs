using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cmd = "select bname,name from book,student";
        dr = db.RetriveData(cmd);
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetStudentId(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from student where enrollid like @sid+'%'", con);
        cmd.Parameters.AddWithValue("@sid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> StudentId = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!StudentId.Contains(dt.Rows[i][1].ToString()))
                StudentId.Add(dt.Rows[i][1].ToString());
        }
        con.Close();
        return StudentId;
    }


    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetFacultyId(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from faculty where username like @fid+'%'", con);
        cmd.Parameters.AddWithValue("@fid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> FacultyId = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!FacultyId.Contains(dt.Rows[i][1].ToString()))
                FacultyId.Add(dt.Rows[i][1].ToString());
        }
        con.Close();
        return FacultyId;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By Date"))
        { 
            date.Style.Add("display","block");
            student.Style.Add("display", "none");
            fac.Style.Add("display", "none");
            res_date.Style.Add("display", "none");
            res_fac.Style.Add("display", "none");
            res_stu.Style.Add("display", "none");
        }
        else if (DropDownList1.SelectedValue.Equals("By Student Id"))
        {
            student.Style.Add("display","block");
            date.Style.Add("display", "none");
            fac.Style.Add("display", "none");
            res_fac.Style.Add("display", "none");
            res_stu.Style.Add("display", "none");
            res_date.Style.Add("display", "none");
        }
        else if (DropDownList1.SelectedValue.Equals("By Faculty Id"))
        {
            fac.Style.Add("display", "block");
            student.Style.Add("display", "none");
            date.Style.Add("display", "none");
            res_date.Style.Add("display", "none");
            res_fac.Style.Add("display", "none");
            res_stu.Style.Add("display", "none");

        }
        else if (DropDownList1.SelectedValue.Equals("By Time interval"))
        {
            fac.Style.Add("display", "none");
            student.Style.Add("display", "none");
            date.Style.Add("display", "none");
            res_date.Style.Add("display", "none");
            res_fac.Style.Add("display", "none");
            res_stu.Style.Add("display", "none");
            it.Style.Add("display", "block");
            res_it.Style.Add("display", "none");

        }
        else
        {
            fac.Style.Add("display", "none");
            student.Style.Add("display", "none");
            date.Style.Add("display", "none");
            res_stu.Style.Add("display", "none");
            res_fac.Style.Add("display", "none");
            res_date.Style.Add("display", "none");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        iss_date();
        res_date.Style.Add("display", "block");
       
    }

    private void iss_date()
    {
        Label1.Text = Convert.ToDateTime(TextBox1.Text).ToShortDateString();
        string cmd = "SELECT  bid, bname, dept, stuid, facusername FROM report WHERE (issuedate = '" + Convert.ToDateTime(TextBox1.Text).ToShortDateString() + "')";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Report_IssDate");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    
    }

    protected void issDate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        iss_date();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        db.CheckStatus();
        SqlCommand cmd = new SqlCommand("select name from student where enrollid=@Name", db.sqcon);
        cmd.Parameters.AddWithValue("@Name", TextBox2.Text);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Label2.Text = "Issue report of "+dr[0].ToString();
        }
        else 
        {
            Label2.Text = "Invalid ID";
        }

        repStuname();
        res_stu.Style.Add("display", "block");
       
    }

    private void repStuname()
    {

        string query = "select bid, bname, dept, issuedate FROM report where (stuid= '" + TextBox2.Text + "')";
        SqlDataAdapter adp = db.GridData(query);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Report_stuName");
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();

    }

    protected void stuName_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView2.PageIndex = e.NewPageIndex;
        repStuname();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        db.CheckStatus();
        SqlCommand cmd = new SqlCommand("select name from faculty where username=@Name", db.sqcon);
        cmd.Parameters.AddWithValue("@Name", TextBox3.Text);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Label3.Text = "Issue report of " + dr[0].ToString();
        }
        else
        {
            Label3.Text = "Invalid ID";
        }

        repFacName();
        res_fac.Style.Add("display", "block");
       
    }
    private void repFacName()
    {
        string query = "select bid, bname, dept, issuedate FROM report where (facusername= '" + TextBox3.Text + "')";
        SqlDataAdapter adp = db.GridData(query);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Report_facName");
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();

    }

    protected void facName_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView3.PageIndex = e.NewPageIndex;
        repFacName();
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        iss_it();
        res_it.Style.Add("display", "block");

    }

    private void iss_it()
    {
        string cmd = "SELECT  bid, bname, dept, stuid, facusername,issuedate,returndate FROM report WHERE issuedate between '" + Convert.ToDateTime(TextBox4.Text).ToShortDateString() + "' and  '" + Convert.ToDateTime(TextBox5.Text).ToShortDateString() + "'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Report_itDate");
        GridView4.DataSource = ds.Tables[0];
        GridView4.DataBind();

    }

    protected void issit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView4.PageIndex = e.NewPageIndex;
        iss_it();
    }
}