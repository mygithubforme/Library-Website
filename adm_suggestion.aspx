<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adm_suggestion.aspx.cs" Inherits="adm_suggestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <script type="text/javascript">
     function CallPrint(strid) {
         var prtContent = document.getElementById(strid);
         var WinPrint = window.open('', '', 'letf=0,top=0,width=400,height=400,toolbar=0,scrollbars=0,status=0');
         WinPrint.document.write(prtContent.innerHTML);
         WinPrint.document.close();
         WinPrint.focus();
         WinPrint.print();
         WinPrint.close();

     }
  </script>
 <div id="d1" style="font-weight: normal; font-size: large; font-family: Calibri;text-align:left">
 
  <h1>
    Suggestions
  </h1>
          <asp:GridView ID="GridView1" runat="server" ForeColor="black"  
            BackColor="lightgray"  
            HeaderStyle-ForeColor="AliceBlue"  
            BorderColor="#333333"  
            GridLines="Horizontal"  
            cellpadding="10"
        cellspacing="10" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" OnPageIndexChanging="sugg_PageIndexChanging">
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
        
          <asp:boundfield datafield="id" headertext="ID"/>
          <asp:boundfield datafield="sug" headertext="Content"/>  
        </columns>
       <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>

        <emptydatatemplate>

            Sorry, No Data Found...
            Try again by entering another date..  

        </emptydatatemplate> 
      </asp:GridView>
  <br />

   <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-small glyphicon glyphicon-print "  OnClientClick="CallPrint('d1')"/>
   <%--<button type="button" style="font-family:Calibri" class="btn btn-info btn-small ">Print--%>
<span class="glyphicon glyphicon-print"></span>
<%--</button>--%> 
  <%-- <input type="button" value="Print" cssclass="btn" id="btnPrint" runat="Server" onclick="javascript:CallPrint('d1')" style="font-family: Calibri;text-align:center"/>
  --%>   
</div>
   
</asp:Content>

