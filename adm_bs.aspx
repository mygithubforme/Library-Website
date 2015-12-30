<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_bs.aspx.cs" Inherits="adm_bs" %>

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
       Book Search
  </h1>

  <table >
        <tr>
                <td>
                        Select Catagory:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="36px" Width="175px" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged"
                        AutoPostBack="True">
                        <asp:ListItem>Select here..</asp:ListItem>
                        <asp:ListItem>By Name</asp:ListItem>
                        <asp:ListItem>By Bookid</asp:ListItem>
                        <asp:ListItem>By Department</asp:ListItem>
                        <asp:ListItem>By Issue date</asp:ListItem>
                    </asp:DropDownList>
                </td>
        </tr>
  
  </table>

  <div id="bname"  runat="server" style="display:none;">
        <div>
            <tr>
                <td>
                      Enter book name:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    
                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox1"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetBookName"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
            
        <br />
        </div>

        <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Search" />
  </div>

  <div id="bid" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter bookid:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                    
                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="TextBox2"
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
            
        </table><br />
        <asp:Button ID="Button2" CssClass="btn" OnClick="Button2_Click" runat="server" Text="Search" />

  
  </div>
  
  <div id="bdept" runat="server" style="display:none;">
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
                          ServiceMethod="GetBookDept"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
        </table><br />
        <asp:Button ID="Button3" CssClass="btn" OnClick="Button3_Click" runat="server" Text="Search" />
  </div>

  <div id="bissue" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                        Enter issue date:
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox4">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
        </table><br />
        <asp:Button ID="Button4" CssClass="btn" OnClick="Button4_Click" runat="server" Text="Search" />
  </div>

   <div id="resbname" runat="server" style="display:none;">
  <br />

         <asp:GridView ID="GridView1" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="8" runat="server" 
        cellspacing="7" AutoGenerateColumns="false" AllowPaging="true" PageSize="3" OnPageIndexChanging="bname_PageIndexChanging"
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
          <asp:boundfield datafield="bid" headertext="Book ID/"/>
          <asp:boundfield datafield="bname" headertext="Book name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="stuid" headertext="with student"/>
          <asp:boundfield datafield="isissued" headertext="issued?"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
          <asp:boundfield datafield="facusername" headertext="with faculty"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found..  

        </emptydatatemplate> 
      </asp:GridView>
    </div>
  
  <div id="resbid" runat="server" style="display:none;">
  <br />

         <asp:GridView ID="GridView2" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="8" runat="server" 
        cellspacing="7" AutoGenerateColumns="false" AllowPaging="true" PageSize="3" OnPageIndexChanging="bid_PageIndexChanging"
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
          <asp:boundfield datafield="bid" headertext="Book ID/"/>
          <asp:boundfield datafield="bname" headertext="Book name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="stuid" headertext="with student"/>
          <asp:boundfield datafield="isissued" headertext="issued?"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
          <asp:boundfield datafield="facusername" headertext="with faculty"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found..  

        </emptydatatemplate> 
      </asp:GridView>
    </div>

    <div id="resbdept" runat="server" style="display:none;">
  <br />

         <asp:GridView ID="GridView3" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="8" runat="server" 
        cellspacing="7" AutoGenerateColumns="false" AllowPaging="true" PageSize="3" OnPageIndexChanging="bdept_PageIndexChanging"
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
          <asp:boundfield datafield="bid" headertext="Book ID/"/>
          <asp:boundfield datafield="bname" headertext="Book name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="stuid" headertext="with student"/>
          <asp:boundfield datafield="isissued" headertext="issued?"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
          <asp:boundfield datafield="facusername" headertext="with faculty"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found..  

        </emptydatatemplate> 
      </asp:GridView>
    </div>

  <div id="resbissuedate" runat="server" style="display:none;">
  <br />
         <asp:GridView ID="GridView4" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False" PageSize="3" AllowPaging="true" OnPageIndexChanging="bissuedate_PageIndexChanging"
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

          <asp:boundfield datafield="bid" headertext="Book ID"/>
          <asp:boundfield datafield="bname" headertext="Book name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="stuid" headertext="with student/"/>
          <asp:boundfield datafield="facusername" headertext="with faculty"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found...
            Try again by entering another date..  

        </emptydatatemplate> 
      </asp:GridView>
    </div>
        
</div>
</asp:Content>

