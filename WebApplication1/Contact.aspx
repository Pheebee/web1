<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>It is my pleasure to work with you directly on your season ticket renewal.</p>
	<p>Please do not hesitate to contact me with any questions you may have regarding your 
       renewal, the NBA Playoffs or the annual Member Relocation and Upgrade Event.</p>
	<p>For your convenience, if you prefer to manage your renewals and your initial payment online, 
       please <a href="Summary">click here</a> to renew your season tickets.</p>

    <address>
        <strong>Email:</strong>   <a href="mailto:">[email@email.com]</a><br />
        <strong>Direct Line:</strong> [Phone number]
    </address>
</asp:Content>
