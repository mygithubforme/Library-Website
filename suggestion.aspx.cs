using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Configuration;

public partial class Def_suggestion : System.Web.UI.Page
{
    
    
    SqlDataReader dr;
    dbconnection con = new dbconnection();
    SqlConnection scon;
    
     long id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx?info=0");
        }

       
        string name = "";
        string qury = " select enrollid,name from student where username='" + Session["uname"].ToString() + "'";
        dr = con.RetriveData(qury);
        if (dr.Read())
        {
            id = Convert.ToInt64(dr[0].ToString());
            name = dr[1].ToString();
        }
        else
        {
            Response.Redirect("suggestion.aspx?info=0");
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!(TextBox2.Text).Equals(""))
        {
            String str = "INSERT INTO suggestions(id,sug) Values('" + id + "' , '" + TextBox2.Text + "')";
            int res = con.DbTrcn(str);
        }
        else {

            Label2.Text = "please enter a suggestion";
            Label2.Visible = true;
        }
       
        

    }
}