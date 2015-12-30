using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class adm_fs : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetFacultyName(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from faculty where name like @fname+'%'", con);
        cmd.Parameters.AddWithValue("@fname", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> FacultyNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!FacultyNames.Contains(dt.Rows[i][0].ToString()))
                FacultyNames.Add(dt.Rows[i][0].ToString());
        }
        con.Close();
        return FacultyNames;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetFacultyUserName(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from faculty where username like @funame+'%'", con);
        cmd.Parameters.AddWithValue("@funame", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> Facultyuname = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!Facultyuname.Contains(dt.Rows[i][1].ToString()))
                Facultyuname.Add(dt.Rows[i][1].ToString());
        }
        con.Close();
        return Facultyuname;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetFacultyDept(string prefixText)
    {
        DataTable dt3 = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from faculty where dept like @fdept+'%'", con);
        cmd.Parameters.AddWithValue("@fdept", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt3);
        List<string> Facultydept = new List<string>();
        for (int i = 0; i < dt3.Rows.Count; i++)
        {
            if (!Facultydept.Contains(dt3.Rows[i][5].ToString()))
               Facultydept.Add(dt3.Rows[i][5].ToString());
        }
        con.Close();
        return Facultydept;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By name"))
        {
           facname.Style.Add("display", "block");
            facuname.Style.Add("display", "none");
            facdep.Style.Add("display", "none");
            resfname.Style.Add("display", "none");
            resfuname.Style.Add("display", "none");
            resfdept.Style.Add("display", "none");
        }
        else if (DropDownList1.SelectedValue.Equals("By username"))
        {
            facname.Style.Add("display", "none");
            facuname.Style.Add("display", "block");
            facdep.Style.Add("display", "none");
            resfname.Style.Add("display", "none");
            resfuname.Style.Add("display", "none");
            resfdept.Style.Add("display", "none");
        }
        else if (DropDownList1.SelectedValue.Equals("By Department"))
        {
            facname.Style.Add("display", "none");
            facuname.Style.Add("display", "none");
            facdep.Style.Add("display", "block");
            resfname.Style.Add("display", "none");
            resfuname.Style.Add("display", "none");
            resfdept.Style.Add("display", "none");
        }
        else
        {
            facname.Style.Add("display", "none");
            facuname.Style.Add("display", "none");
            facdep.Style.Add("display", "none");
            resfname.Style.Add("display", "none");
            resfuname.Style.Add("display", "none");
            resfdept.Style.Add("display", "none"); ;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        fac_name_bind();
        
        facname.Style.Add("display", "none");
        facuname.Style.Add("display", "none");
        facdep.Style.Add("display", "none");
        resfname.Style.Add("display", "block");

    }
    private void fac_name_bind()
    {
        string cmd = "SELECT * from faculty where name= '" + TextBox1.Text + "' ";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_FacName");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    protected void fname_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
       fac_name_bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

            fac_uname_bind();
            facname.Style.Add("display", "none");
            facuname.Style.Add("display", "none");
            facdep.Style.Add("display", "none");
            resfuname.Style.Add("display", "block");
        
    }

    private void fac_uname_bind()
    {
        string query = "select * FROM faculty where username= '" + TextBox2.Text + "'";
        SqlDataAdapter adp = db.GridData(query);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_FacUserName");
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();    
    }

    protected void funame_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView2.PageIndex = e.NewPageIndex;
        fac_uname_bind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        fac_dept_bind();

        facname.Style.Add("display", "none");
        facuname.Style.Add("display", "none");
        facdep.Style.Add("display", "none");
        resfdept.Style.Add("display", "block");
    }

    private void fac_dept_bind()
    {
        string query = "select * FROM faculty where dept= '" + TextBox3.Text + "'";
        SqlDataAdapter adp = db.GridData(query);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Searh_FacDept");
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();

    }
    protected void fdept_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView3.PageIndex = e.NewPageIndex;
        fac_dept_bind();
    }
}