using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Default2 : System.Web.UI.Page, IHttpHandler
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetBook(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = null;

        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from book where bname like @book+'%'", con);
        cmd.Parameters.AddWithValue("@book", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> BookNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (!BookNames.Contains(dt.Rows[i][1].ToString()))
                BookNames.Add(dt.Rows[i][1].ToString());
        }
        return BookNames;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        before.Style["position"] = "absolute";
        before.Style["top"] = "190px";
        before.Style["left"] = "95px";
        txtSearch.Style["height"] = "34px";
        txtSearch.Style["width"] = "430px";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from book where bname='" + txtSearch.Text + "' and isissued='n' and reserved='n'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        int count = 0;
        string bname = null;
        int rack = 0;
        int totalbook = 0;
        while (dr.Read())
        {
            count++;
            rack = Convert.ToInt32(dr[3].ToString());
            bname = dr[1].ToString();
            totalbook = Convert.ToInt32(dr[4].ToString());
        }
        if (count == 0)
        {
            Response.Write("<div style='font-family:calibri;color:white;z-index:10;text-align:center;font-size:18px;position:absolute;top:450px;left:450px'> Sorry!! Your search did not match with any available bookname..</div>");
        }
        else
        {
            Response.Write("<table cellpadding='10px' style='font-family:calibri;color:white;z-index:10;text-align:center;border:3px solid gray;position:absolute;top:430px;left:430px'> <tr> <th>Book Name </th><th> Rack No</th><th>Available Book</th><th>Total Book</th></tr><tr><td>" + bname + "</td><td>" + rack + "</td><td>" + count + "</td><td>" + totalbook + "</td></tr></table>");

        }
    }
}