<%@ Page Title="Ticket Renewal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication1.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:Literal runat="server" ID="testMsg"></asp:Literal>
    <asp:Panel runat="server" ID="acntDisabled" Visible="false">
        <div class="alert alert-danger col-md-11">
            IMPORTANT NOTICE: Your account renewal is currently deactivated. Please contact your Account Representative at <%# UserInfo["SalesPhone"].ToString() %> immediately.
        </div>
    </asp:Panel>
    <div class="clearfix">
        <table class="userInfo col-md-8">
		    <tr>
			    <td><strong>Season Ticket Member:</strong></td>
			    <td><%# UserInfo["DirectSmile"].ToString() %></td>
		    </tr>
            <tr><td>&nbsp;</td></tr>
		    <tr>
			    <td style="vertical-align:top;"><strong>Seating Location(s):</strong></td>
			    <td><%# UserInfo["SeatHTML"].ToString() %></td>
		    </tr>
            <tr><td>&nbsp;</td></tr>
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
    <asp:Panel runat="server" ID="renewFrm">
    <hr />
        <div>
            <h3>2014-2015 Season Ticket Renewal &amp; 2014 NBA Playoffs Invoice</h3>
		    <p><strong>Account #: <%# UserInfo["AccountID"].ToString() %></strong><br />
			    <strong><%# UserInfo["DirectSmile"].ToString() %></strong><br />
			    <%# AddInfo["Address1"].ToString() %><br />
			    <%# AddInfo["City"].ToString() %>, <%# AddInfo["State"].ToString() %> <%# AddInfo["Zip"].ToString() %><br />
			    <strong>Due Date: Friday, March 15, 2014</strong></p>
            <table class="col-md-10 table" id="invTbl">
		        <thead>
			        <tr>
				        <th width="230">Seat Location: </th>
				        <th># of Seats: </th>
				        <th>Description:</th>
				        <th width="70">Per Seat / Per Game: </th>
				        <th width="60">Total Value: </th>
			        </tr>
		        </thead>
		        <tbody>
			        <%# UserInfo["RegTableHTML"].ToString() %>
		        </tbody>
		        <tfoot>
			        <tr>
				        <td></td>
				        <td></td>
				        <td colspan="3" style=" text-align: right;"><strong>Total Balance Due*: &nbsp;<span style="color:#ec503a;">$<%# String.Format("{0:n}", Convert.ToInt32(UserInfo["FullSeasonTotal"].ToString())) %></span></strong></td>
			        </tr>
		        </tfoot>
	        </table>
        </div>
        <div class="clearfix">&nbsp;</div>
        <div class="col-md-12 clearfix">
            <h4>I. 2014-2015 Season Ticket Payment Plan Option</h4>
            <div class="col-md-8">
                
                <p>
		    	    <asp:Literal ID="tcktTxt" runat="server" />
		        </p>
                <asp:RadioButtonList ID="tcktOpt" runat="server" CssClass="radio"></asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="rf1" ControlToValidate="tcktOpt" Display="None" ErrorMessage="Please select a Season Ticket payment plan option."></asp:RequiredFieldValidator>
            </div>
        </div>
        <hr />
        <div class="clearfix">
            <h4>II. 2014 NBA Playoffs Options</h4>
            <table class="grid col-md-8">
			    <thead>
				    <tr>
					    <th></th>
					    <th>Per Ticket, Per Game</th>
					    <th>All Four Potential Home Games</th>
				    </tr>
			    </thead>
			    <tbody>
				    <tr>
					    <td>Round 1</td>
					    <td><%# UserInfo["Round1PricePerSeat"].ToString() %></td>
					    <td><%# UserInfo["Round1TotalPerSeat"].ToString() %></td>
				    </tr>
				    <tr>
					    <td>Round 2</td>
					    <td><%# UserInfo["Round2PricePerSeat"].ToString() %></td>
					    <td><%# UserInfo["Round2TotalPerSeat"].ToString() %></td>
				    </tr>
				    <tr>
					    <td>Western Conference Finals</td>
					    <td><%# UserInfo["Round3PricePerSeat"].ToString() %></td>
					    <td><%# UserInfo["Round3TotalPerSeat"].ToString() %></td>
				    </tr>
				    <tr>
					    <td>NBA Finals</td>
					    <td><%# UserInfo["Round4PricePerSeat"].ToString() %></td>
					    <td><%# UserInfo["Round4TotalPerSeat"].ToString() %></td>
				    </tr>
			    </tbody>
		    </table>
		    <asp:RadioButtonList ID="PlayoffsOpt" runat="server" CssClass="radio col-md-8"> </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ID="rf2" ControlToValidate="PlayoffsOpt" Display="None" ErrorMessage="Please select a Playoffs option."></asp:RequiredFieldValidator>
        </div>
        <hr />
        <div class="clearfix">
            <h4>III. SUBMIT</h4>
		    <p>By submitting this payment, I agree to all the terms and conditions of the<br />
		    <strong>Florida Flames Ticket <a href="http://www.nba.com/thunder/tickets/stm-guidebook_1011.html" target="_blank">Policies and Procedures</a></strong>.</p>
		    <asp:Button ID="submit" Text="Submit" runat="server" CssClass="inputBtn" OnClick="submit_Click" />
            <asp:ValidationSummary runat="server" ID="vs1" DisplayMode="List" ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        </div>
    </asp:Panel>
</asp:Content>
