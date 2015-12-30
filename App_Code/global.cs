using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for global
/// </summary>
public class global
{
    static int f = 0;
    static double loanperiod = 0;
    static int issuelimitstu = 4;
    static int issuelimitfac = 6;
    static string emailID = null;
    static string emailPass = null;


    public void Change(int fin, double l)
    {
        f = fin;
        loanperiod = l;
    }
    public int Getfine()
    {
        if (f == 0)
            return 10;


        return f;
    }
    public double Getloanperiod()
    {
        if (loanperiod == 0)
            return 7;

        return loanperiod;
    }

    public void ChangeIssueLimitStu(int i)
    {
        issuelimitstu = i;
    }

    public int GetIssueLimitStu()
    {
       return issuelimitstu;
    }

    public void ChangeIssueLimitFac(int i)
    {
        issuelimitfac = i;
    }

    public int GetIssueLimitFac()
    {
        return issuelimitfac;
    }

    public string GetemailID()
    {

        return emailID;
    }

    public string GetemailPass()
    {

        return emailPass;
    }

    public void Change_emailID(String email)
    {
        emailID = email;
       
    }
    public void Change_emaiPass(String Pass)
    {

        emailPass = Pass;
    }
}