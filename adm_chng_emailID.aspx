<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_chng_emailID.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#temp h1:after
{
    margin-left:-100px;
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
    
      <div id="temp" style="font-weight: normal;  font-family: Calibri;text-align:left">

    <h1>
      Change Sender Email ID
  </h1>
  <table  cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
             <tr>
               <th>
                        Current Email ID:
               </th>
               <td>
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
               </td>
                <th>
                        Current Password:
               </th>
                <td>
                   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
               </td>
              
          </tr>
           <tr>
                <th>
                        New Email ID:
               </th>
               <td>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               </td>
                <th>
                        New Email Password:
               </th>
                <td>
                   <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
               </td>
                
                </tr>
          </table>
           <asp:Button ID="Button1"  CssClass="btn" runat="server" Text="Submit" 
              onclick="Button1_Click"  />
           <asp:Label ID="Label3" runat="server" Text="EmailID and Password successfully changed." Visible="False"></asp:Label>
           </div>
</asp:Content>

