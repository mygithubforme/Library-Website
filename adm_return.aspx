<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_return.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div  style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
  <h1>
        Return Report
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

        <asp:Button ID="Button1" CssClass="btn" OnClick="Button1_Click" runat="server" Text="Button" />
  </div>
   <div id="res_date" runat="server" style="display:none;">
  <br />
     Return Report of Date:  
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
       <br /><br />
         <asp:GridView ID="GridView1" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10"
        AutoGenerateColumns="False"  AllowPaging="true" PageSize="3" OnPageIndexChanging="retDate_PageIndexChanging"
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
        
          <asp:boundfield datafield="stuid" headertext="Return by Student/"/>
          <asp:boundfield datafield="facusername" headertext="Return by Faculty"/>
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
  


  </div>



</asp:Content>

