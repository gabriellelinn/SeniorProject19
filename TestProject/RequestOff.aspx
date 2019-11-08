<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestOff.aspx.cs" Inherits="TestProject.RequestOff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Request Off</title>
    <style type="text/css">

        .auto-style3 {
            font-size: x-large;
        }
      
  .center {
  margin: auto;
  width: 60%;
  padding: 10px;
}
        .auto-style7 {
            width: 272px;
        }
        
        .auto-style9 {
            width: 181px;
        }
        
        .auto-style11 {
            font-size: large;
            font-weight: bold;
        }
        .auto-style12 {
            text-align: center;
        }
        
        .auto-style13 {
            height: 43px;
        }
        
        .auto-style14 {
            font-size: xx-large;
            margin:auto;
        }
        
        .auto-style15 {
            margin-left: 20px;
        }
        
        .auto-style16 {
            font-size: large;
            width: 259px;
        }
        
        .auto-style17 {
            width: 452px;
        }
        
        .auto-style18 {
            height: 236px;
        }
        
        .auto-style19 {
            font-size: large;
            width: 259px;
            margin-left: 25px;
        }
        .auto-style20 {
            font-size: large;
            width: 259px;
            margin-left: 17px;
        }
        .auto-style21 {
            height: 122px;
        }
        
        .auto-style22 {
            margin-left: 127px;
        }
        
        .auto-style24 {
            margin-left: 1681px;
            margin-right:20px;
        }
        
        .auto-style25 {
            margin-left: 7px;
        }
        
        .auto-style26 {
            width: 92px;
        }
        
    </style>
    <script src="../../Scripts/jquery-1.3.2.min.js" lang ="javascript" type="text/javascript"></script>
<script src = "../../Scripts/jquery-ui-1.7.1.custom.min.js" type = "text/javascript"></script> 
</head>
<body>
    <form id="form1" runat="server">
        <asp:panel ID="SummaryPanel" runat="server">
            <div class="auto-style24" id="Summary">
                <table align="right" class="auto-style25">
                    <tr>
                        <td class="auto-style26">Department Manager: </td>
                        <td><asp:TextBox ID="deptManagerbox" runat="server" BorderStyle="None"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style26">Creator: </td>
                        <td><asp:TextBox ID="creatorbox" runat="server" BorderStyle="None"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style26">Department: </td>
                        <td><asp:TextBox ID="deptbox" runat="server" BorderStyle="None"></asp:TextBox></td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="auto-style26">Vacation Hours Remaining: </td>
                        <td><asp:TextBox ID="VacationHrsbox" runat="server" BorderStyle="None"></asp:TextBox></td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="auto-style26">Personal Hours Remaining: </td>
                        <td><asp:TextBox ID="PersonalHrsbox" runat="server" BorderStyle="None"></asp:TextBox></td>
                    </tr>
                    <%-- <tr>
                    <td>Floating Holiday Remaining: </td>
                    <td>&nbsp;</td>
                </tr>--%>
                </table>
            </div>
        </asp:panel>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            
            <asp:View ID="View1" runat="server">
                <div class="auto-style13"></div>
                <div class="auto-style12">
                    <span class="auto-style14">
                        <asp:Label ID="Label1" runat="server" Text="Type of Request:" BorderStyle="None"></asp:Label></span><span class="auto-style3"> </span>
                    <asp:DropDownList ID="TypeRequest_dropdown" runat="server" DataSourceID="TypeRequest" DataTextField="name" DataValueField="ID" Height="56px" Width="451px" Font-Size="Larger" CssClass="auto-style15">
                    </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="TypeRequest" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString2 %>" SelectCommand="SELECT [ID], [name] FROM [requestType]"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <table class="auto-style6" align="center">
                    <tr>
                        <td class="auto-style7">
                            <div class="center">
                                <strong>
                                    <asp:Button ID="PartDay_btn" runat="server" CssClass="auto-style11" Height="96px" OnClick="PartDay_btn_Click" Text="Half Day" Width="326px" />
                                </strong>
                            </div>
                        </td>
                        <td class="auto-style9"></td>
                        <td>
                            <div class="center">
                                <strong>
                                    <asp:Button ID="FullDay_btn" runat="server" CssClass="auto-style11" Height="96px" OnClick="FullDay_btn_Click" Text="Full Day" Width="326px" />
                                </strong>
                            </div>
                        </td>
                    </tr>

                </table>

            </asp:View>


            <asp:View ID="HalfDayView2" runat="server">
                <header>
                    <h1 class="auto-style12">Half Day Request Off</h1>
                </header>
                <h2>
                    <asp:Label ID="displayTypeH" runat="server"></asp:Label>
                </h2>
                <br />
                <br />
                <div class="auto-style22">
                    <asp:Label ID="selectDate_lbl" runat="server" CssClass="auto-style3 center" Text="Select Date: "></asp:Label>
                    <input type="date" name="Date" id="halfDayDate" class="auto-style16" />
                    <br />
                    <div class="auto-style18"></div>
                    <div class="auto-style21">
                        <asp:Label ID="startTime_lbl" runat="server" CssClass="auto-style3 center" Text="Start Time:"></asp:Label>
                        <input type="time" name="Date" id="HDstartTime" class="auto-style20" />
                    </div>
                    <div class="auto-style21">
                        <asp:Label ID="endTime_lbl" runat="server" CssClass="auto-style3 center" Text="End Time:"></asp:Label>
                        <input type="time" name="Time" id="FDstartTime" class="auto-style19" />
                    </div>
                </div>
            </asp:View>


            <asp:View ID="FullDayView3" runat="server">
                <header>
                    <h1 class="auto-style12">Full Day Request Off</h1>
                </header>
                <h3>
                    <asp:Label ID="displayTypeF" runat="server"></asp:Label>
                </h3>
                <br />
                <br />
                <asp:Label ID="stDate_lbl" runat="server" CssClass="auto-style3 center" Text="Select Start and End Date: "></asp:Label>
                <div>
                    <table>
                        <tr>
                            <td>
                                <input type="date" name="Date" id="FDStart_Date" class="auto-style16" /></td>
                            <td class="auto-style17"></td>
                            <td>
                                <input type="date" name="Date" id="FDEnd_Date" class="auto-style16" /></td>
                        </tr>
                    </table>
                </div>

            </asp:View>

        </asp:MultiView>
    
    </form>
    
</body>
</html>
