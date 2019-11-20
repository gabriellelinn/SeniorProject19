<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TestProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: auto;
            text-align: center;
            margin-bottom: 20px;
        }
        .auto-style6 {
            height: auto;
        }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            width: 123px;
        }
        .auto-style14 {
            width: 123px;
            text-align: left;
        }
        .auto-style15 {
            text-align: center;
        }
        
        .auto-style16 {
            width: 523px;
        }
        
        .auto-style17 {
            margin-left: auto;
            margin-right: auto;
            margin-top: 0px;
        }
        
        .auto-style18 {
            margin-top: 32px;
        }
        
        .auto-style19 {
            height: 412px;
            width: 515px;
        }
        .auto-style21 {
            text-align: left;
            height: 24px;
        }
        
        .auto-style22 {
            width: 296px;
            height: 23px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style6" alignment="center">
        <div class="auto-style3">
            <asp:Image ID="Image1" runat="server" Height="92px" ImageUrl="~/Images/RegscanInc.PNG" Width="260px" />
            &nbsp;<br />
            <br />
            <br />
            <div>
                <p>

                </p>
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server" style="margin-bottom:40px">
            <div>
                <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style17" Font-Names="Segoe UI" Font-Size="Large" ForeColor="#333333" Height="465px" OnAuthenticate="Login1_Authenticate" Width="594px">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LayoutTemplate>
                        <table align="center" cellpadding="4" cellspacing="0" style="border-collapse:collapse;" class="auto-style18">
                            <tr>
                                <td id="LoginForm" class="auto-style16">
                                    <table cellpadding="0" class="auto-style19">
                                        <tbody class="auto-style15">
                                            <tr>
                                                <td align="center" colspan="2" style="color:White;background-color:#284E98; font-size:large; font-weight:bold; font-family: 'Segoe UI';">Log In</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style21" align="center" colspan="2"  font-size:large; font-weight:bold; font-family: 'Segoe UI';"></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style14">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Names="Segoe UI">Username:</asp:Label>
                                                </td>
                                                <td class="auto-style10">
                                                    <asp:TextBox ID="UserName" runat="server" class="auto-style22"></asp:TextBox>
                                                    
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ForeColor="Red" ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style14">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td class="auto-style10">
                                                    <asp:TextBox  ID="Password" type= "Password" runat="server" class="auto-style22"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red" ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            



                                            <tr>
                                                <td colspan="2">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="auto-style11">
                                                    &nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Bold="True" Font-Names="Segoe UI" Font-Size="Large" ForeColor="#284E98" Height="38px" Text="Log In" ValidationGroup="Login1" Width="133px" OnClick="LoginButton_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
