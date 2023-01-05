<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_7.aspx.cs" Inherits="Three_Tier_App.Function_7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_7</h1>
        <p class="lead">Other_2,輸入超級電腦簡介的關鍵字看相關資料。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:Label ID="Label1" runat="server" Text="Computer："></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="List,SystemID" DataSourceID="SqlDataSource1" AllowPaging="True" Width="1000px">
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
        <EmptyDataTemplate>
            沒有資料，請重新輸入！
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT system_info.* FROM system_info where Computer like '%'+@computer1+'%'">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="computer1" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
