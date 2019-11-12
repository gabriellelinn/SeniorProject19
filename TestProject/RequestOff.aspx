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
            height: 69px;
            width: 1558px;
            margin-right: 15px;
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
            height: 103px;
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
            margin-left: 1600px;
            margin-right:0px;
        }
        
        .auto-style25 {
            margin-left: 7px;
        }
        
        .auto-style26 {
            width: 92px;
        }
        
        .auto-style28 {
            font-size: medium;
        }
        .auto-style29 {
            font-size: large;
        }
        
        .auto-style30 {
            width: 92px;
            height: 46px;
        }
                
        .auto-style31 {
            margin-left: 4px;
        }
                
        .auto-style32 {
            font-size: large;
            margin-left: 25px;
        }
                
        .auto-style33 {
            height: 262px;
            margin-bottom: 0px;
        }
                
        .auto-style34 {
            height: 72px;
        }
                
        .auto-style35 {
            text-align: left;
            height: 30px;
        }
        .auto-style36 {
            height: 30px;
        }
                
        .auto-style37 {
            text-align: left;
        }
                
        .auto-style38 {
            text-align: left;
            height: 30px;
            width: 324px;
        }
        .auto-style39 {
            text-align: left;
            width: 324px;
        }
        .auto-style40 {
            width: 324px;
        }
        .auto-style41 {
            text-align: center;
            width: 324px;
        }
                
        .auto-style42 {
            height: 79px;
            margin-top: 53px;
            width: 1440px;
        }
                
        .auto-style43 {
            font-size: large;
            margin-right: 43px;
        }
        .auto-style45 {
            font-size: large;
            margin-left: 48px;
        }
                
        .auto-style46 {
            width: 1368px;
        }
        .auto-style47 {
            width: 211px;
        }
        .footer{
            position:fixed;
           left:0px;
           bottom:0px;
           height:90px;
           width:100%;
           background:#80807e;
        }
        .footberbtn{
             padding: 15px 32px;
             text-align: center;
        }
                
    </style>
    <script src="../../Scripts/jquery-1.3.2.min.js" lang ="javascript" type="text/javascript"></script>
