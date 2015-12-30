using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{

    dbconnection db = new dbconnection();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        db.DbTrcn("insert into student(name,enrollid,username,password,contact,email) values('" + fnameTxt.Text + " " + midnameTxt.Text + " " + lastnameTxt.Text + "','" + enrollTxt.Text + "','" + unameTxt.Text + "','" + passTxt.Text + "','" + contactTxt.Text + "','" + emailTxt.Text + "')");
        Label7.Text = "updated successfully";
        Label7.Visible = true;
    }

    protected void unameTxt_TextChanged(Object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(unameTxt.Text))
        {
            db.CheckStatus();
            SqlCommand cmd = new SqlCommand("select * from student where username=@Name", db.sqcon);
            cmd.Parameters.AddWithValue("@Name", unameTxt.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                imgcheck.Visible = true;
                lblcheck.Visible = true;
                imgcheck.ImageUrl = "~/Images/taken.gif";
                lblcheck.Text = "UserName Taken!!";
            }
            else
            {
                imgcheck.Visible = true;
                lblcheck.Visible = true;
                imgcheck.ImageUrl = "~/Images/available.gif";
                lblcheck.Text = "Available";
            }
            }
        }
    }
