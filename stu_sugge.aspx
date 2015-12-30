<%@ Page Title="" Language="C#" MasterPageFile="~/stu.master" AutoEventWireup="true" CodeFile="stu_sugge.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>
    Student Suggetions
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style=" opacity:0.9; width:625px; height:495px; position:absolute; top:149px; left:362px; background-image: url('Images/sugges.png'); background-size:100% 100%; background-repeat: no-repeat;">

  <div class="input-append" style="position:absolute; top:198px; left:125px" >

  <%--  <table style="width:100%; text-align :center" >
        <tr>
            <td >
               
            </td>
        </tr>
    </table>--%>

    <textarea id="TextArea1" cols="20" rows="2" style ="width :300px;height:150px"></textarea>
                <br/><br/>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info " 
                    Text="Submit" Font-Names="Century Gothic" />
    </div>
    </div>
</asp:Content>

