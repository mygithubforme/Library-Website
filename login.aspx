<%@ Page Title="Login" Language="C#" MasterPageFile="~/General.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title> 
    LogIn
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" opacity:0.9;  width:625px; height:495px; position:absolute;  top:149px; left:362px; background-image: url('Images/login.png'); background-size:100% 100%; background-repeat: no-repeat;">

<div style="color: #FFFFFF; font-weight: normal; font-size: large; font-family: Calibri; display: block;margin:0 auto; position:absolute; top:45%; left:20%">
 
      
        <table style="width:100%;text-align :left; margin:auto;">
          <tr>
                <td>
                    Username:&nbsp&nbsp
                </td>   
                 <td> 
                   <asp:TextBox class="input-large" placeholder="Username" ID="TextBox1" runat="server">
                    </asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validator"
                         ControlToValidate="TextBox1" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
         
            
            <tr>
                 <td>
                    Password:
                 </td>
                 <td>   
                    <asp:TextBox  class="input-large"  placeholder="Password" ID="TextBox2" runat="server" TextMode="Password">
                    </asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validator"
                         ControlToValidate="TextBox2" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>


            
            <tr>
                <td>
                catagory:
                </td>
                <td>
                    <asp:DropDownList  ID="DropDownList1" runat="server" Width=225px>
                         <asp:ListItem>Student</asp:ListItem>
                         <asp:ListItem>Faculty</asp:ListItem>
                         <asp:ListItem>Admin</asp:ListItem>
                     </asp:DropDownList>
                     
                </td>
            </tr>
         
            <tr>
                <td>
                        <br />
                </td>
            </tr>            

            <tr>
                <td>
                 </td>
                 <td>   
                    <asp:Button class="btn btn-info" ID="Button1" runat="server" Text="Login" 
                         Width="93px" Font-Size="Large" onclick="Button1_Click" />
                     <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>

            
        </table>
      
    
    </div>

</div>

</asp:Content>

