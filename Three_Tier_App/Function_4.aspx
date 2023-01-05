<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_4.aspx.cs" Inherits="Three_Tier_App.Function_4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_4</h1>
        <p class="lead">Select a country and a list and show a ordered list of sites and number of supercomputers in each site in the list。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:Label ID="Label1" runat="server" Text="List："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="List" DataValueField="List">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT DISTINCT List FROM List"></asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Country："></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Country" DataValueField="Country">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT distinct Country FROM site_info"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="500px" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="list" HeaderText="list" SortExpression="list" />
            <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
            <asp:BoundField DataField="site" HeaderText="site" SortExpression="site" />
            <asp:BoundField DataField="computer_num" HeaderText="computer_num" ReadOnly="True" SortExpression="computer_num" />
        </Columns>
        <EmptyDataTemplate>
            沒有資料，請重新選擇！
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select list,country,site,count(systemid) as computer_num from site_info where list=@list and country=@country group by list,country,site order by country">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="list" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="country" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
