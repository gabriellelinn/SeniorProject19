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
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

        <asp:View ID="View1" runat="server">
            <div class="auto-style13"></div>
             <div class="auto-style12">
                 <span class="auto-style3">Type of Request:    </span><asp:DropDownList ID="TypeRequest_dropdown" runat="server" DataSourceID="TypeRequest" DataTextField="name" DataValueField="ID" Height="46px" Width="321px">
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
                        <div class="center"><strong>
                        <asp:Button ID="PartDay_btn" runat="server" CssClass="auto-style11" Height="96px" OnClick="PartDay_btn_Click" Text="Half Day" Width="326px" />
                        </strong></div></td>
                   <td class="auto-style9">
                   </td> 
                   <td>
                       <div class="center"><strong>
                       <asp:Button ID="FullDay_btn" runat="server" CssClass="auto-style11" Height="96px" OnClick="FullDay_btn_Click" Text="Full Day" Width="326px" />
                       </strong></div></td>
               </tr>
                
          </table>

        </asp:View>


        <asp:View ID="HalfDayView2" runat="server">


        </asp:View>


        <asp:View ID="FullDayView3" runat="server">

        </asp:View>

    </asp:MultiView>
    
    </form>
    
</body>
</html>