<script src = "../../Scripts/jquery-ui-1.7.1.custom.min.js" type = "text/javascript"></script> 
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(function () {
          var dateFormat = "mm/dd/yy",
              from = $("#from")
                  .datepicker({
                      defaultDate: "+1w",
                      changeMonth: true,
                      numberOfMonths: 3
                  })
                  .on("change", function () {
                      to.datepicker("option", "minDate", getDate(this));
                  }),
              to = $("#to").datepicker({
                  defaultDate: "+1w",
                  changeMonth: true,
                  numberOfMonths: 3
              })
                  .on("change", function () {
                      from.datepicker("option", "maxDate", getDate(this));
                  });

          function getDate(element) {
              var date;
              try {
                  date = $.datepicker.parseDate(dateFormat, element.value);
              } catch (error) {
                  date = null;
              }

              return date;
          }
      });
  </script>
    <script>
        $(function () {
            $("#datepickerSingle").datepicker({
                showButtonPanel: true
            });
        });

        function AutoExpand(commentbox) {
            commentbox.style.height = "1px";
            commentbox.style.height = (25 + commentbox.scrollHeight) + "px";
        }
        function AutoExpand2(commentBox2) {
            commentBox2.style.height = "1px";
            commentBox2.style.height = (25 + commentBox2.scrollHeight) + "px";
        }
        </script>
  <%--  <script>
        function Changed(from) {
            document.getElementbyId('requestedHours').value = reqestedHours.value;
        }
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <asp:panel ID="SummaryPanel" runat="server" BorderColor="Teal" CssClass="auto-style31">
            <div class="auto-style24" id="Summary">
                <table align="right" class="auto-style25">
                    <tr>
                        <td class="auto-style26">Manager: </td>
                        <td><asp:TextBox ID="deptManagerbox" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style28"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style26">Creator: </td>
                        <td><asp:TextBox ID="creatorbox" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style28"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style30">Department: </td>
                        <td class="auto-style26"><%--<asp:TextBox ID="deptbox" runat="server" BorderStyle="None" CssClass="auto-style28"></asp:TextBox>--%>
                            <asp:DropDownList ID="deptDropDownList" runat="server" DataSourceID="deptDataSource" DataTextField="name" DataValueField="ID" CssClass="auto-style28" Enabled="false"></asp:DropDownList>         
                            <asp:SqlDataSource ID="deptDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCTConnectionString %>" SelectCommand="SELECT [ID], [name] FROM [department]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="auto-style26">Current Vacation Hrs: </td>
                        <td><asp:TextBox ID="vacationHrsbox" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style29"></asp:TextBox></td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="auto-style26">Current Personal Hrs: </td>
                        <td><asp:TextBox ID="personalHrsbox" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style29"></asp:TextBox></td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="auto-style26">Forcasted Vacation Hrs:</td>
                         <td><asp:TextBox ID="forecastedVHrs" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style29"></asp:TextBox></td>
                    </tr>
                    <tr><td></td></tr>
                     <tr>
                        <td class="auto-style26">Forcasted Personal Hrs:</td>
                         <td><asp:TextBox ID="forecastedPHrs" runat="server" ReadOnly="True" Enabled="False" BorderStyle="None" CssClass="auto-style29"></asp:TextBox></td>
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
               <div class="auto-style33">

               </div>
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

             <%-----------------------------------------------PART DAY REQUEST OFF!---------------------------------------------%>
            <asp:View ID="HalfDayView2" runat="server">
                <header>
                    <h1 class="auto-style12">Half Day Request Off</h1>
                </header>
                <h2>
                    <asp:Label ID="displayTypeH" runat="server" style="margin-left:15px"></asp:Label>
                </h2>
                <br />
                <br />
                <div class="auto-style22">
                    <asp:Label ID="selectDate_lbl" runat="server" CssClass="auto-style3 center" Text="Select Date: "></asp:Label>
                   <input type="text" id="datepickerSingle" class="auto-style16" />
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
                    <div class="auto-style21">
                        <span class="auto-style3 center"><asp:Label runat="server" Text="Comment:"></asp:Label></span>
                        <asp:TextBox ID="commentbox" runat="server" CssClass="auto-style32" Height="27px" Onkeyup="AutoExpand(this)" TextMode="MultiLine" style="overflow:hidden" Width="435px" Rows="2"></asp:TextBox>
                    </div>
                </div>
                <footer class="footer">
                        <table><tr>
                            <td> <asp:Button ID="cancelbtnPD" runat="server" Text="Cancel" Height="61px" Width="186px" CssClass="auto-style45 footerbtn" OnClick="cancel_Click" style="margin-top: 15px"/></td>
                            <td class="auto-style46"></td>
                            <td class="auto-style47"> <span><asp:Button ID="submitbtnPD" runat="server" Text="Submit Request" Height="61px" Width="186px" CssClass="auto-style43 footberbtn" onClick="submitPD" style="margin-top: 15px"/></span></td>
                
                       </tr>
                       </table>
                        </footer>
            </asp:View>

            <%-----------------------------------------------FULL DAY REQUEST OFF!---------------------------------------------%>
            <asp:View ID="FullDayView3" runat="server">
                <header>
                    <h1 class="auto-style12">Full Day Request Off</h1>
                </header>
                <h2>
                    <asp:Label ID="displayTypeF" runat="server" style="margin-left:15px"></asp:Label>
                </h2>
                <br />
                <br />
                <div class="auto-style22">
                        <table>
                            <tr>
                                <td class="auto-style35"><asp:Label ID="stDate_lbl2" runat="server" CssClass="auto-style3 center" Text="Select Start Date: "></asp:Label></td>
                                <td class="auto-style36 auto-style17"></td>
                                <td class="auto-style38"><asp:Label ID="endDate_lbl2" runat="server" CssClass="auto-style3 center" Text="Select End Date: "></asp:Label></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td class="auto-style37">
                                   <input type="text" runat="server" id="from" name="from" class="auto-style29" onchange="javascript:Changed(this)"/>
                                    </td>
                                <td class="auto-style17"></td>
                                <td class="auto-style39">
                                    <input type="text" runat="server" id="to" name="to" class="auto-style29"/>
                                    </td>
                            </tr>
                            <tr><td class="auto-style34"></td></tr>
                            <tr>
                                <td class="auto-style12"><asp:Label ID="stTime_lbl2" runat="server" CssClass="auto-style3 center" Text="Total Hours for Full Day: " style="text-decoration: underline"></asp:Label></td>
                                <td></td>
                                <td class="auto-style40">&nbsp;</td>
                            </tr>
                             <tr><td></td></tr>
                            <tr>
                                <td class="auto-style12"><asp:Label ID="fullDayHours" runat="server" CssClass="auto-style3"></asp:Label></td>
                                <td></td>
                                <td class="auto-style41">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    <div class="auto-style42">
                        <span class="auto-style3 center"><asp:Label runat="server" Text="Comment:"></asp:Label></span>
                        <asp:TextBox ID="commentBox2" runat="server" CssClass="auto-style32" Height="27px" Onkeyup="AutoExpand2(this)" TextMode="MultiLine" style="overflow:hidden" Width="435px" Rows="2"></asp:TextBox>
                    </div>
                     </div>
                    <%--<div class="auto-style12">--%>
                    <footer class="footer">
                        <table><tr>
                            <td> <asp:Button ID="cancelBtnFD" runat="server" Text="Cancel" Height="61px" Width="186px" CssClass="auto-style45 footerbtn" OnClick="cancel_Click" style="margin-top: 15px"/></td>
                            <td class="auto-style46"></td>
                            <td class="auto-style47"> <span><asp:Button ID="submitBtnFD" runat="server" Text="Submit Request" Height="61px" Width="186px" CssClass="auto-style43 footberbtn" onClick="submitFD" style="margin-top: 15px"/></span></td>
                
                       </tr>
                       </table>
                        </footer>
                        <%--</div>--%>
                   
              
            </asp:View>

        </asp:MultiView>
    
    </form>
    
</body>
</html>
