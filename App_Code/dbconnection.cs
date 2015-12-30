using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Class1
/// </summary>
public class dbconnection
{
    public SqlConnection sqcon = new SqlConnection();


    public dbconnection()
    {
        sqcon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    public void CheckStatus()
    {
        if (sqcon.State == ConnectionState.Open)
        {
           sqcon.Close();
        }
        sqcon.Open();
    }

    public int DbTrcn(string strQuery)//INSERT DELETE
    {
        int i = 0;
        CheckStatus();
        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.CommandText = strQuery;
        cmdInsert.Connection = sqcon;
        i= cmdInsert.ExecuteNonQuery();
        return i;
    }

    public SqlDataReader RetriveData(string strSelect)//read data
    {
        CheckStatus();
        SqlDataReader dr;
        SqlCommand cmdSelect = new SqlCommand();
        cmdSelect.CommandText = strSelect;
        cmdSelect.Connection = sqcon;
        dr = cmdSelect.ExecuteReader();
        return dr;
    }

    public SqlDataAdapter GridData(string strSelect)//print data in grid
    {
        SqlConnection sqcon = new SqlConnection();
        sqcon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlDataAdapter adp = new SqlDataAdapter(strSelect, sqcon);

        return adp;
    }
}

