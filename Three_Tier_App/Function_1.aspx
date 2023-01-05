<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Function_1.aspx.cs" Inherits="Three_Tier_App.Function_1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <h1>Function_1</h1>
        <p class="lead">List ordered average of Rmax in different Segments and in different lists。</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="500px">
    <Columns>
        <asp:BoundField DataField="list" HeaderText="list" SortExpression="list" />
        <asp:BoundField DataField="Segement" HeaderText="Segement" SortExpression="Segement" />
        <asp:BoundField DataField="Rmax_avg" HeaderText="Rmax_avg" ReadOnly="True" SortExpression="Rmax_avg" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M11105506ConnectionString %>" SelectCommand="select list.list,Segement.Segement,avg(list.rmax) as Rmax_avg from list left join Segement on list.systemid =Segement.systemid and list.list=Segement.list group by Segement.Segement,list.list order by Rmax_avg"></asp:SqlDataSource>
</asp:Content>
