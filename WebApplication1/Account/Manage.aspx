<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApplication1.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>You're logged in as <strong><%: User.Identity.GetUserName() %></strong>.</p>
    <hr />

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-6">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
                    </p>
                    <div class="form-horizontal">
                        <h4>Set Password Form</h4>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <hr />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-4 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="The password field is required."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-error" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-4 control-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                    ValidationGroup="SetPassword" />

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10">
                                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    
                    <div class="form-horizontal">
                        <h4>Change Password Form</h4>
                        
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-4 control-label">Current password</asp:Label>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="The current password field is required."
                                    ValidationGroup="ChangePassword" Display="None" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-4 control-label">New password</asp:Label>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="The new password is required."
                                    ValidationGroup="ChangePassword" Display="None" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-4 control-label">Confirm new password</asp:Label>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="None" ErrorMessage="Confirm new password is required."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="None" ErrorMessage="The new password and confirmation password do not match."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-1">
                                <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-warning" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>
        </div>
        <div class="col-md-6">
            <asp:Panel runat="server" ID="frmPnl">
                <h4>Update Profile</h4>
                <asp:Literal runat="server" ID="ltlMsg"></asp:Literal>
                <label class="col-md-3 control-label">Full Name </label><asp:TextBox runat="server" ID="fname" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">Address </label><asp:TextBox runat="server" ID="add" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">City </label><asp:TextBox runat="server" ID="city" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">State </label><asp:TextBox runat="server" ID="st" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">Zip </label><asp:TextBox runat="server" ID="zip" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">Phone </label><asp:TextBox runat="server" ID="phn" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <label class="col-md-3 control-label">Email </label><asp:TextBox runat="server" ID="email" CssClass="form-control" ValidationGroup="submit"></asp:TextBox><br />
                <asp:Button runat="server" Text="Cancel" CssClass="btn btn-default col-md-offset-1" OnClick="CancelBtn_Click" CausesValidation="false" /> <asp:Button runat="server" OnClick="UpdateProfile_Click" Text="Update" CssClass="btn btn-warning col-md-offset-1" ValidationGroup="submit" />

                <asp:RequiredFieldValidator runat="server" ID="rf1" ControlToValidate="fname" ErrorMessage="Please enter your Full Name" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf2" ControlToValidate="add" ErrorMessage="Please enter your Address" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf3" ControlToValidate="city" ErrorMessage="Please enter your City" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf4" ControlToValidate="st" ErrorMessage="Please enter your State" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf5" ControlToValidate="zip" ErrorMessage="Please enter your Zip" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf6" ControlToValidate="phn" ErrorMessage="Please enter your Phone" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ID="rf7" ControlToValidate="email" ErrorMessage="Please enter your Email" Display="None" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="re1" ControlToValidate="phn" ErrorMessage="Please enter a valid Phone Number" Display="None" ValidationExpression="^(?:\([2-9]\d{2}\)\ ?|[2-9]\d{2}(?:\-?|\ ?))[2-9]\d{2}[- ]?\d{4}$" ValidationGroup="submit"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator runat="server" ID="re2" ControlToValidate="email" ErrorMessage="Please enter a valid Email Address" Display="None" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ValidationGroup="submit"></asp:RegularExpressionValidator>
                <asp:ValidationSummary runat="server" ID="vs" DisplayMode="List" ShowSummary="false" ShowMessageBox="true" ValidationGroup="submit" />
            </asp:Panel>
            <asp:Panel runat="server" ID="successPnl" Visible="false">
                <p>Your profile has been updated.</p>
            </asp:Panel>
        </div>
    </div>

</asp:Content>
