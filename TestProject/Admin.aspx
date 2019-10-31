<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TestProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" style="margin-left: 135px; margin-top: 0px; margin-right: 0px; margin-bottom: 10px;" Height="275px" >
        <div class="text-left" style="height:auto; width:auto; margin-top: 0px; margin-bottom: 23px; margin-left: 0px; margin-right: 0px;">
            <p class="text-center" style="font-size: xx-large; width: 1427px; margin-left: 0;">
                My Request Off
            </p>
        </div>
        <div class="text-center" style="height: 68px; width: 1429px; margin-top: 0px; margin-left: 0px; margin-right: 0px;">
            <strong>
                <asp:Button ID="NewUserbtn" runat="server" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" Font-Size="X-Large" Height="68px" OnClick="NewUserbtn_Click" Style="left: 50%; margin-left: 14px" Text="New User" Width="238px" />
            </strong>
            <asp:Button ID="EditUserbtn" runat="server" Font-Size="X-Large" Height="68px" OnClick="EditUserbtn_Click" Style="margin-right: 14px; margin-left: 477px" Text="Edit User" Width="238px" CssClass="col-xs-pull-6" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" />
        </div>
        <div style="margin-bottom: 0px; width: 1494px; height: 58px;">
            &#39;<asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [first_name] + ' ' + [last_name] AS Name, [ID] FROM [employee]  ORDER BY [last_name]"></asp:SqlDataSource>
            <br />

        </div>
        <div style="height: 71px; width: 1497px; margin-top: 0px; margin-left: 0px;"  id="DropdownDivs1">
            <div class="row" runat="server">
                <div class="col-sm-4" id="selectEmployeeOption" style="left: 0px; top: 0px; width: 97%">
           
            <asp:Label ID="selectEmployee" runat="server" Font-Bold="True" Font-Size="X-Large" Style="font-size: large" Text="Employee: " Visible="False"></asp:Label>
            <asp:DropDownList ID="EmployeeDropDown" runat="server" BackColor="White" DataSourceID="usersDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="49px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="font-size: large" Width="414px" Visible="False" Enabled="False">
            </asp:DropDownList>
                      </div>
                    <div class="col-sm-4" id="employeeSelectDiv">
                    <asp:Button ID="EmployeeSelect" runat="server" style="margin-left: 8px" Text="Select" Visible="False" Width="123px" Height="29px" OnClick="EmployeeSelect_Click"  />
               </div>
                  
              </div>
              <div style="height: 71px; width: 1463px; margin-top: 0px; margin-left: 0px;"  id="DropdownDiv2">
            <div class="row" runat="server">
               <div class="col-sm-4" id="selectUserOption" >
            <asp:Label ID="selectUser" runat="server" Font-Bold="True" Font-Size="X-Large" Style="font-size: large" Text="User: " Visible="False"></asp:Label>
            <asp:DropDownList ID="UserDropDown" runat="server" BackColor="White" DataSourceID="usersDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="48px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="font-size: large" Width="435px" Enabled="False" Visible="False">
            </asp:DropDownList>
                   </div>
                   <div class="col-sm-4" id="userSelectDiv" style="left: 0px; top: 0px; width: 14%">
                    <asp:Button ID="UserSelect" runat="server" style="margin-left: 26px" Text="Select" Visible="False" Width="123px" Height="29px" OnClick="UserSelect_Click"  />
                   </div>
                </div>
             </div> 
            </div>

             <%--<div class="row">
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-3</div>
    <div class="col-sm-4" style="background-color:lavenderblush;">.col-sm-6</div>
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-3</div>
  </div>--%>
     </asp:Panel>
    <asp:Panel ID="GeneralPanel" runat="server">
        <form ID="NewUser_Form">

        <%--<asp:Form ID="NewUserForm" runat="server">--%>

            <div class="form-group" style="height: inherit; width: inherit;">
                <table class="auto-style1" style="margin-left: 137px">
                    <tr>
                        <td style="width: 174px; height: 54px">First Name:</td>
                        <td style="height: 54px"><asp:TextBox ID="fname_txt" class="form-control" runat="server" Width="348px"></asp:TextBox></td>
                         <td style="width: 376px; height: 54px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 54px; width: 135px;">
                            Hire Date:
                        </td>
                        <td style="width: 344px; height: 54px"> <asp:TextBox ID="hireDate" class="form-control" runat="server" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 174px; height: 54px">Last Name:</td>
                        <td style="height: 54px"> <asp:TextBox ID="lname_txt" class="form-control" runat="server"></asp:TextBox></td>
                         <td style="width: 376px; height: 54px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 54px; width: 135px;">Employee Status:</td>
                         <td style="width: 344px; height: 54px;"><asp:DropDownList ID="empStat_dropdownlist" ReadOnly="True" class="form-control" runat="server" Height="37px" Width="225px" DataSourceID="EmpStatDataSource" DataTextField="statusName" DataValueField="ID">
                            </asp:DropDownList>
                             <asp:SqlDataSource ID="EmpStatDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT * FROM [empStatus]"></asp:SqlDataSource>
                       </td>
                       
                    </tr>
                    <tr>
                        <td style="width: 174px; height: 54px">Username/Email:</td>
                        <td style="height: 54px"><asp:TextBox ID="username_txt" class="form-control" runat="server"></asp:TextBox> </td>
                        <td style="width: 376px; height: 54px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                         <td style="height: 54px; width: 135px;">Department:</td>
                         <td style="width: 344px; height: 54px;"><asp:DropDownList ID="dept_dropdownlist" class="form-control" runat="server" Height="37px" Width="225px" DataSourceID="departmentDataSource" DataTextField="name" DataValueField="ID">
                            </asp:DropDownList>
                             <asp:SqlDataSource ID="departmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" EnableViewState="False" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
                       </td>
                       
                    </tr>
                    <tr>
                        <td style="width: 174px; height: 53px">Password:</td>
                        <td style="height: 53px"><input type="text" class="form-control" ID="NewPassword" placeholder="Password" style="width: 100%"></td>
                        <td style="width: 376px; height: 53px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 53px; width: 135px;">Account Status:</td>
                        <td style="height: 53px">
                            <asp:DropDownList ID="acct_dropdownlist" class="form-control" runat="server" Height="37px" Width="225px">
                                <asp:ListItem Value="0">Inactive</asp:ListItem>
                                <asp:ListItem Value="1">Active</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 174px; height: 45px">Confirm Password:</td>
                        <td style="height: 45px; margin-left: 160px;"><asp:TextBox ID="confirmPass_txt" class="form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>
                           
                        </td>
                         <td style="width: 376px; height: 53px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 53px; width: 135px;">Account Status:</td>
                        <td style="height: 53px">
                            <asp:DropDownList ID="RoleDropDownList" class="form-control" runat="server" Height="37px" Width="225px">
                                <asp:ListItem Value="0">Regular User</asp:ListItem>
                                <asp:ListItem Value="1">Department Supervisor</asp:ListItem>
                                 <asp:ListItem Value="8">HR Administrator</asp:ListItem>
                                 <asp:ListItem Value="9">Administrator</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
        </div>          
        </form>
        </asp:Panel>
<%--            </asp:Form>--%>
   
   
</asp:Content>


