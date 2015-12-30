using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    String isslimitstu, stud, facul, stat, isslimitfac;
    string[] limit_chng;
    string temp = null;
    dbconnection db = new dbconnection();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("Student"))
        {
            try
            {
                string cmd = "select issuelimit_stu from changeSetting";
                dr = db.RetriveData(cmd);
                if (dr.Read())
                {
                    isslimitstu = dr[0].ToString();
                   
                }

            }
            catch (Exception eo)
            {
                Label3.Visible = true;
                Label3.Text = "Error==" + eo;

            }
        }
        else
        {
            try
            {
                string cmd = "select issuelimit_fac from changeSetting";
                dr = db.RetriveData(cmd);
                if (dr.Read())
                {
                    isslimitfac = dr[0].ToString();
                  

                }

            }
            catch (Exception eo)
            {
                Label3.Visible = true;
                Label3.Text = "Error==" + eo;

            }



        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("Student"))
        {
            stu.Style.Add("display", "block");
            fac.Style.Add("display", "none");
            Button1.Visible = true;
            Label1.Text = isslimitstu;
            Label3.Visible = false;

        }
        else if (DropDownList1.SelectedValue.Equals("Faculty"))
        {
            fac.Style.Add("display", "block");
            stu.Style.Add("display", "none");
            Button1.Visible = true;
            Label2.Text = isslimitfac;
            Label3.Visible = false;

        }
        else
        {
            fac.Style.Add("display", "none");
            stu.Style.Add("display", "none");
            Button1.Visible = false;
            Label3.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("Student"))
        {
            try
            {
                string new_stu_limit = TextBox1.Text;
                string update = "update changeSetting set issuelimit_stu='" + new_stu_limit + "'  where issuelimit_stu='" + isslimitstu + "'";
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
        else if (DropDownList1.SelectedValue.Equals("Faculty"))
        {
            try
            {
                string new_fac_limit = TextBox2.Text;

                string update = "update changeSetting set issuelimit_fac='" + new_fac_limit + "'  where issuelimit_fac='" + isslimitfac + "'";
                int succ = db.DbTrcn(update);
                if (succ != 0)
                {

                    Label3.Visible = true;


                }
            }
            catch (Exception eo)
            {
                Label3.Visible = true;
                Label3.Text = "Error==" + eo;

            }
        }
    }
}