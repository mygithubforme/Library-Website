using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    string[] emailPass;
    string temp=null;
    dbconnection db = new dbconnection();
    SqlDataReader dr;
       
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string cmd = "select emailPass from changeSetting";
            dr = db.RetriveData(cmd);
            if (dr.Read())
            {
                temp = dr[0].ToString();
                emailPass = temp.Split(':');
                Label1.Text=emailPass[0];
                Label2.Text = emailPass[1];
            }
            
            
           
        }
        catch (Exception eo)
        {
            Label3.Visible = true;
            Label3.Text = "Error==" + eo;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string newEmailPass = TextBox1.Text + ":" + TextBox2.Text;
            string update = "update changeSetting set emailPass='" + newEmailPass + "'  where emailPass='" + temp + "'";
            int succ = db.DbTrcn(update);
            if (succ != 0)
                Label3.Visible = true;
        }
        catch (Exception eo)
        {
            Label3.Visible = true;
            Label3.Text = "Error==" + eo;

        }
    }
    
    


}