<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="TestProject.calendar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center"><%: Title %></h2>
    <h3></h3>
    <asp:Panel ID="Panel1" runat="server">
      <div class="text-center"><iframe src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%237986CB&amp;ctz=America%2FNew_York&amp;src=cmVnc2NhbnRpbWVvZmZAZ21haWwuY29t&amp;src=ZW4udXNhI2hvbGlkYXlAZ3JvdXAudi5jYWxlbmRhci5nb29nbGUuY29t&amp;color=%23875509&amp;color=%238D6F47" style="border-width:0; width: 905px; height: 614px;" frameborder="0" scrolling="no"></iframe></div>
    </asp:Panel>
</asp:Content>
