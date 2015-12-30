<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_clear_fine.aspx.cs" Inherits="_Default" %>

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
       Clear Fine
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
                        <asp:ListItem>By Student</asp:ListItem>
                        <asp:ListItem>By Faculty</asp:ListItem>
                       
                    </asp:DropDownList>
                </td>
        </tr>
  
  </table>

  <div id="sid" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter Student ID:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                          <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" 
                    TargetControlID="TextBox1"
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
            
        </table><br />
        
        <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Search" />
  </div>

   <div id="facusername" runat="server" style="display:none;">
        <table>
            <tr>
                <td>
                      Enter Faculty Username:  
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                          <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
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
            
        </table><br />
        
        <asp:Button ID="Button2" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Search" />
  </div>

    <div id="fineStu" runat="server" style="display:none">
    
         <asp:GridView ID="GridView1" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="5" OnPageIndexChanging="stuFine_PageIndexChanging"
            >
             <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="3"/>

        <pagerstyle backcolor="LightBlue"
         
          verticalalign="Bottom"
          horizontalalign="Center"/>
        <HeaderStyle BackColor="lightblue" ForeColor="AliceBlue" Font-Size="Larger" Font-Bold="true"></HeaderStyle>
        <columns>
       <asp:TemplateField HeaderText="" >
         <ItemTemplate>
            
          
       <asp:LinkButton runat="server" ID="bt" OnClick="bt_click">Pay</asp:LinkButton>
          </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Sr.no">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>
        
          <asp:boundfield datafield="stuid" headertext="Student ID"/>
          <asp:boundfield datafield="name" headertext="Student Name"/>
          <asp:boundfield datafield="bid" headertext="Book ID"/>
          <asp:boundfield datafield="bname" headertext="Book Name"/>
          <asp:boundfield datafield="dept" headertext="Department"/>
          <asp:boundfield datafield="issuedate" headertext="Issuedate"/>
          <asp:boundfield datafield="duedate" headertext="Duedate"/>
          <asp:boundfield datafield="fine" headertext="Fine"/>
          
        

        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found...
            Try again by entering another date..  

        </emptydatatemplate> 
      </asp:GridView>    
    </div>
     <asp:Label ID="Label1" runat="server" Text="No data Found.." Visible="False"></asp:Label>
</div>
</asp:Content>

