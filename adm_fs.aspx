﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_fs.aspx.cs" Inherits="adm_fs" %>

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
    <div  style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
  <h1>
       Faculty Search
  </h1>

  <table>
        <tr>
                <td>
                        Select Catagory:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="36px" Width="175px" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged"
                        AutoPostBack="True">
                        <asp:ListItem>Select here..</asp:ListItem>
                        <asp:ListItem>By name</asp:ListItem>
                        <asp:ListItem>By username</asp:ListItem>
                        <asp:ListItem>By Department</asp:ListItem>
                    </asp:DropDownList>
                </td>
        </tr>
  
  </table>

  <div id="facname" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter faculty name:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox1"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetFacultyName"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
            
        </table><br />
        

        <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Button1" />
  </div>

  <div id="facuname" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter faculty username:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="TextBox2"
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
            
        </table><br />
        <asp:Button ID="Button2" CssClass="btn" OnClick="Button2_Click" runat="server" Text="Button2" />

  
  </div>
  
  <div id="facdep" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                        Enter department:
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                       <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" 
                    TargetControlID="TextBox3"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetFacultyDept"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
        </table><br />
        <asp:Button ID="Button3" CssClass="btn" OnClick="Button3_Click" runat="server" Text="Button3" />
  </div>

   <div id="resfname" runat="server" style="display:none;">
  <br />
        <asp:GridView ID="GridView1" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False"
         AllowPaging="true" PageSize="3" OnPageIndexChanging="fname_PageIndexChanging"
            >
             <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="3"/>

        <pagerstyle backcolor="LightBlue"
         
          verticalalign="Bottom"
          horizontalalign="Center"/>
        <HeaderStyle BackColor="lightblue" ForeColor="AliceBlue" Font-Size="Larger" Font-Bold="true"></HeaderStyle>
        <columns>
           <asp:TemplateField HeaderText="Sr.no">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>
          
          <asp:boundfield datafield="name" headertext="Faculty name"/>
          <asp:boundfield datafield="username" headertext="username"/>
          <asp:boundfield datafield="email" headertext="Email"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found...
            Try again by entering another id..  

        </emptydatatemplate> 
      </asp:GridView>
    </div>
  
  <div id="resfuname" runat="server" style="display:none;">
  
  <br />
   
      <asp:GridView ID="GridView2" runat="server"  ForeColor="black" BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
            cellspacing="10"
            AutoGenerateColumns="False" 
         AllowPaging="true" PageSize="3" OnPageIndexChanging="funame_PageIndexChanging"
            >
             <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="3"/>

        <pagerstyle backcolor="LightBlue"
         
          verticalalign="Bottom"
          horizontalalign="Center"/> 
        <HeaderStyle BackColor="lightblue" ForeColor="AliceBlue" Font-Size="Larger" Font-Bold="true"></HeaderStyle>
        <columns>
           <asp:TemplateField HeaderText="Sr.no">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>

           <asp:boundfield datafield="name" headertext="Faculty name"/>
          <asp:boundfield datafield="username" headertext="username"/>
          <asp:boundfield datafield="email" headertext="Email"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          
        </columns>
        <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found for this student...
            

        </emptydatatemplate> 
      </asp:GridView>
  
  </div>

  <div id="resfdept" runat="server" style="display:none;">
  
  <br />
        <asp:GridView ID="GridView3" runat="server"  ForeColor="black" BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
            cellspacing="10"
            AutoGenerateColumns="False" 
         AllowPaging="true" PageSize="3" OnPageIndexChanging="fdept_PageIndexChanging"
            >
             <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="3"/>

        <pagerstyle backcolor="LightBlue"
         
          verticalalign="Bottom"
          horizontalalign="Center"/>
        <HeaderStyle BackColor="lightblue" ForeColor="AliceBlue" Font-Size="Larger" Font-Bold="true"></HeaderStyle>
        <columns>
                   <asp:TemplateField HeaderText="Sr.no">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>

          <asp:boundfield datafield="name" headertext="Faculty name"/>
          <asp:boundfield datafield="username" headertext="username"/>
          <asp:boundfield datafield="email" headertext="Email"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          
        </columns>
        <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found for this name...
             

        </emptydatatemplate> 
      </asp:GridView>
  
  </div>
        
</div>
</asp:Content>

