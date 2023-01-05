<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_5.aspx.cs" Inherits="Three_Tier_App.Function_5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_5</h1>
        <p class="lead">Select a list and search computers with Rank in a range (specify min. and max.)。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:Label ID="Label1" runat="server" Text="Min："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="rank" DataValueField="rank">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select distinct rank from list order by rank"></asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Max："></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="rank" DataValueField="rank">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select distinct rank from list where rank&gt;@rank order by rank">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="rank" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server" Text="List："></asp:Label>
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="list" DataValueField="list">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select distinct  list from list order by list"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="500px">
        <Columns>
            <asp:BoundField DataField="List" HeaderText="List" SortExpression="List" />
            <asp:BoundField DataField="SystemID" HeaderText="SystemID" SortExpression="SystemID" />
            <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" />
        </Columns>
        <EmptyDataTemplate>
            沒有資料，請重新選擇！
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="SELECT List, SystemID, Rank FROM List WHERE (Rank &gt;= @min) AND (Rank &lt;= @max) AND (List = @list)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="min" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="max" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList3" Name="list" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
