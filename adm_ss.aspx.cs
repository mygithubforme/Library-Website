using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class adm_ss : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetStudentName(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from student where name like @sname+'%'", con);
        cmd.Parameters.AddWithValue("@sname", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> StudentNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!StudentNames.Contains(dt.Rows[i][0].ToString()))
                StudentNames.Add(dt.Rows[i][0].ToString());
        }
        con.Close();
        return StudentNames;
    }
   
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetStudentUserName(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from student where username like @suname+'%'", con);
        cmd.Parameters.AddWithValue("@suname", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> Studentuname = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!Studentuname.Contains(dt.Rows[i][2].ToString()))
                Studentuname.Add(dt.Rows[i][2].ToString());
        }
        con.Close();
        return Studentuname;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetStudentId(string prefixText)
    {
        DataTable dt3 = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from student where enrollid like @sid+'%'", con);
        cmd.Parameters.AddWithValue("@sid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt3);
        List<string> StudentId = new List<string>();
        for (int i = 0; i < dt3.Rows.Count; i++)
        {
            if (!StudentId.Contains(dt3.Rows[i][1].ToString()))
                StudentId.Add(dt3.Rows[i][1].ToString());
        }
        con.Close();
        return StudentId;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By id"))
        {
            sid.Style.Add("display", "block");
            sname.Style.Add("display", "none");
            suname.Style.Add("display", "none");
            res_sid.Style.Add("display", "none");
            res_sname.Style.Add("display", "none");
            res_suname.Style.Add("display", "none");
        }
        else if (DropDownList1.SelectedValue.Equals("By username"))
        {
            sid.Style.Add("display", "none");
            sname.Style.Add("display", "none");
            suname.Style.Add("display", "block");
            res_sid.Style.Add("display", "none");
            res_sname.Style.Add("display", "none");
            res_suname.Style.Add("display", "none");
        
        }
        else if (DropDownList1.SelectedValue.Equals("By Name"))
        {
            sid.Style.Add("display", "none");
            sname.Style.Add("display", "block");
            suname.Style.Add("display", "none");
            res_sid.Style.Add("display", "none");
            res_sname.Style.Add("display", "none");
            res_suname.Style.Add("display", "none");
        
        }
        else
        {
            sid.Style.Add("display", "none");
            sname.Style.Add("display", "none");
            suname.Style.Add("display", "none");
            res_sid.Style.Add("display", "none");
            res_sname.Style.Add("display", "none");
            res_suname.Style.Add("display", "none");
        
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        stuid_bind();
        res_sid.Style.Add("display", "block");
    }

    private void stuid_bind()
    {
        string cmd = "SELECT * from student where enrollid= '" + TextBox1.Text + "' ";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_StuId");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }

    protected void sid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        stuid_bind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        stuUName_bind();
        res_suname.Style.Add("display", "block");
     
    }

    private void stuUName_bind()
    {
        string cmd = "select * FROM student where username= '" + TextBox2.Text + "'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_StuUName");
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();   
    }

    protected void suname_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        stuUName_bind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        stuName_bind();
        res_sname.Style.Add("display", "block");
    }

    private void stuName_bind()
    {
        string cmd = "select * FROM student where name= '" + TextBox3.Text + "'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_StuName");
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();
    }

    protected void sname_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        stuName_bind();
    }
}