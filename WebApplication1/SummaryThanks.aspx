<%@ Page Title="Thank you for renewing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SummaryThanks.aspx.cs" Inherits="WebApplication1.SummaryThanks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="clearfix">
        <table class="userInfo col-md-8">
		    <tr>
			    <td><strong>Season Ticket Member:</strong></td>
			    <td><%# UserInfo["DirectSmile"].ToString() %></td>
		    </tr>
		    <tr>
			    <td><strong>Seating Location(s):</strong></td>
			    <td><%# UserInfo["SeatHTML"].ToString() %></td>
		    </tr>
		    <tr>
			    <td><strong>Account Manager:</strong></td>
			    <td><%# UserInfo["SalesName"].ToString() %></td>
		    </tr>
		    <tr>
			    <td><strong>Email:</strong></td>
			    <td><%# UserInfo["SalesEmail"].ToString() %></td>
		    </tr>
		    <tr>
			    <td><strong>Direct Line:</strong></td>
			    <td><%# UserInfo["SalesPhone"].ToString() %></td>
		    </tr>
            <% 
			    if(UserInfo["SinglePerTotal"].ToString() != "0")
			    { %>
							
                    <tr>
                        <td class='bold'>Minimum Non-Season Ticket Member Seat(s) Price Per Game:</td>
                        <td>$<%# UserInfo["SinglePerTotal"].ToString() %></td>
                    </tr>
            <% }
						
			    if(UserInfo["SinglePerTotal"].ToString() != "0" && UserInfo["SavingsPerTotal"].ToString() != "0") 
			    { %>
                    <tr>
                        <td class='bold'>Minimum Season Ticket Savings</td>
                        <td>$<%# String.Format("{0:n0}", Convert.ToInt32(UserInfo["SavingsPerTotal"].ToString())) %></td>
                    </tr>
		    <% } %>
	    </table>
    </div>
    <hr />
    <div class="row clearfix col-md-12">
        <h3>It's as Easy as 1-2-3 to Renew Your Season Tickets &amp; Reserve Your Playoffs Seats!</h3>
	    <ol>
		    <li>Choose Your Preferred 2014-2015 Season Ticket Payment Plan Option </li>
		    <li>Choose Your Preferred 2014 NBA Playoffs Option</li>
		    <li>Click Submit! </li>
	    </ol>
    </div>
    <hr />
    <div id="tyTxt" runat="server">
		<p>Thank you for submitting your 2014-2015 Season Ticket and 2014 NBA Playoffs information.<br />
            Our records indicate that you have previously submitted this information.<br />
            If you have any questions please call your Account Manager, <%# UserInfo["SalesName"].ToString() %> at <%# UserInfo["SalesPhone"].ToString() %>.</p>
		<p>Thank you for your continued support of the Florida Flames.</p>
        <asp:Literal ID="selSmry" runat="server" />
	</div>
</asp:Content>
