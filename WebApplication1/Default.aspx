<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome</h1>
        <p class="lead">Ticket Renewal</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Member Benefits</h2>
            <p>
                Click here to see the exciting benefits of being a season ticket holder.
            </p>
            <p>
                <a class="btn btn-default" href="Benefits">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Contact Us</h2>
            <p>
                Have questions? Contact your Account Representative now.
            </p>
            <p>
                <a class="btn btn-default" href="Contact">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Renew Now</h2>
            <p>
                Ready to renew? Click here to see your renewal summary.
            </p>
            <p>
                <a class="btn btn-default" href="Summary">Go &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
