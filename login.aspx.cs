using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    dbconnection db = new dbconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            Session.Abandon();
        }
        if (Request.QueryString["info"] != null)
        {
            string message = Request.QueryString["info"].ToString();
            if (message == "0")
            {
                Label7.Visible = true;
                Label7.Text = "You need to login first..";
            }
        } 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (DropDownList1.Text.Equals("Student"))
        {

            string qury = "select username from student where username='" + TextBox1.Text + "' And password='" + TextBox2.Text + "'";

            SqlDataReader dr;
            dr=db.RetriveData(qury);
            if (dr.Read())
            {
                Session["uname"] = TextBox1.Text;
                Response.Redirect("stu_issue.aspx");
            }
            else {
                Label7.Visible = true;
                Label7.Text = "Not Valid Credential.";
            }
        
        }

        else if (DropDownList1.Text.Equals("Faculty"))
        {

            string qury_fac = "select username from faculty where username='" + TextBox1.Text + "' And password='" + TextBox2.Text + "'";
            SqlDataReader dr;
            dr = db.RetriveData(qury_fac);
            if (dr.Read())
            {
                Session["uname"] = TextBox1.Text;
                Response.Redirect("fac_issue.aspx");
            }
            else
            {
                Label7.Visible = true;
                Label7.Text = "Not Valid Credential.";
            }
        }

        else
        {
            string qury_adm = "select username from admin where username='" + TextBox1.Text + "' And password='" + TextBox2.Text + "'";
            SqlDataReader dr;
            dr = db.RetriveData(qury_adm);
            if (dr.Read())
            {
                Session["uname"] = TextBox1.Text;
                Response.Redirect("admDefault.aspx"); 

            }
            else
            {
                Label7.Visible = true;
                Label7.Text = "Not Valid Credential.";
            }
        
        }
    }
}