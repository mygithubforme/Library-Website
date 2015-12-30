<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_addfac.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<div  style="font-family: Calibri;">
<h1>Sign up For Faculty</h1>
    <table style="text-align:left; font-weight: normal; font-size: large; ">
          <tr>
                <td title="Faculty_signup">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    Name:
                </td>   
                 <td> 
                   <asp:TextBox class="input-small" placeholder="First Name" ID="fnameTxt" 
                         runat="server"></asp:TextBox>
                     <asp:TextBox class="input-small" placeholder="Middle Name" ID="midnameTxt" 
                         runat="server"></asp:TextBox>
                     <asp:TextBox class="input-small" placeholder="Last Name" ID="lastnameTxt" 
                         runat="server"></asp:TextBox>
                </td>
            </tr>
                        
            <tr>
                 
                 <td>
                    Username:
                 </td>
                 <td>   
                     <asp:TextBox  class="input-medium" placeholder="Username" ID="unameTxt" 
                         runat="server"  AutoPostBack="True" OnTextChanged="unameTxt_TextChanged"></asp:TextBox>
                     
                     
                     <asp:Image ID="imgcheck" runat="server" 
                         Visible="False" />
                     <asp:Label ID="lblcheck" runat="server" Text="Label" Visible="False"></asp:Label>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        CssClass="validator" ControlToValidate="unameTxt" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    
                   </td> 

            </tr>
                     
            <tr>
                <td>
                Password:
                </td>
                <td>
                   <asp:TextBox TextMode="Password"  class="input-medium" placeholder="Must be of 6 digits" ID="passTxt" 
                        runat="server"></asp:TextBox>
                   
                    <ajaxToolkit:PasswordStrength ID="passTxt_PasswordStrength" runat="server" 
                        Enabled="True" TargetControlID="passTxt" StrengthIndicatorType="BarIndicator" BarBorderCssClass="Bar" PreferredPasswordLength="6" TextStrengthDescriptions="Weak;Average;Good;Bravo" TextStrengthDescriptionStyles="Weak;Average;Good;Bravo">
                    </ajaxToolkit:PasswordStrength>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="validator"
                        ErrorMessage="Required" ControlToValidate="passTxt"></asp:RequiredFieldValidator>
                     
                </td>
            </tr>

          <tr>
                <td>
                Confirm Password:&nbsp
                </td>
                <td>
                   <asp:TextBox TextMode="Password" class="input-medium" placeholder="Confirm Password" 
                        ID="confpassTxt" runat="server"></asp:TextBox>
                     
                    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="validator"
                        ErrorMessage="Not Matched" ControlToCompare="passTxt" 
                        ControlToValidate="confpassTxt"></asp:CompareValidator>
                     
                </td>
            </tr>
         
           <tr>
                <td>
                Conatct No:
                </td>
                <td>
                   <asp:TextBox  class="input-medium" placeholder="Exclude +91" ID="contactTxt" 
                        runat="server"></asp:TextBox>
                     
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="validator"
                        validationexpression="^[0-9]{10}$" ErrorMessage="Not Valid" 
                        ControlToValidate="contactTxt"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="validator"
                        ControlToValidate="contactTxt" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     
                </td>
            </tr>

           <tr>
                <td>
                Email Id:
                </td>
                <td>
                   <asp:TextBox  class="input-medium" placeholder="Email Id" ID="emailTxt" 
                        runat="server"></asp:TextBox>
                     
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="validator"
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  
                        ErrorMessage="Not Valid" ControlToValidate="emailTxt"></asp:RegularExpressionValidator>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="validator"
                        ControlToValidate="emailTxt" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     
                </td>
            </tr>           

            <tr>
                <td>
                 </td>
                 <td>   
                 <br />

                    <asp:Button class="btn btn-info" ID="studsignupBtn" runat="server" Text="Signup" 
                         Width="93px" Font-Size="Large" onclick="Button1_Click" />
                     <asp:Label ID="Label7" runat="server" Text="Label" 
                         Visible="False"></asp:Label>
                </td>
            </tr>

            
        </table>
      
    
    </div>


</asp:Content>

