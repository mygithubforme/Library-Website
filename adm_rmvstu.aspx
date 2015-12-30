<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_rmvstu.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
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

<div >
<h1>
    Remove Student
</h1>
    <table cellpadding="4px"  style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
            <tr> 
                <td> Enter Student ID: </td>
                <td> 
                    
                     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                      
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                         runat="server" validationexpression="^[0-9]{12}$"
                        CssClass="validator" ControlToValidate="TextBox1" 
                          ErrorMessage="NUmerical only& >12" 
                         SetFocusOnError="True"></asp:RegularExpressionValidator>
                         <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="TextBox1"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetStudentId"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1">
                    </ajaxToolkit:AutoCompleteExtender>

                </td>

            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1"  CssClass="btn" runat="server" Text="Search" onclick="Button1_Click"/>
                </td>
            </tr>
    </table>

    
    <div id="rmvstu" runat="server" style="display:none">
    <h3><u>Student Profile:</u></h3>
    <table cellpadding="5px" style="text-align:left;font-weight: normal; font-size: medium; font-family: Calibri;">
        <tr>
                <th>
                        Student Name: 
                </th>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
                <th>
                        Department:
                </th>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
                <th>
                        Email Address:
                </th>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
                <th>
                        Contact Number:
                </th>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
                <th>
                        Currently Issued book:
                </th>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
    </table>
    <br />
   <b style=" font-size:medium; font-family: Calibri;"> 
    Are you sure you want to remove this student from database..??</b><br /><br />
        <asp:Button ID="Button2" CssClass="btn" runat="server" OnClick="Button2_Click" Text="Yes" />&nbsp &nbsp<asp:Button ID="Button3"
            runat="server" CssClass="btn" Text="No" OnClick="Button3_Click" />
            <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
</div>

</asp:Content>

