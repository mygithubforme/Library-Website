﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
          db.CheckStatus();
        SqlCommand cmd = new SqlCommand("select name,dept,email,contact from faculty where username=@Name", db.sqcon);
        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
        dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            Label1.Text = dr[0].ToString();
            Label2.Text = dr[1].ToString();
            Label3.Text = dr[2].ToString();
            Label4.Text = dr[3].ToString();
        }
        else
            Label1.Text = "Invalid ID/No such data existing in database";


        string issue = "select bname from book where facusername='" + TextBox1.Text + "'";
        dr = db.RetriveData(issue);

        int i = 0;
        while (dr.Read())
        {
            i++;
            Label5.Text = dr[0].ToString();
        }
        Label5.Text = i + "";
        
        rmvstu.Style.Add("display", "block");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            db.CheckStatus();
            SqlCommand cmd = new SqlCommand("delete from faculty where username=@Name", db.sqcon);
            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Label6.Visible = true;
                Label6.Text = "Successfully deleted...";
            }
            else
                Label6.Text = "Error Occured..Try again...";
        }
        catch (Exception err)
        {
            Label6.Visible = true;
            Label6.Text = "Error=="+err;
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("adm_rmvfac.aspx");
    }
}