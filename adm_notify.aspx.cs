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



public partial class Default2 : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    String senderAddress = string.Empty;
    String receiveraddress = string.Empty;
    String emailSubject = string.Empty;
    String emailMessageText = string.Empty;
    MailMessage mail = new MailMessage();
    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
    int Count = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            string email = null, pass = null;
            string tempmail = null;
            string[] emailPass = null;
            string cmd = "select emailPass from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                tempmail = dr[0].ToString();
                emailPass = tempmail.Split(':');
                email = emailPass[0];
                pass = emailPass[1];
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "No EmailID exist in database....";

            }


            int Days = Convert.ToInt32(TextBox1.Text);

            DateTime ti = DateTime.Now;
            string format = "MM-dd-yyyy";
            List<string> temp = new List<string>();
            cmd = "select email,name,bname,issuedate,duedate from book,student where book.stuid=student.enrollid AND book.duedate=('" + ti.AddDays(Convert.ToDouble(Days)).ToString(format) + "')";
            dr = db.RetriveData(cmd);



            while (dr.Read())
            {

                Count++;

                senderAddress = email;
                receiveraddress = dr[0].ToString();
                emailSubject = " Book Duedate Reminder";
                emailMessageText = "Dear, " + dr[1].ToString() + " as per the <b>rule</b> and regulation established by A.D.Patel Institute of Technology for library division, owing period for book <strong>" + dr[2].ToString() + "</strong> issued on " + dr[3].ToString() + " expires on " + dr[4].ToString() + ". We request you to submit the book at library. If however you need to continue the usage please extend the lease interval. If by any means or reasons you are not able to submit book on above mentioned date, you will be subjected to rules and regulation and a predefined amount will be charged per day.'<br />'Regards,'<br />'ADIT Library.";
                mail = new MailMessage();
                mail.From = new MailAddress(senderAddress, "LibraryAdmin", System.Text.Encoding.UTF8);
                mail.To.Add(new MailAddress(receiveraddress));
                mail.Subject = emailSubject;
                mail.Body = emailMessageText;

                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(email, pass);
                client.EnableSsl = true;
                client.Send(mail);



            }
            Label1.Visible = true;
            Label1.Text = "\nMail Sent=" + Count;


        }
        catch(Exception err ) 
        {
            Label1.Visible = true;
            Label1.Text = "Error ==" + err;
        }
    }
    
 
}