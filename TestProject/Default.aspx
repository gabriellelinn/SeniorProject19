<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-grey">
    <%--<div class="text-left" style="height:auto; width:auto; margin-top: 0px; margin-bottom: 23px; margin-left: 0px; margin-right: 0px;">--%>
            
     <%--   </div>--%>
        <div></div>
        <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="userAccountEvents" AllowPaging="True" AllowSorting="True" OnRowCommand="GridView1_RowCommand">
       <p class=w3-display-topmiddle style="font-size:xx-large;">
                My Requests</p>
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="created" HeaderText="Created" SortExpression="created" Visible="False">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="Type" SortExpression="name">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="submitted" HeaderText="Submitted" SortExpression="submitted">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="startDate" HeaderText="Start Date" SortExpression="startDate">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="endDate" HeaderText="End Date" SortExpression="endDate">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="startTime" HeaderText="Start Time" SortExpression="startTime">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="endTime" HeaderText="End Time" SortExpression="endTime">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments">
            <ControlStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="dept_id" HeaderText="dept_id" SortExpression="dept_id" Visible="False" />
            <asp:BoundField DataField="requestType_id" HeaderText="requestType_id" SortExpression="requestType_id" Visible="False" />
            <asp:BoundField DataField="userAccount_id" HeaderText="userAccount_id" SortExpression="userAccount_id" Visible="False" />
            <asp:BoundField DataField="totalHours" HeaderText="Total Hours" SortExpression="totalHours">
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="eventID" HeaderText="eventID" SortExpression="eventID" Visible="False" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                        <asp:Button ID="Editbtn" runat="server" BackColor="Yellow" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Edit" Text="Edit" />
                        <HeaderStyle Font-Bold="True" />
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cancel">
                <ItemTemplate>
                        <asp:Button ID="Cancelbtn" runat="server" BackColor="Red" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Cancel" Text="Cancel" />
                        <HeaderStyle Font-Bold="True" />
                    </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="userAccountEvents" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT request.ID, request.created, request.submitted, request.startDate, request.endDate, request.startTime, request.endTime, request.status, request.comments, request.dept_id, request.requestType_id, request.userAccount_id, request.totalHours, request.eventID, requestType.name FROM [request] JOIN requestType on request.requestType_id = requestType.ID WHERE ([userAccount_id] = @userAccount_id) ORDER BY [submitted] DESC
        

">
        <SelectParameters>
            <asp:SessionParameter Name="userAccount_id" SessionField="USER" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        </div>
    </asp:Content>
