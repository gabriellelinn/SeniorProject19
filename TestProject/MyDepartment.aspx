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
        <div style="margin-left:15px; margin-right :15px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="requestDataSource" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="submitted" HeaderText="Submitted" SortExpression="submitted" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="userAccount_id" HeaderText="User" SortExpression="userAccount_id">
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="startDate" HeaderText="Start Date" SortExpression="startDate" DataFormatString="{0:d}" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="endDate" HeaderText="End Date" SortExpression="endDate" DataFormatString="{0:d}" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="startTime" HeaderText="Start Time" SortExpression="startTime" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="endTime" HeaderText="End Time" SortExpression="endTime" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="totalHours" HeaderText="Total Hours" SortExpression="totalHours" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="requestType_id" HeaderText="Request Type" SortExpression="requestType_id">
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="eventID" HeaderText="eventID" SortExpression="eventID" Visible="False" />
                <asp:BoundField DataField="comments" HeaderText="comments" SortExpression="comments" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:TemplateField HeaderText="Approve" ShowHeader="true">
                    <ItemTemplate>
                        <asp:Button ID="Approvebtn" runat="server" BackColor="Green" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Approve" Text="Approve" />
                        <HeaderStyle Font-Bold="True" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Deny" ShowHeader="true">
                    <ItemTemplate>
                        <asp:Button ID="Denybtn" runat="server" BackColor="Red" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Deny" Text="Deny" />
                        <HeaderStyle Font-Bold="True" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="Yellow" />
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="requestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT submitted, startDate, endDate, startTime, endTime, status, comments, requestType_id, userAccount_id, eventID, totalHours, ID FROM request WHERE (dept_id = @dept_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="deptDropDownList" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
