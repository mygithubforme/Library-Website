using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{

    int Get_Loan_Fine = 0;
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    DateTime dt;
    TimeSpan t;
    static double fine;
    string[] LoanFine;
    string temp = null;
    static List<string> stuDetail = new List<string>();
    static List<string> facDetail = new List<string>();
    static int mode = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //getting fine from db    
        string cmd = "select general_Loan_Fine from changeSetting";
        dr = db.RetriveData(cmd);
        if (dr.Read())
        {
            temp = dr[0].ToString();
            LoanFine = temp.Split(':');
            Get_Loan_Fine = Convert.ToInt32(LoanFine[1]);
        }

        // updating fine for student
        cmd = "select bid, book.dept, bname, duedate,email,name from book,student where book.stuid=student.enrollid and book.ret='n' and book.stuid!='0' ";
        dr = db.RetriveData(cmd);

        string duedate = "";
        while (dr.Read())
        {

            dt = ((DateTime)dr[3]);
            duedate = dt.ToShortDateString();
            if (DateTime.Now > dt && DateTime.Now.ToShortDateString() != dt.ToShortDateString())
            {
                t = DateTime.Now.Date - dt.Date;
                fine = t.TotalDays * Get_Loan_Fine;

                stuDetail.Add(dr[0].ToString());
                stuDetail.Add(dr[4].ToString());
                stuDetail.Add(dr[5].ToString());
                stuDetail.Add(dr[2].ToString());
                stuDetail.Add(fine.ToString());

            }
        }
        
        for(int i=0;i<stuDetail.Count;i+=5)
        {
            cmd="update book set fine='"+stuDetail[i+4] +"' where bid='"+stuDetail[i] +"'";
            db.DbTrcn(cmd);
        }




        //updating fine for faculty
        cmd = "select bid, book.dept, bname, duedate,email,name from book,faculty where book.facusername=faculty.username and book.ret='n' and book.facusername!='0' ";
        dr = db.RetriveData(cmd);

        while (dr.Read())
        {

            dt = ((DateTime)dr[3]);
            duedate = dt.ToShortDateString();
            if (DateTime.Now > dt && DateTime.Now.ToShortDateString() != dt.ToShortDateString())
            {
                t = DateTime.Now.Date - dt.Date;
                fine = t.TotalDays * Get_Loan_Fine;

                facDetail.Add(dr[0].ToString());
                facDetail.Add(dr[4].ToString());
                facDetail.Add(dr[5].ToString());
                facDetail.Add(dr[2].ToString());
                facDetail.Add(fine.ToString());

            }
        }

        for (int i = 0; i < facDetail.Count; i += 5)
        {
            cmd = "update book set fine='" + facDetail[i + 4] + "' where bid='" + facDetail[i] + "'";
            db.DbTrcn(cmd);
        }

    }

    public void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text.Equals("By Student"))
        {
            stu_Fine();
            fineStu.Style.Add("display", "block");
            Button1.Visible = true;
            Button1.Text = "Notify Students";
            
        }


        else if (DropDownList1.Text.Equals("By Faculty"))
        {
            mode = 1;
            fac_Fine();
            fineFac.Style.Add("display", "block");
            Button1.Visible = true;
            Button1.Text = "Notify Facultys";
        }
        else
        {
            Label1.Visible = false;
            Button1.Visible = false;
        }
    }

    private void stu_Fine()
    {
        string cmd = "SELECT stuid,name,bid,bname,book.dept,fine,issuedate,duedate FROM book,student WHERE book.stuid=student.enrollid and book.fine!=0 and book.stuid!='0'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "StuFine");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    private void fac_Fine()
    {
        string cmd = "SELECT facusername,name,bid,bname,book.dept,fine,issuedate,duedate FROM book,faculty WHERE book.facusername=faculty.username and book.fine!=0 and book.facusername!='0'";
        SqlDataAdapter adp = db.GridData(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds, "FacFine");
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();

    }
    protected void stuFine_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        stu_Fine();
    }
    protected void facFine_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView2.PageIndex = e.NewPageIndex;
        fac_Fine();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string[] emailPass = null;
        try
        {
            string cmd = "select emailPass from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                temp = dr[0].ToString();
                emailPass = temp.Split(':');
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "No EmailID exist in database....";

            }
        }
        catch (Exception err)
        {
            Label1.Visible = true;
            Label1.Text = "Error in Email sending " + err ;

        }

        string senderAddress = emailPass[0];
        string pwd = emailPass[1];
        string receiveraddress = string.Empty;
        string emailSubject = string.Empty;
        string emailMessageText = string.Empty;
        MailMessage mail = new MailMessage();
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        int Count = 0;
        int id = 0;
        
        if (mode == 0)
        {
            try
            {
                for (id = 0; id < stuDetail.Count; id += 4)
                {
                    Count++;
                    receiveraddress = stuDetail[id];
                    emailSubject = " Book Duedate Reminder";
                    emailMessageText = "Dear, student " + stuDetail[id + 1] + ".You exceed duedate for book " + stuDetail[id + 2] + ". So please pay fine of RS." + stuDetail[id + 3] + "/- as soon as possible  to the librarian otherwise your membership of library is been discarded.Thank You.";
                    mail = new MailMessage();
                    mail.From = new MailAddress(senderAddress, "LibraryAdmin", System.Text.Encoding.UTF8);
                    mail.To.Add(new MailAddress(receiveraddress));
                    mail.Subject = emailSubject;
                    mail.Body = emailMessageText;

                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(senderAddress, pwd);
                    client.EnableSsl = true;
                    client.Send(mail);

                    Label1.Visible = true;
                    Label1.Text = "Message sent successfully to students.";

                }
            }


            catch (Exception email)
            {
                Label1.Visible = true;
                Label1.Text = "Temporary Connection Problem...!! Try after some time..." + email;

            }
            stuDetail.Clear();
        }
        else
        {
            try
            {
                for (id = 0; id < facDetail.Count; id += 4)
                {
                    Count++;
                    receiveraddress = facDetail[id];
                    emailSubject = " Book Duedate Reminder";
                    emailMessageText = "Dear, student " + facDetail[id + 1] + ".You exceed duedate for book " + facDetail[id + 2] + ". So please pay fine of RS." + facDetail[id + 3] + "/- as soon as possible  to the librarian otherwise your membership of library is been discarded.Thank You.";
                    mail = new MailMessage();
                    mail.From = new MailAddress(senderAddress, "LibraryAdmin", System.Text.Encoding.UTF8);
                    mail.To.Add(new MailAddress(receiveraddress));
                    mail.Subject = emailSubject;
                    mail.Body = emailMessageText;

                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(senderAddress, pwd);
                    client.EnableSsl = true;
                    client.Send(mail);
                    Label1.Visible = true;
                    Label1.Text = "Message sent successfully to Faculties.";

                }
            }


            catch (Exception email)
            {
                Label1.Visible = true;
                Label1.Text = "Temporary Connection Problem...!! Try after some time..." + email;

            }
            facDetail.Clear();
        }

    }
}
