<%@ Page Title="Faculty Suggetion" Language="C#" MasterPageFile="~/fac.master" AutoEventWireup="true" CodeFile="fac_sugge.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Student Suggetion
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style=" opacity:0.9; width:627px; height:495px; position:absolute; top:22%; left:27%; background-image: url('Images/sugges.png'); background-size:100% 100%; background-repeat: no-repeat;">

  <div class="input-append" style="position:absolute; top:198px; left:125px;text-align :center" >

    <%--<table style="width:100%; text-align :center" >
        <tr>
            <td > --%><br/>
            <textarea id="TextArea1" cols="20" rows="2" style ="width :300px;height:150px"></textarea>
                <br/><br/>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info " 
                    Text="Submit" Font-Names="Century Gothic" />
      <%--         
            </td>
        </tr>
    </table>--%>
    </div>
    </div>
</asp:Content>

