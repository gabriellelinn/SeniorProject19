<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TestProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="491px" Width="1801px" style="margin-left: 195px; margin-top: 0px;" >
            <div class="text-center" style="height: 44px; width: 1800px; margin-top: 0px; margin-bottom: 23px">
                <p class="text-center" style="font-size: xx-large; width: 1684px; margin-left: 0;">
                    My Request Off</p>
            </div>
            <div class="text-center" style="height: 72px; width: 1689px; margin-top: 0px;">
                <strong>
                <asp:Button ID="Button1" runat="server" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" Font-Size="X-Large" Height="68px" OnClick="Button1_Click" style="left:50%; margin-left: 14px" Text="New User" Width="238px" />
                </strong>
                <asp:Button ID="Button2" runat="server" Font-Size="X-Large" Height="68px" OnClick="Button1_Click" style="margin-right: 14px; margin-left:477px" Text="Edit User" Width="238px" CssClass="col-xs-pull-6" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" />
            </div>
        <div>

            &#39;<asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [first_name] + ' ' + [last_name] AS Name, [ID] FROM [userAccount]  ORDER BY [last_name]"></asp:SqlDataSource>
            <br />

        </div>
        <div style="height: 73px; width: 1699px;" class="text-center">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" style="font-size: xx-large" Text="Select User: "></asp:Label>
            <asp:DropDownList ID="UserDropDown" runat="server" BackColor="White" DataSourceID="usersDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="54px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="font-size: x-large" Width="435px">
            </asp:DropDownList>
            </div>
        
                <form id="NewUser_Form" class="form-inline">
                                    <div class="form-group">
                                        <label for="fname">First Name:</label>
                                        <input type="text" class="form-control" id="fname"  placeholder="First Name" style="width: 34%">
                                    </div>
                                    <div class="form-group">
                                        <label for="lname">Last Name:</label>
                                        <input type="text" class="form-control" id="lname"  placeholder="Last Name" style="width: 34%">
                                    </div>
                                    <div class="form-group">
                                        <label for="createEmail">Username:</label>
                                        <input type="email" class="form-control" id="NewEmail" aria-describedby="emailHelp" placeholder="Employee email" style="width: 34%">
                                    </div>
                                    <div class="form-group">
                                        <label for="createPassword">Password:</label>
                                        <input type="password" class="form-control" id="NewPassword" placeholder="Password" style="width: 34%">
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">Confirm Password:</label>
                                        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" style="width: 34%">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                                
        
            </label>
                                
        
          </asp:Panel>
       
</asp:Content>
  
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
</asp:Content>

