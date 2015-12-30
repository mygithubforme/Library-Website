using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Default3 : System.Web.UI.Page
{
    SqlDataReader dr; 
    int fine = 0;
    double tfine = 0;
    string[] LoanFine;
    string temp = null;
    string duedate = "";
    DateTime dt;
    TimeSpan t;
    string uid = null;
    string name = "",cmd;
    static List<string> stuDetail = new List<string>();
    dbconnection db = new dbconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx?info=0");
        }
        try
        {

           string qury = " select enrollid,name from student where username='" + Session["uname"].ToString() + "'";
            dr = db.RetriveData(qury);
            if (dr.Read())
            {
                uid = dr[0].ToString();
                name = dr[1].ToString();
                ((General)Page.Master).MyText = name;      
            }
            else
            {
              Response.Redirect("login.aspx?info=0");
            }


            cmd = "select general_Loan_Fine from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                temp = dr[0].ToString();
                LoanFine = temp.Split(':');
                fine = Convert.ToInt32(LoanFine[1]);
            }
     
            cmd = "select bid, duedate from book where ret='n' and stuid='"+uid+"' ";
            dr = db.RetriveData(cmd);

   
            while (dr.Read())
            {

                dt = ((DateTime)dr[1]);
                duedate = dt.ToShortDateString();
                if (DateTime.Now > dt && DateTime.Now.ToShortDateString() != dt.ToShortDateString())
                {
                    t = DateTime.Now.Date - dt.Date;
                    tfine = t.TotalDays * fine;
                    stuDetail.Add(dr[0].ToString());
                    stuDetail.Add(tfine.ToString());
                               
                }
            }

            for (int i = 0; i < stuDetail.Count; i += 2)
            {
                cmd = "update book set fine='" + stuDetail[i + 1] + "' where bid='" + stuDetail[i] + "'";
                db.DbTrcn(cmd);
            }
         
            stu_Fine();
        }
        catch (Exception er)
        {
            Label1.Visible = true;
            Label1.Text = "Error:" + er;
        }
    }
    
    private void stu_Fine()
    {
        string cmd = "SELECT bid,bname,dept,fine,issuedate,duedate FROM book WHERE stuid='"+uid+"'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "StuRepo");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
     protected void stuFine_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        stu_Fine();
    }
}