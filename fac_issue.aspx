<%@ Page Title="Faculty Issue" Language="C#" MasterPageFile="~/fac.master" AutoEventWireup="true" CodeFile="fac_issue.aspx.cs" Inherits="Default3" %>
<%@ MasterType TypeName="fac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Facu Book Issue
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style=" opacity:0.9; width:625px; height:495px; position:absolute; top:149px; left:362px; background-image: url('Images/issue.png'); background-size:100% 100%; background-repeat: no-repeat;">

    <div style="text-align:center; height:320px; position:absolute; top:170px;left:10px;margin-right:10px" >       
    
        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White" 
          Visible="False"></asp:Label>     
    
        <asp:GridView ID="GridView1" runat="server"  ForeColor="white"  BackColor="#333333" BorderColor="#FFFFFF" GridLines="Horizontal" cellpadding="9" cellspacing="9" AutoGenerateColumns="False"
            AllowPaging="true" PageSize="2" OnPageIndexChanging="facFine_PageIndexChanging">
            
            <pagersettings mode="Numeric" position="Bottom" pagebuttoncount="3"/>

            <pagerstyle backcolor="Lightgray" ForeColor="#333333" Font-Bold="true" verticalalign="Bottom" horizontalalign="Center"/>
        
            <HeaderStyle BackColor="lightgray" ForeColor="#333333" Font-Size="Larger" Font-Bold="true"></HeaderStyle>
        
            <columns>
                <asp:TemplateField HeaderText="Sr.no">    
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:boundfield datafield="bid" headertext="Book ID"/>
                <asp:boundfield datafield="bname" headertext="Book Name"/>
                <asp:boundfield datafield="dept" headertext="Department"/>
                <asp:boundfield datafield="issuedate" headertext="Issuedate"/>
                <asp:boundfield datafield="duedate" headertext="Duedate"/>
                <asp:boundfield datafield="fine" headertext="Fine"/>
           </columns>
   
           <emptydatarowstyle backcolor="LightBlue" forecolor="Red"/>

           <emptydatatemplate>
              No book Issued currently...  
          </emptydatatemplate> 
  
      </asp:GridView>    
  
    </div>  
    </div>
    </div>
</asp:Content>

