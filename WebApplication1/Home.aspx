<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1._Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <center><img src="/Images/header.jpg" /></center>
    </div>
    <div class="">
        <p>Dear <%# UserInfo["Salutation"].ToString() %>,</p>
		<p>Throughout the past five seasons, we have watched our team develop both on the court and in the community, and during this time we have been humbled by how citizens across the state have welcomed us into their daily lives. We greatly value the connections we maintain with our fans, sponsors and especially our Season Ticket Members.</p>
		<p>Our players have participated in more than 1,000 authentic experiences throughout our community and played in over 200 games at Amway Center Arena to energetic crowds of 18,203. But the number that matters most to us is: One. Our team - be it players, coaches, staff or fans - are united as one, as together we have built this team's identity around the common core values of hard work, resiliency and community.</p>
		<p>Your commitment and loyalty have allowed this team and this city to rise together, stand tall and look to the future. With your support, we will work hard to continue to build a first-class, sustainable professional sports organization.</p>
        <p>Season Ticket Members are the lifeblood of a professional franchise. Your continued support and commitment to the team are extraordinary. I burst with pride at NBA meetings when our season ticket performance is reported, but as impressive as those numbers are, they in no way can describe the energy and passion that our Season Ticket Members deliver every game. We are very fortunate indeed.</p>
		<p>Thank you for engaging in the renewal process, and please don't hesitate to contact me personally if I can answer any question or provide additional information.</p>
		<p>Sincerely,<br />
		</p>
		<p>Clay T. Owner<br />
		Chairman and Chief Executive Officer<br />
		Florida Flames Organization</p>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-4">
            <h2>Member Benefits</h2>
            <p>
                Click here to see the exciting benefits of being a season ticket holder.
            </p>
            <p>
                <a class="btn btn-warning" href="Benefits">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Contact Us</h2>
            <p>
                Have questions? Contact your Account Representative now.
            </p>
            <p>
                <a class="btn btn-warning" href="Contact">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Renew Now</h2>
            <p>
                Ready to renew? Click here to see your renewal summary.
            </p>
            <p>
                <a class="btn btn-warning" href="Summary">Go &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
