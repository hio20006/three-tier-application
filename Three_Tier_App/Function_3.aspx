<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_3.aspx.cs" Inherits="Three_Tier_App.Function_3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_3</h1>
        <p class="lead">Select a supercomputer and show its ranks in all lists ordered by time。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:Label ID="Label1" runat="server" Text="System ID："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SystemID" DataValueField="SystemID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT DISTINCT SystemID FROM system_info order by SystemID "></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="500px">
        <Columns>
            <asp:BoundField DataField="List" HeaderText="List" SortExpression="List" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
            <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" />
            <asp:BoundField DataField="SystemID" HeaderText="SystemID" SortExpression="SystemID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select List,Year,Month,Rank,SystemID From List
where SystemID=@SystemID
order by Year,Month">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="SystemID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
