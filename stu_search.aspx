<%@ Page Title="Student Search" Language="C#" MasterPageFile="~/stu.master" AutoEventWireup="true" CodeFile="stu_search.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>
    Student Search
</title>
  <style type="text/css">
  .CompletionListCssClass1
        {
            font-family: calibri;
            font-size: 17px;
            font-weight: normal;
            border: solid 1px #006699;
            line-height: 20px;
            padding: 10px;
            background-color: white;
            margin-left: 0px;
            list-style-type : none;
            margin-right:-20px;
            width:410px !important;
            max-height:150px;
            overflow-y:scroll;
            
        }
        .CompletionListItemCssClass1
        {
            cursor: pointer;
            color: black;
        }
        .CompletionListHighlightedItemCssClass1
        {
            color: white;
            background-color:#009999;
            cursor: pointer;
        }
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div style=" opacity:0.9;width:625px; height:495px; position:absolute; top:149px; left:362px; background-image: url('Images/sea.png'); background-size:100% 100%; background-repeat: no-repeat;">

  <div id="before" runat="server" class="input-append" style="position:absolute; top:270px; left:95px"  >

    <table style="width:100%; text-align :center" >
        <tr>
            <td >
                <asp:TextBox ID="txtSearch" placeholder="Search here....!!" runat="server" Width="400px" 
                    class="span2 search-query" Height="24px"></asp:TextBox>

                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="txtSearch"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetBook"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                
                <br/><br/>
                <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="Search" 
                    Font-Names="Oxygen" ForeColor="White" Width="96px" Font-Size="Medium" 
                    onclick="Button1_Click"    />
                </td>
        </tr>
    </table>
    </div>

</div>
</asp:Content>

