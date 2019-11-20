<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TestProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" style="margin-top: 0px; margin-right: 0px; margin-bottom: 10px;" Height="275px" >
        <div class="text-left" style="height:auto; width:auto; margin-top: 0px; margin-bottom: 23px; margin-left: 0px; margin-right: 0px;">
            <p class="text-center" style="font-size: xx-large;  margin-left: 0;">
                Administrator</p>
        </div>
        <div class="text-center" style="height: 68px; margin-top: 0px; margin-left: 0px; margin-right: 0px;">
            <strong>
                <asp:Button ID="NewUserbtn" runat="server" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" Font-Size="X-Large" Height="68px" OnClick="NewUserbtn_Click" Style="left: 50%; margin-left: 14px" Text="New User" Width="238px" />
            </strong>
            <asp:Button ID="EditUserbtn" runat="server" Font-Size="X-Large" Height="68px" OnClick="EditUserbtn_Click" Style="margin-right: 14px; margin-left: 477px" Text="Edit User" Width="238px" CssClass="col-xs-pull-6" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" />
        </div>
        <div style="margin-bottom: 0px; width: 1494px; height: 58px;">
            &#39;<asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [first_name] + ' ' + [last_name] AS Name, [ID] FROM [userAccount]  ORDER BY [last_name]"></asp:SqlDataSource>
            <br />

        </div>
        <div style="height: 71px; width: 1497px; margin-top: 0px; margin-left: 0px;"  id="DropdownDivs1">
            <div class="row" runat="server">
                <div class="col-sm-4" id="selectEmployeeOption" style="left: 0px; top: 0px; width: 97%">
           
            <asp:Label ID="selectEmployee" runat="server" Font-Bold="True" Font-Size="X-Large" Style="font-size: large" Text="Employee: " Visible="False"></asp:Label>
            <asp:DropDownList ID="EmployeeDropDown" runat="server" BackColor="White" DataSourceID="employeeDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="49px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="font-size: large" Width="414px" Visible="False" Enabled="False">
            </asp:DropDownList>
                      </div>
                    <div class="col-sm-4" id="employeeSelectDiv">
                    <asp:Button ID="EmployeeSelect" runat="server" style="margin-left: 8px" Text="Select" Visible="False" Width="123px" Height="29px" OnClick="EmployeeSelect_Click"  />
               </div>
                  
              </div>
              <div style="height: 71px; width: 1463px; margin-top: 0px; margin-left: 0px;"  id="DropdownDiv2">
            <div class="row" runat="server">
               <div class="col-sm-4" id="selectUserOption" style="left: 0px; top: 0px; width: 102%" >
            <asp:Label ID="selectUser" runat="server" Font-Bold="True" Font-Size="X-Large" Style="font-size: large" Text="User: " Visible="False"></asp:Label>
            <asp:DropDownList ID="UserDropDown" runat="server" BackColor="White" DataSourceID="usersDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="48px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="font-size: large" Width="435px" Enabled="False" Visible="False">
            </asp:DropDownList>
                   <asp:SqlDataSource ID="employeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT ([first_name] + ' ' + [last_name]) AS Name, [ID] FROM [employee]"></asp:SqlDataSource>
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
    <asp:Panel ID="GeneralPanel" runat="server" >
        <form ID="NewUser_Form">

        <%--<asp:Form ID="NewUserForm" runat="server">--%>

            <div class="form-group" style="height: inherit; width: inherit;">
                <table class="auto-style1" style="margin-left: 137px">
                    <tr>
                        <td style="width: 193px; height: 54px">First Name*:</td>
                        <td style="height: 54px; width: 574px;"><asp:TextBox ID="fname_txt" class="form-control" runat="server" Width="348px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="fnameRequired" runat="server" ControlToValidate="fname_txt" ErrorMessage="First Name is required." ForeColor="Red" ToolTip="First Name is required." ValidationGroup="generalPanelValid"></asp:RequiredFieldValidator>
                        </td>
                         <td style="width: 289px; height: 54px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 54px; width: 161px; font-size: large;">
                            Hire Date:
                        </td>
                        <td style="width: 420px; height: 54px"> <asp:TextBox ID="hireDate" class="form-control" runat="server" ReadOnly="True" Enabled="False" Width="248px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 193px; height: 54px; font-size: large;">Last Name*:</td>
                        <td style="height: 54px; width: 574px;"> <asp:TextBox ID="lname_txt" class="form-control" runat="server" style="font-size: large"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" ControlToValidate="lname_txt" ErrorMessage="Last Name is required." ForeColor="Red" ToolTip="Last Name is required." ValidationGroup="gernalPanelValid"></asp:RequiredFieldValidator>
                        </td>
                         <td style="width: 289px; height: 54px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 54px; width: 161px; font-size: large;">Employee Status:</td>
                         <td style="width: 420px; height: 54px;"><asp:DropDownList ID="empStat_dropdownlist" ReadOnly="True" class="form-control" runat="server" Height="37px" Width="248px" DataSourceID="EmpStatDataSource" DataTextField="statusName" DataValueField="ID" Enabled="False" style="font-size: large">
                            </asp:DropDownList>
                             <asp:SqlDataSource ID="EmpStatDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT * FROM [empStatus]"></asp:SqlDataSource>
                       </td>
                       
                    </tr>
                    <tr>
                        <td style="width: 193px; height: 54px; font-size: large;">Username/Email*:</td>
                        <td style="height: 54px; width: 574px;"><asp:TextBox ID="username_txt" class="form-control" runat="server" style="font-size: large"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="username_req" runat="server" ControlToValidate="username_txt" ErrorMessage="Username/Email is required." ForeColor="Red" ToolTip="Username/Email is required." ValidationGroup="generalPanelValid"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 289px; height: 54px">
                             <asp:TextBox ID="UserMode" runat="server" Visible="false"></asp:TextBox>
                        </td>
                         <td style="height: 54px; width: 161px; font-size: large;">Department:</td>
                         <td style="width: 420px; height: 54px;"><asp:DropDownList ID="dept_dropdownlist" class="form-control" runat="server" Height="37px" Width="248px" DataSourceID="departmentDataSource" DataTextField="name" DataValueField="ID" style="font-size: large">
                            </asp:DropDownList>
                             <asp:SqlDataSource ID="departmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" EnableViewState="False" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
                       </td>
                       
                    </tr>
                    <tr>
                        <td style="width: 193px; height: 53px; font-size: large;" id="PasswordLabel" runat="server">Password:</td>
                       
                        <td style="height: 53px; width: 574px;"><input class="form-control" ID="NewPassword" type="password" runat="server" style="width: 100%; font-size: large;">
                         <asp:RequiredFieldValidator ID="PasswordRFV" runat="server" ControlToValidate="NewPassword" ErrorMessage="Required Field" ForeColor="Red" Enabled="False" EnableViewState="False"></asp:RequiredFieldValidator></td>
                        <asp:CompareValidator ID="CompareValidator1" style="margin-left: 137px" runat="server" ControlToValidate="confirmPass_txt" ControlToCompare="NewPassword" ErrorMessage="Passwords must match!" ForeColor="Red" Font-Size="Large" ></asp:CompareValidator>
                        
                        <td style="width: 289px; height: 53px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 53px; width: 161px; font-size: large;">Account Status:</td>
                        <td style="height: 53px; width: 420px;">
                            <asp:DropDownList ID="acct_dropdownlist" class="form-control" runat="server" Height="37px" Width="248px" style="font-size: large">
                                <asp:ListItem Value="0">Inactive</asp:ListItem>
                                <asp:ListItem Value="1">Active</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                       
                        <td style="width: 193px; height: 54px; font-size: large;" id="confirmPass_label" runat="server">Confirm Password:</td>
                        <td style="height: 64px; margin-left: 160px; width: 574px;">
                            
                            <asp:TextBox ID="confirmPass_txt" class="form-control" placeholder="Confirm Password" runat="server" type="password" style="font-size: large"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="confirmPassRFV" runat="server" ControlToValidate="confirmPass_txt" ErrorMessage="Required field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" style="margin-left: 137px" runat="server" ControlToValidate="NewPassword" ControlToCompare="confirmPass_txt" ErrorMessage="Passwords must match!" ForeColor="Red" Font-Size="Large" ></asp:CompareValidator>
                        </td>
                         <td style="width: 289px; height: 64px">
                             &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </td>
                        <td style="height: 64px; width: 161px; font-size: large;">User Role:</td>
                        <td style="height: 64px; width: 420px;">
                            <asp:DropDownList ID="RoleDropDownList" class="form-control" runat="server" Height="37px" Width="248px" style="font-size: large">
                                <asp:ListItem Value="0">Regular User</asp:ListItem>
                                <asp:ListItem Value="1">Department Supervisor</asp:ListItem>
                                 <asp:ListItem Value="8">HR Administrator</asp:ListItem>
                                 <asp:ListItem Value="9">Administrator</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px; width: 193px;"></td>
                        <td style="width: 574px"><asp:Literal ID="LitAlert" runat="server" Visible="False"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td style="width: 193px"><asp:Button ID="CancelBtn" runat="server" Text="CANCEL" Height="54px" BackColor="#3366FF" BorderColor="#3366FF" CssClass="mt-0" Font-Bold="True" Font-Size="Larger" OnClick="CancelBtn_Click"/></td>
                        <td style="width: 574px"></td>
                        <td style="width: 289px; height: 54px"></td>
                        <td style="width: 161px"></td>
                        <td style="width: 420px"><asp:Button ID="SubmitBtn" runat="server" Text="SUBMIT" Height="54px" Width="217px" BackColor="#3366FF" BorderColor="#3366FF" CssClass="mt-0" Font-Bold="True" Font-Size="Larger" OnClick="SubmitBtn_Click"/></td>
                             </tr>
                </table>
              
                  
        </div>      
          <%--  <div style="width: 376px; height: 53px">
                           
                        </div>--%>
        </form>
        </asp:Panel>
<%--            </asp:Form>--%>
   
   
</asp:Content>


