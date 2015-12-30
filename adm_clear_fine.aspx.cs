using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    
    protected void Page_Load(object sender, EventArgs e)
    {
      

      
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

    private void stu_Fine()
    {
        string cmd = "SELECT b.stuid,s.name,b.bid,b.bname,b.dept,b.fine,b.issuedate,b.duedate FROM book b,student s WHERE b.stuid=s.enrollid and b.stuid='100010107001' and b.fine!='0' ";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "StuFine");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    
    protected void stuFine_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        stu_Fine();
    }

    public void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By Student"))
        {
            
            sid.Style.Add("display", "block");
            
            Button1.Text = "Student Fine";
            Button1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            Button1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        stu_Fine();
        fineStu.Style.Add("display", "block");
    }

    void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("click"))
        {
            string cmd = "update book set fine=' 0' where bid='1111' ";
            db.DbTrcn(cmd);
            Label1.Text = "Hooooooooo";
            Label1.Visible = true;

        }

    
    
    }   

    protected void bt_click(object sender, EventArgs e)
    {

        Label1.Text = "H5453";
    }

}