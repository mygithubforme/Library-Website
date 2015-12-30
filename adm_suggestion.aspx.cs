using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;

public partial class adm_suggestion : System.Web.UI.Page
{
    SqlDataReader dr1;
    dbconnection db = new dbconnection();
    int count=0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        sug_call();

    }

    private void sug_call()
    {
        string qury = "select * from suggestions";
        SqlDataAdapter adp = db.GridData(qury);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Suggestion");
        
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();   
  
     }

    protected void sugg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        sug_call();
    }


     //private DataTable GetDataTable()
     //{
     //     //create table
     //     DataTable dt = new DataTable("suggestions");
     //     dt.Columns.Add("sug", Type.GetType("System.String"));
     //     dt.Columns.Add("id", Type.GetType("System.String"));

     //     //fill rows
     //     DataRow dr;
     //     while (dr1.Read())
     //     {
     //        // make every other one different
     //           dr = dt.NewRow();
     //           dr["sug"] = dr1.GetValue(0);
     //           dr["id"] = dr1.GetValue(1);
     //           dt.Rows.Add(dr);
            
     //     }

     //     return dt;
     //  }
 
}
