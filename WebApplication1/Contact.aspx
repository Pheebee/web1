<%@ Page Title="Contact Your Account Manager" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="col-md-6">
        <p>It is my pleasure to work with you directly on your season ticket renewal.</p>
	    <p>Please do not hesitate to contact me with any questions you may have regarding your 
           renewal, the NBA Playoffs or the annual Member Relocation and Upgrade Event.</p>
	    <p>For your convenience, if you prefer to manage your renewals and your initial payment online, 
           please <a href="Summary">click here</a> to renew your season tickets.</p>

        <address>
            <p><strong>Account Manager:</strong> <%# UserInfo["SalesName"].ToString() %><br />
		    <strong>Email:</strong> <a href="mailto:<%# UserInfo["SalesEmail"].ToString() %>?subject=Message from Season Ticket Holder <%# User.Identity.Name %>"><%# UserInfo["SalesEmail"].ToString() %></a><br />
		    <strong>Direct Line:</strong> <%# UserInfo["SalesPhone"].ToString() %></p>
        </address>
    </div>
    <div class="col-md-6">
        <img class="repImgLg" src="/Images/<%# UserInfo["SalesImage"].ToString() %>.jpg" />
    </div>
    <div class="clearfix"></div>
</asp:Content>
