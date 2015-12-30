<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_issue.aspx.cs" Inherits="_Default" %>

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
    <div>
    <div  style="font-weight: normal; font-size: large; font-family: Calibri;">
  <h1>
     Issue Report
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
                        <asp:ListItem>By Date</asp:ListItem>
                        <asp:ListItem>By Student Id</asp:ListItem>
                        <asp:ListItem>By Faculty Id</asp:ListItem>
                        <asp:ListItem>By Time interval</asp:ListItem>
                    </asp:DropDownList>
                </td>
        </tr>
  
  </table>

  <div id="date" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                     Select Date:   
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
                    </ajaxToolkit:CalendarExtender> 
                </td>
            </tr>
        </table><br />

        <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Submit" />
  </div>

  <div id="student" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter Student ID:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox2"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetStudentId"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                    
                    </td>
            </tr>
            
        </table><br />
        <asp:Button ID="Button2" CssClass="btn" OnClick="Button2_Click" runat="server" Text="Submit" />

  
  </div>
  
  <div id="fac" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                        Enter Faculty ID:
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="TextBox3"
                    MinimumPrefixLength="1"
                          EnableCaching="true"
                          CompletionSetCount="1"
                          CompletionInterval="1000"
                          ServiceMethod="GetFacultyId"    
                          CompletionListItemCssClass="CompletionListItemCssClass1"
                          CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass1"
                          CompletionListCssClass="CompletionListCssClass1"                
                    >
                </ajaxToolkit:AutoCompleteExtender>
                    
                </td>
            </tr>
        </table><br />
        <asp:Button ID="Button3" CssClass="btn" OnClick="Button3_Click" runat="server" Text="Submit" />
  </div>
  
  <div id="it" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                     Select Date1:   
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBox4">
                    </ajaxToolkit:CalendarExtender>
                     
                     
                </td>
                 <td>
                     Select Date2:   
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TextBox5">
                    </ajaxToolkit:CalendarExtender>
                     
                     
                </td>
            </tr>
        </table><br />

        <asp:Button ID="Button4" CssClass="btn" OnClick="Button4_Click" runat="server" Text="Button" />
  </div>

   <div id="res_date" runat="server" style="display:none;">
  <br />
     Issue Report of Date:  
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
       <br />
         <asp:GridView ID="GridView1" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="5" OnPageIndexChanging="issDate_PageIndexChanging"
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
        
          <asp:boundfield datafield="stuid" headertext="Student ID/"/>
          <asp:boundfield datafield="facusername" headertext="Faculty ID"/>
          <asp:boundfield datafield="bid" headertext="Book ID"/>
          <asp:boundfield datafield="bname" headertext="Book Name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found...
            Try again by entering another date..  

        </emptydatatemplate> 
      </asp:GridView>

    </div>
  
  <div id="res_stu" runat="server" style="display:none;">
  
  <br />
   
      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>:
      <br />
      <asp:GridView ID="GridView2" runat="server"  ForeColor="black" BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
            cellspacing="10"
            AutoGenerateColumns="False" AllowPaging="true" PageSize="3" OnPageIndexChanging="stuName_PageIndexChanging"
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
          <asp:boundfield datafield="bname" headertext="Book Name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
        </columns>
        <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found for this student...
            

        </emptydatatemplate> 
      </asp:GridView>
  
  </div>

  <div id="res_fac" runat="server" style="display:none;">
  
  <br />
  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>:
      <br />
        <asp:GridView ID="GridView3" runat="server"  ForeColor="black" BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
            cellspacing="10"
            AutoGenerateColumns="False"  AllowPaging="true" PageSize="3" OnPageIndexChanging="facName_PageIndexChanging"
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
          <asp:boundfield datafield="bname" headertext="Book Name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
        </columns>
        <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found for this faculty...
             

        </emptydatatemplate> 
      </asp:GridView>
  
  </div>
    
    
  <div id="res_it" runat="server" style="display:none;">
  
  <br />
   
      <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>:
      <br />
      <asp:GridView ID="GridView4" runat="server"  ForeColor="black" BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
            cellspacing="10"
            AutoGenerateColumns="False" AllowPaging="true" PageSize="3" OnPageIndexChanging="issit_PageIndexChanging"
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
        
          <asp:boundfield datafield="stuid" headertext="Student ID/"/>
          <asp:boundfield datafield="facusername" headertext="Faculty ID"/>
          <asp:boundfield datafield="bid" headertext="Book ID"/>
          <asp:boundfield datafield="bname" headertext="Book Name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="issuedate" headertext="Issue Date"/>
          <asp:boundfield datafield="returndate" headertext="Return Date"/>
        
        </columns>
        <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found for the specified period...
            

        </emptydatatemplate> 
      </asp:GridView>
  
  </div>
      
</div>
</div>
</asp:Content>

