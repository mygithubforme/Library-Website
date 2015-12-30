<%@ Page Title="" Language="C#" MasterPageFile="~/stu.master" AutoEventWireup="true" CodeFile="suggestion.aspx.cs" Inherits="Def_suggestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div style=" opacity:0.9;width:625px; height:495px; position:absolute; top:149px; left:362px; background-image: url('Images/sea.png'); background-size:100% 100%; background-repeat: no-repeat;">
    
    <div class="input-append" style="position:absolute; top:250px; left:130px"  >


        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    <asp:TextBox ID="TextBox2" runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
    <br /> 

    <asp:Button ID="Button1" cssClass="btn btn-info" runat="server" Text="submit" onclick="Button1_Click" />
     <br /> 

    <br /> 
        <asp:Label ID="Label2" runat="server" Text="Label" Visible=false></asp:Label>
     </div>
  </div>  
</asp:Content>

