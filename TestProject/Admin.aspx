<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TestProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="655px" Width="1703px" style="margin-left: 150px; margin-top: 0px; margin-right: 0px;" >
            <div class="text-left" style="height: 44px; width: 1476px; margin-top: 0px; margin-bottom: 23px; margin-left: 0px; margin-right: 0px;">
                <p class="text-center" style="font-size: xx-large; width: 1477px; margin-left: 0;">
                    My Request Off</p>
            </div>
            <div class="text-center" style="height: 68px; width: 1478px; margin-top: 0px; margin-left: 0px; margin-right: 0px;">
                <strong>
                <asp:Button ID="NewUserbtn" runat="server" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" Font-Size="X-Large" Height="68px" OnClick="NewUserbtn_Click" style="left:50%; margin-left: 14px" Text="New User" Width="238px" />
                </strong>
                <asp:Button ID="EditUserbtn" runat="server" Font-Size="X-Large" Height="68px" OnClick="EditUserbtn_Click" style="margin-right: 14px; margin-left:477px" Text="Edit User" Width="238px" CssClass="col-xs-pull-6" BackColor="#009999" BorderColor="#009999" BorderStyle="Outset" Font-Bold="True" />
            </div>
        <div style="margin-bottom: 0px">

            &#39;<asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [first_name] + ' ' + [last_name] AS Name, [ID] FROM [userAccount]  ORDER BY [last_name]"></asp:SqlDataSource>
            <br />

        </div>
        <div style="height: 63px; width: 1699px; margin-top: 0px;" class="text-center">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" style="font-size: large" Text="Select User: "></asp:Label>
            <asp:DropDownList ID="UserDropDown" runat="server" BackColor="White" DataSourceID="usersDataSource" DataTextField="Name" DataValueField="ID" Font-Size="Large" ForeColor="#000099" Height="48px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="font-size: large" Width="435px">
            </asp:DropDownList>
            </div>
        
                <form id="NewUser_Form">


<div class="container-fluid">
 
  <%--<div class="row">
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-3</div>
    <div class="col-sm-4" style="background-color:lavenderblush;">.col-sm-6</div>
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-3</div>
  </div>--%>
</div>

                                    <div class="form-group row" style="width: 1698px; height: 53px">
                                        <label for="fname" class="col-sm-4 col-form-label" style="left: 0px; top: 0px; width: 99%">First Name:</label>
                                        <div class="col-sm-4" style="left: 0px; top: 0px; width: 99%;">
                                        <input class="form-control" type="text" id="fname"  placeholder="First Name" style="width: 34%">
                                        </div>
                                        </div>
                      <div class="form-group row" style="width: 1698px; height: 53px">
                                        <div class="col-sm-4" style="left: 966px; top: 0px; width: 42%">
                                           <label for="hireDate" class="col-sm-4 col-form-label" style="left: 0px; top: 0px; width: 95%">Hire Date:</label>
                                            <input class="form-control" type="date" id="hireDate" style="width: 34%" />
                                        </div>
                                    
                                        <input id="lname" class="form-control" placeholder="Last Name" style="width: 34%; margin-top: 0;" type="text"></div>

                                    <div class="form-group row"> 
                                        
                                        <label for="lname" class="col-sm-4 col-form-label" style="left: 0px; top: -45px">Last Name:</label>
                                        <div class="col-sm-4" style="left: 0px; top: 0px; width: 33%">
                                            &nbsp;</div>
                                        </div>
                                    <div class="form-group row" >
                                        <label for="createEmail" class="col-2 col-form-label" style="left: 0px; top: 0px; width: 97%">Username:</label>
                                        <div class="col-10" style="left: 0px; top: 0px; width: 97%">
                                        <input type="email" class="form-control" id="NewEmail" aria-describedby="emailHelp" placeholder="Employee email" style="width: 34%">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="createPassword" class="col-2 col-form-label" style="left: 0px; top: 0px; width: 97%">Password:</label>
                                         <div class="col-10" style="left: 0px; top: 0px; width: 97%">
                                        <input type="password" class="form-control" id="NewPassword" placeholder="Password" style="width: 34%">
                                         </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="confirmPassword" class="col-2 col-form-label" style="left: 0px; top: 0px; width: 97%">Confirm Password:</label>
                                        <div class="col-10" style="left: 0px; top: 0px; width: 97%">
                                        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" style="width: 34%">
                                            </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                       <fieldset class="form-group">
                                        <legend>Gender</legend>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked> Female
                                            </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2"> Male
                                            </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    </fieldset>
                                </form>
         
        
         
                                
        
          </asp:Panel>
       
</asp:Content>
  
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
</asp:Content>

