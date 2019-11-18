<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="TestProject.calendar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3></h3>
    <asp:Panel ID="Panel1" runat="server">
        <iframe src="https://calendar.google.com/calendar/embed?src=regscantimeoff%40gmail.com&ctz=America%2FNew_York" style="border-style: none; border-color: inherit; border-width: 0; width: 1330px; height: 612px; margin-left: 9px; margin-right: 31px; margin-top: 0px;" frameborder="0" scrolling="no"></iframe>
    </asp:Panel>
</asp:Content>
