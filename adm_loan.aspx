<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_loan.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#temp h1:after
{
    margin-left:-70px;
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
    .CompletionListCssClass1
        {
            font-family: calibri;
            font-size: 16px;
            font-weight: normal;
            border: solid 1px #006699;
            line-height: 18px;
            padding: 5px;
            background-color: white;
            margin-left: 0px;
            list-style-type : none;
            margin-right:-20px;
            width:410px !important;
            max-height:150px;
            overflow-y:scroll;
            display:block;
        }
        .CompletionListItemCssClass1
        {
            cursor: pointer;
            color: black;
            display:block;
        }
        .CompletionListHighlightedItemCssClass1
        {
            color: white;
            background-color:#009999;
            cursor: pointer;
            display:block;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div style="font-family: Calibri"> 
    <div  id="temp">
        <h1  >
             Change Of Loan Period and Fine
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
                        <asp:ListItem>By General</asp:ListItem>
                        <asp:ListItem>By Faculty</asp:ListItem>
                         <asp:ListItem>By Student</asp:ListItem>
                    </asp:DropDownList>
                </td>
              
        </tr>
        </table  >
        <div id="student" runat="server" style="display:none;">
        <table cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
            <tr>
                <th>
                      Enter Student ID:  
                </th>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" validationexpression="^[0-9]{12}$"
                        CssClass="validator" ControlToValidate="TextBox2" 
                        ErrorMessage=" Not Valid" SetFocusOnError="True"></asp:RegularExpressionValidator>
                             <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" 
                    TargetControlID="TextBox2"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetStudentID"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
             <tr>
               <th>
                       Enter Book Id:
               </th>
               <td>
                   <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                   <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender4" runat="server" 
                    TargetControlID="TextBox6"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetBookID"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
               </td>
        </tr>
          
            <tr>
               <th>
                        New Loan Period:
               </th>
               <td>
                   <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
               </td>
        </tr>
    
            
        </table>
  
  </div>

   <div id="fac" runat="server" style="display:none;">
        <table  cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
            <tr>
                <th>
                        Enter Faculty ID:
                </th>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                     <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="TextBox4"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetFacultyUserName"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
             <tr>
               <th>
                       Enter Book Id:
               </th>
               <td>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox1"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetBookID"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
               </td>
        </tr>
            <tr>
               <th>
                        New Loan Period:
               </th>
               <td>
                   <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
               </td>
        </tr>
    

        </table>

        </div>

       <div id="general" runat="server" style="display:none;">
          <table  cellspacing="15px" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
             <tr>
               <th>
                        Current Loan Period:
               </th>
               <td>
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
               </td>
              
          </tr>

          <tr>
               <th>
                      Current Fine Cost:  
               </th>
               <td>
                   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
               </td>
              
        </tr>           
              <tr>
               <th>
                        New Loan Period:
               </th>
               <td>
                   <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
               </td>
        </tr>
        <tr>
               <th>
                        New Fine Cost:
               </th>
               <td>
                   <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
               </td>
        </tr>
</table>
</div><br />
  <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Submit" Visible="False" />
  <br />  <br />
    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>

    </div>
</asp:Content>

