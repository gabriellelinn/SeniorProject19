<%@ Page Title="My Department" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyDepartment.aspx.cs" Inherits="TestProject.myDepartment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center"><%: Title %></h2>
    <h3></h3>
    <asp:Panel ID="Panel1" runat="server">
        <div>
            <asp:Label ID="department_lbl" runat="server" Text="Department: " style="font-size: x-large"></asp:Label>
            <asp:DropDownList ID="deptDropDownList" runat="server" style="font-size: large" DataSourceID="deptDataSource" DataTextField="name" DataValueField="ID" Width="497px"></asp:DropDownList>
            <asp:SqlDataSource ID="deptDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [ID], [name] FROM [department]"></asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="requestDataSource">
            <Columns>
                <asp:BoundField DataField="submitted" HeaderText="submitted" SortExpression="submitted" />
                <asp:BoundField DataField="startDate" HeaderText="startDate" SortExpression="startDate" />
                <asp:BoundField DataField="endDate" HeaderText="endDate" SortExpression="endDate" />
                <asp:BoundField DataField="startTime" HeaderText="startTime" SortExpression="startTime" />
                <asp:BoundField DataField="endTime" HeaderText="endTime" SortExpression="endTime" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:BoundField DataField="comments" HeaderText="comments" SortExpression="comments" />
                <asp:BoundField DataField="requestType_id" HeaderText="requestType_id" SortExpression="requestType_id" />
                <asp:BoundField DataField="userAccount_id" HeaderText="userAccount_id" SortExpression="userAccount_id" />
                <asp:BoundField DataField="eventID" HeaderText="eventID" SortExpression="eventID" />
                <asp:BoundField DataField="totalHours" HeaderText="totalHours" SortExpression="totalHours" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="requestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [submitted], [startDate], [endDate], [startTime], [endTime], [status], [comments], [requestType_id], [userAccount_id], [eventID], [totalHours] FROM [request] WHERE ([dept_id] = @dept_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="deptDropDownList" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
