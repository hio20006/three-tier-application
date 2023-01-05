<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_6.aspx.cs" Inherits="Three_Tier_App.Function_6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_6</h1>
        <p class="lead">Other_1,選擇製造商看相關資料。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:Label ID="Label1" runat="server" Text="Manufacturer："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Manufacturer" DataValueField="Manufacturer">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT DISTINCT Manufacturer FROM system_info"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="List,SystemID" DataSourceID="SqlDataSource2" Width="1000px">
        <Columns>
            <asp:BoundField DataField="List" HeaderText="List" ReadOnly="True" SortExpression="List" />
            <asp:BoundField DataField="SystemID" HeaderText="SystemID" ReadOnly="True" SortExpression="SystemID" />
            <asp:BoundField DataField="Computer" HeaderText="Computer" SortExpression="Computer" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="SiteID" HeaderText="SiteID" SortExpression="SiteID" />
            <asp:BoundField DataField="Segment" HeaderText="Segment" SortExpression="Segment" />
            <asp:BoundField DataField="Totalcores" HeaderText="Totalcores" SortExpression="Totalcores" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT system_info.* FROM system_info where Manufacturer like '%'+@Manufacturer1+'%'">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Manufacturer1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
