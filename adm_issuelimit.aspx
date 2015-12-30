<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_issuelimit.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#temp h1:after
{
    margin-left:-85px;
	content: ' ';
	display: block;
	width: 45%;
	height: 2px;
	margin-top: 10px;
	background: -moz-linear-gradient(left, rgba(147,184,189,0) 0%, rgba(147,184,189,0.8) 20%, rgba(147,184,189,1) 53%, rgba(147,184,189,0.8) 79%, rgba(147,184,189,0) 100%); 
	background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(147,184,189,0)), color-stop(20%,rgba(147,184,189,0.8)), color-stop(53%,rgba(147,184,189,1)), color-stop(79%,rgba(147,184,189,0.8)), color-stop(100%,rgba(147,184,189,0))); 
	background: -webkit-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: -o-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: -ms-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div  style="font-family:Calibri"> 
    <div id="temp">
        <h1 >
            Change Of Book Issue Limit
        </h1>
    </div>
<table cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">

         <tr>
               <th>
                        Select Catagory:
                </th>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" Height="36px" Width="175px">
                        <asp:ListItem>Select here..</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Faculty</asp:ListItem>
                    </asp:DropDownList>
                </td>
              
        </tr>
        </table  >
       <div id="stu" runat="server" style="display:none">
          <table  cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
             <tr>
               <th>
                        Current Issue Limit for student:
               </th>
               <td>
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
               </td>
              
          </tr>
                <tr>
                <th>
                        New Issue limit for student:
               </th>
               <td>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               </td>
                
                </tr>
          </table>
          </div>

          <div id="fac" runat="server" style="display:none" >
          <table  cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
             <tr>
               <th>
                        Current Issue Limit for faculty:
               </th>
               <td>
                   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
               </td>
              
          </tr>
                <tr>
                <th>
                        New Issue limit for faculty:
               </th>
               <td>
                   <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
               </td>
                
                </tr>
          </table>
             
          </div>
           <asp:Button ID="Button1"  CssClass="btn" runat="server" Text="Submit" Visible="False" onclick="Button1_Click"  />
           <asp:Label ID="Label3" runat="server" Text="Max book issue limit successfully changed" Visible="False"></asp:Label>
</div>
</asp:Content>

