<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_notify.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div  style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">

    <h1>
        Mail Notification
  </h1>
   <table>
        <tr>
            <td>
                Enter Period for Notification:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
   </table>
<br />
   <asp:Button ID="Button1" runat="server" CssClass="btn" onclick="Button1_Click" Text="Send" />

           <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        
    

    </div>
  
</asp:Content>

