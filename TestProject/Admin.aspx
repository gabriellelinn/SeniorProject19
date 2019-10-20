<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TestProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="491px" Width="1801px" style="margin-left: 195px; margin-top: 0px;" >
            <div class="text-center" style="height: 67px; width: 1800px; margin-top: 0px; margin-bottom: 23px">
                <p class="text-center" style="font-size: xx-large; width: 1684px; margin-left: 0;">
                    My Request Off</p>
            </div>
            <div class="text-center" style="height: 73px; width: 1795px;">
                <strong>
                <asp:Button ID="Button1" runat="server" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" Font-Size="X-Large" Height="68px" OnClick="Button1_Click" style="left:50%; margin-left: 14px" Text="New User" Width="238px" />
                </strong>
                <asp:Button ID="Button2" runat="server" Font-Size="X-Large" Height="68px" OnClick="Button1_Click" style="margin-right: 14px; margin-left:477px" Text="Edit User" Width="238px" CssClass="col-xs-pull-6" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" />
            </div>
        <div>

        </div>
        <div style="height: 84px; width: 979px;" class="text-left">
            <asp:Label ID="Label3" runat="server" Text="Select User: " Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="100px" Width="520px">
            </asp:DropDownList>
            </div>
          </asp:Panel>
       
</asp:Content>
  
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
</asp:Content>

