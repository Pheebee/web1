<%@ Page Title="Account Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="WebApplication1.Administration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="col-md-12 clearfix">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" 
            DataSourceID="SqlDataSource1" CssClass="col-md-8 col-md-offset-2" AutoGenerateEditButton="True">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="AccountID" HeaderText="Account ID" SortExpression="AccountID" />
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblFullName" Text='<%#  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="DirectSmile" HeaderText="Full Name" SortExpression="DirectSmile" ReadOnly="True" />
                <asp:BoundField DataField="SeasonPlan" HeaderText="Season Plan" SortExpression="SeasonPlan" ReadOnly="True" />
                <asp:BoundField DataField="PlayoffOption" HeaderText="Playoff Option" SortExpression="PlayoffOption" ReadOnly="True" />
                <asp:BoundField DataField="SubmitDate" HeaderText="Submit Date" SortExpression="SubmitDate" ReadOnly="True" />
                <asp:CheckBoxField DataField="AccountActive" HeaderText="AccountActive" SortExpression="AccountActive" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MySqlConnection %>" 
            SelectCommand="SELECT AccountID, ID, DirectSmile, AccountActive, SeasonPlan, PlayoffOption, SubmitDate FROM [XCIF-OKC]" UpdateCommand="UPDATE [XCIF-OKC] SET AccountActive = @AccountActive WHERE AccountID = @AccountID">
            <UpdateParameters>
                <asp:Parameter Name="AccountActive" />
                <asp:Parameter Name="AccountID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
