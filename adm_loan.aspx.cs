using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    int fine = 0;
    Double lp;
    SqlDataReader dr;
    dbconnection db = new dbconnection();

    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string temp = null;
    string[] LoanFine;
    string format = "MM/dd/yyyy";

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            string cmd = "select general_Loan_Fine from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                temp = dr[0].ToString();
                LoanFine = temp.Split(':');
                Label1.Text = LoanFine[0];
                Label2.Text = LoanFine[1];
            }


        }
        catch (Exception eo)
        {
            Label3.Visible = true;
            Label3.Text = "Error==" + eo;

        }



    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DropDownList1.SelectedValue.Equals("By Student"))
        {
            Label3.Visible = false;
            student.Style.Add("display", "block");
            fac.Style.Add("display", "none");
            general.Style.Add("display", "none");
            Button1.Visible = true;

        }
        else if (DropDownList1.SelectedValue.Equals("By Faculty"))
        {
            Label3.Visible = false;
            fac.Style.Add("display", "block");
            student.Style.Add("display", "none");
            general.Style.Add("display", "none");
            Button1.Visible = true;

        }
        else if (DropDownList1.SelectedValue.Equals("By General"))
        {
            Label3.Visible = false;
            general.Style.Add("display", "block");
            fac.Style.Add("display", "none");
            student.Style.Add("display", "none");
            Button1.Visible = true;

        }
        else {

            general.Style.Add("display", "none");
            fac.Style.Add("display", "none");
            student.Style.Add("display", "none");
            Button1.Visible = false;
            Label3.Visible = false;
        }

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        int succ=0;
        
        if (DropDownList1.Text.Equals("By Student"))
        {
            string update = "update book set loan_period='" + TextBox3.Text + "'  where stuid='" + TextBox2.Text + "' and bid='" + TextBox6.Text + "'";
             succ = db.DbTrcn(update);

            
            
            if (succ != 0)
            {
                String str = "UPDATE book SET duedate='" + newduedateS() + "' where stuid='" + TextBox2.Text + "' and bid='"+TextBox6.Text+"'";
                db.DbTrcn(str);
                Label3.Text = "Return Date for " + TextBox2.Text + " is changed to " + newduedateS() + ".";
                Label3.Visible = true;

            }

            else {
                Label3.Visible = true;
                Label3.Text = "Sorry..!! Invalid combination of studentid and bookid...";
            }


        }
        else if (DropDownList1.Text.Equals("By Faculty"))
        {
            string update = "update book set loan_period='" + TextBox5.Text + "'  where facusername='" + TextBox4.Text + "' and bid='"+TextBox1.Text+"'";
            succ = db.DbTrcn(update);

            if (succ != 0)
            {
                String str = "UPDATE book SET duedate='" + newduedateF() + "' where facusername='" + TextBox4.Text + "' and bid='"+TextBox1.Text+"'";
                db.DbTrcn(str);
                Label3.Text = "Return Date for " + TextBox4.Text + " is changed to " + newduedateF() + ".";
                Label3.Visible = true;
            }
            else
            {
                Label3.Text = "Sorry..!! Invalid combination of studentid and bookid....";
                Label3.Visible = true;
            }
        }
        else
        {

             string cmd = "select general_Loan_Fine from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                temp = dr[0].ToString();
                LoanFine = temp.Split(':');

                if (TextBox7.Text == "")
                {
                    TextBox7.Text = LoanFine[0];

                }
                if (TextBox8.Text == "")
                {
                    TextBox8.Text = LoanFine[1];
                }
            }

            string gen_Loan_Fine = TextBox7.Text + ":" + TextBox8.Text;
            string update = "update changeSetting set general_Loan_Fine='" + gen_Loan_Fine + "'  where general_Loan_Fine='" + temp + "'";
            succ= db.DbTrcn(update);
            if (succ != 0)
            {
                Label3.Text = "Genearal Loan Period/Fine changed";
                Label3.Visible = true;
            }
            else {
                Label3.Text = "Error in changing Loan Period/Fine";
                Label3.Visible = true;
            }
        }
      }


    private string newduedateS()
    {

        scon.Close();
        SqlCommand newdd = new SqlCommand();
        newdd.CommandText = "select issuedate from book where stuid='" + TextBox2.Text + "'";
        newdd.Connection = scon;
        scon.Open();

        return ((DateTime)newdd.ExecuteScalar()).AddDays(Convert.ToDouble(TextBox3.Text)).ToString(format);

    }

    private string newduedateF()
    {
        scon.Close();
        SqlCommand newd = new SqlCommand();
        newd.CommandText = "select issuedate from book where facusername='" + TextBox4.Text + "'";
        newd.Connection = scon;
        scon.Open();

        return ((DateTime)newd.ExecuteScalar()).AddDays(Convert.ToDouble(TextBox5.Text)).ToString(format);
       
    }
}