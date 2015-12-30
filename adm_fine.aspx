
<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_fine.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div  style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
  <h1>
        Fine Report
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
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-large" Text="Button" 
                        onclick="Button1_Click" Visible="false" />
                </td>
        </tr>
  
  </table>
    <br />
    
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




     <div id="fineFac" runat="server" style="display:none">
    
         <asp:GridView ID="GridView2" runat="server"  ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="5" OnPageIndexChanging="facFine_PageIndexChanging"
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
        
          <asp:boundfield datafield="facusername" headertext="Faculty Username"/>
          <asp:boundfield datafield="name" headertext="Faculty Name"/>
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

