using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Services.Description;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography;

namespace TestProject
{
    public partial class RequestOff : System.Web.UI.Page
    {
        string current_user;
        static int year = DateTime.Now.Year;
        DateTime firstDay = new DateTime(year, 1, 1);
        DateTime requestStarted;
        decimal vacationLeft;
        decimal personalLeft;
        Boolean fullday;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                current_user = (string)(Session["USER"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
            try
            {
                using (var PCTModel = new PCTEntities())
                {
                    var selectedUser = (from ua in PCTModel.userAccounts
                                        join u in PCTModel.employees on ua.emp_id equals u.ID
                                        where ua.ID.ToString() == current_user
                                        select ua).First();
                    requestStarted = DateTime.Now;
                    string supervisor_id = selectedUser.supervisor.ToString();
                    fullDayHours.Text = selectedUser.fullDayHours.ToString();
                    lunch.Text = selectedUser.lunch.ToString();
                    LunchPD.Text = selectedUser.lunch.ToString();
                    var selectSupervisor = (from s in PCTModel.userAccounts
                                            where s.ID.ToString() == supervisor_id
                                            select s).First();

                    deptManagerbox.Text = (string)(selectSupervisor.first_name + ' ' + selectSupervisor.last_name);
                    creatorbox.Text = (selectedUser.first_name + ' ' + selectedUser.last_name).ToString();
                    deptDropDownList.SelectedValue = selectedUser.employee.dept_id.ToString();

                    decimal carryOverV = Convert.ToDecimal(selectedUser.vacation_carryOver);
                    decimal carryOverP = Convert.ToDecimal(selectedUser.personal_carryOver);

                    DateTime today = DateTime.Today;
                    DateTime hireDate = Convert.ToDateTime(selectedUser.employee.hireDate);

                    decimal PersonalMax = 40;
                    var daysOfEmployment = Convert.ToDecimal((today - hireDate).TotalDays);
                    calc_timeAvailable(daysOfEmployment);
                    //if an employee's lenght of employment turned 1 year this year then calculate their available hours based on the month they were employed for a year
                    var startBenefitsDate = hireDate.AddYears(1);
                    decimal PredictedVHours;
                    decimal PredictedPHours;
                    decimal accruedVHours = 0;
                    decimal accruedPHours = 0;
                    if (startBenefitsDate.ToString("yyyy") == today.ToString("yyyy"))
                    {
                        int hiredateMnum = hireDate.Month;
                        var MonthsLeftofYear = (12 - hiredateMnum);
                        PredictedVHours = MonthsLeftofYear * 8;
                        PredictedPHours = MonthsLeftofYear * 4;


                        //cannot exceed the max allowed for the year
                        if (PredictedVHours > 80)
                        {
                            PredictedVHours = 80;
                        }
                        if (PredictedPHours > 40)
                        {
                            PredictedPHours = 40;
                        }

                        forecastedVHrs.Text = (PredictedVHours + selectedUser.vacation_carryOver).ToString();
                        forecastedPHrs.Text = (PredictedPHours + selectedUser.personal_carryOver).ToString();

                        //calc currently available hours
                        if (today > startBenefitsDate)
                        {
                            int mtoday = today.Month;
                            int mstartdate = startBenefitsDate.Month;
                            int monthDiff = (mtoday - mstartdate);
                            if (monthDiff != 0)
                            {
                                accruedVHours = monthDiff * 8;
                                accruedPHours = monthDiff * 4;

                                var remainingVHrs = (accruedVHours - selectedUser.usedVHours);
                                var remainingPHrs = (accruedPHours - selectedUser.usedPHours);
                                vacationHrsbox.Text = (accruedVHours.ToString() + " / " + remainingVHrs.ToString());
                                personalHrsbox.Text = accruedPHours.ToString() + " / " + remainingPHrs.ToString();

                            }
                            else
                            {
                                vacationHrsbox.Text = (" 0 / 0 ");
                                personalHrsbox.Text = (" 0 / 0 ");
                            }
                        }
                        //Set the textboxes to display hours remaining and total hours
                    }
                    else if (daysOfEmployment < 365)
                    {

                        vacationHrsbox.Text = (" 0 / 0 ");
                        personalHrsbox.Text = (" 0 / 0 ");

                    }
                    else
                    {

                        PredictedVHours = (vacationMax + carryOverV);
                        PredictedPHours = (PersonalMax + carryOverP);
                        var thisMonth = today.Month;
                        var currentVHrsAvailable = Convert.ToDecimal(thisMonth) * monthlyVacation;
                        var currentPHrsAvailable = Convert.ToDecimal(thisMonth) * monthlyPersonal;
                        accruedVHours = currentVHrsAvailable + carryOverV;
                        accruedPHours = currentPHrsAvailable + carryOverP;
                    }

                    //double mv = monthlyVacation;
                    //double mp = monthlyPersonal;
                    var remainingVHrs2 = (accruedVHours - selectedUser.usedVHours);
                    var remainingPHrs2 = (accruedPHours - selectedUser.usedPHours);
                    vacationHrsbox.Text = vacationHrsbox.Text = (accruedVHours.ToString() + " / " + remainingVHrs2.ToString());
                    personalHrsbox.Text = (accruedPHours.ToString() + " / " + remainingPHrs2.ToString());

                    //Lastly set carry over
                    if (DateTime.Today == firstDay)
                    {
                        calc_carryOVer(accruedVHours, accruedPHours);
                        selectedUser.personal_carryOver = Convert.ToDecimal(personalLeft);
                        selectedUser.vacation_carryOver = Convert.ToDecimal(vacationLeft);
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            SummaryPanel.Visible = true;
        }

        public void calc_carryOVer(decimal accruedVTimeLeft, decimal accruedPTimeLeft)
        {
            //might need to create separate class

            //will this clear the carry over field each year.
            int year = DateTime.Now.Year;
            DateTime firstDayyear = new DateTime(year, 1, 1);

            if (DateTime.Today == firstDayyear)
            {
                if (accruedVTimeLeft > 40)
                {
                    vacationLeft = 40;
                }
                else
                {
                    vacationLeft = accruedVTimeLeft;
                }
                if (accruedPTimeLeft > 80)
                {
                    personalLeft = 80;
                }
                else
                {
                    personalLeft = accruedPTimeLeft;
                }


            }
            return;
        }

        protected void PartDay_btn_Click(object sender, EventArgs e)
        {

            MultiView1.ActiveViewIndex = 1;
            displayTypeH.Text = TypeRequest_dropdown.SelectedItem.ToString();
            fullday = false;
        }

        protected void FullDay_btn_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            fullday = true;
            displayTypeF.Text = TypeRequest_dropdown.SelectedItem.ToString();
        }

        protected void comment_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

       

        string[] scopes = new string[] {
                CalendarService.Scope.Calendar, // Manage your calendars
 	            //CalendarService.Scope.CalendarReadonly // View your Calendars
         };
        string insertedEventId;
        private void CreateCalEvent(TestProject.request request) {
            //Get details of request
            string userEmail;
            string supervisorEmail;
            string fullname;
            TestProject.userAccount user1;
            using (var Googlecontext = new PCTEntities())
            {
                user1 = (from ua in Googlecontext.userAccounts
                         join u in Googlecontext.employees on ua.emp_id equals u.ID
                         where ua.ID.ToString() == request.userAccount_id.ToString()
                         select ua).First();
                userEmail = user1.email;
                fullname = (user1.first_name + " "+ user1.last_name +" Off");
                string supervisor_id = user1.supervisor.ToString();

                //get supervisors email
                var selectSupervisor = (from s in Googlecontext.userAccounts
                                        where s.ID.ToString() == supervisor_id
                                        select s).First();
                //supervisorEmail = selectSupervisor.email;
            }
           
            var certificate = new X509Certificate2(@"C:\Users\glinn\Source\Repos\TestProject\TestProject\SeniorProject-ee5b3ab2ec84.p12", "notasecret", X509KeyStorageFlags.Exportable);
           
            var serviceAccountEmail = "requestoff@seniorproject-258919.iam.gserviceaccount.com";
            ServiceAccountCredential credential = new ServiceAccountCredential(
                 new ServiceAccountCredential.Initializer(serviceAccountEmail)
                 {
                     Scopes = scopes
                 }.FromCertificate(certificate));


            // Create the service.
            CalendarService service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "SeniorProject",
            });

            Google.Apis.Calendar.v3.Data.Event calEvent = new Google.Apis.Calendar.v3.Data.Event();
            //Title of the event
            calEvent.Summary = fullname;
            calEvent.ColorId = "5";
            //calEvent.Description = "";
            //Department
            calEvent.Location = deptDropDownList.SelectedItem.ToString();
            if (fullday == true)
            {

                DateTime newform = Convert.ToDateTime(request.startDate);
                DateTime newform2 = Convert.ToDateTime(request.startDate);

                calEvent.Start = new Google.Apis.Calendar.v3.Data.EventDateTime {
                    DateTime = newform };

                calEvent.End = new Google.Apis.Calendar.v3.Data.EventDateTime
                {
                    DateTime = newform2
                };

                //new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = request.startDate.ToString("yyyy-mm-dd") }
            }
            else
            {
                calEvent.Start = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = request.startDate + request.startTime };
                calEvent.End = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = request.endDate + request.endTime };
            }
            //calEvent.Attendees = 
            //calEvent.Attendees = new Google.Apis.Calendar.v3.Data.EventAttendee[]
            //{
                 //new Google.Apis.Calendar.v3.Data.EventAttendee() { Email = "15linng@gmail.com"},
                 //new Google.Apis.Calendar.v3.Data.EventAttendee() { Email = "gabrielle@regscan.com"}
             //};
            var newEventRequest = service.Events.Insert(calEvent, "regscantimeoff@gmail.com");
            var eventResult = newEventRequest.Execute();
            //get event id
            insertedEventId = eventResult.Id;
          
        }

        //calc_timeAvailable variables:
        decimal monthlyVacation;
        decimal monthlyPersonal;
        decimal vacationMax;
        public void calc_timeAvailable(decimal daysofemp)
        {

            if (daysofemp > 365 && daysofemp < 1460 || daysofemp == 365 || daysofemp == 1460)
            {
                monthlyVacation = 8;
                monthlyPersonal = 4;
                vacationMax = 80;
            }
            else if (daysofemp > 1825 && daysofemp < 3285 || daysofemp == 1825 || daysofemp == 3285)
            {
                monthlyVacation = 12;
                monthlyPersonal = 4;
                vacationMax = 120;
            }
            else if (daysofemp >= 3650)
            {
                monthlyVacation = 16;
                monthlyPersonal = 4;
                vacationMax = 160;
            }
            else
            {
                monthlyPersonal = 0;
                monthlyVacation = 0;
                vacationMax = 0;
            }

        }

        //when a user clicks submit for a full day request off
        protected void submitFD(object sender, EventArgs e)
        {
            request FDRequest = new request();
            decimal totalHours;
            try
            {
                using (var FDreqcontext = new PCTEntities())
                {
                    FDRequest.dept_id = Convert.ToInt32(deptDropDownList.SelectedValue);
                    FDRequest.requestType_id = Convert.ToInt32(TypeRequest_dropdown.SelectedValue);
                    FDRequest.userAccount_id = Convert.ToInt32(current_user);
                    FDRequest.created = requestStarted;
                    FDRequest.submitted = DateTime.Now;
                    //startDate is datetime instead of date.
                    DateTime fromDate = Convert.ToDateTime(from.Value);
                    DateTime toDate = Convert.ToDateTime(to.Value);
                    //format date
                    //var fromDate2 = fromDate.Date;
                    //var toDate2 = toDate.Date;
                    int dateDiff = Convert.ToInt32((( toDate - fromDate).TotalDays)+1);//switch the to and from
                    totalHours = ((dateDiff * (Convert.ToDecimal(fullDayHours.Text) - Convert.ToDecimal(Convert.ToDecimal(lunch.Text) / 60))));


                    FDRequest.startDate = fromDate;
                    FDRequest.endDate = toDate;
                    FDRequest.totalHours = Convert.ToDecimal(totalHours);
                    //time
                    string newFromDate = fromDate.ToString("hh:mm");
                    string newToDate = toDate.ToString("hh:mm");

                    FDRequest.startTime = TimeSpan.Parse(newFromDate);
                    FDRequest.endTime = TimeSpan.Parse(newToDate);

                    FDRequest.status = "Pending";
                    FDRequest.comments = commentBox2.Text.Trim();
                    //CREATE GOOGLE CALENDAR EVENT
                    CreateCalEvent(FDRequest);
                    //inserts the google calendar event id
                    FDRequest.eventID = insertedEventId;
                    //update userAccount forcasted and current available hours

                    FDreqcontext.requests.Add(FDRequest);
                    FDreqcontext.SaveChanges();
                }
                var subLunchFd = (Convert.ToDecimal(lunch.Text) / 60);
                //Update used V hours and  P hours
                using (var useracct = new PCTEntities())
                {
                    var user = (from u in useracct.userAccounts
                                where u.ID.ToString() == current_user
                                select u).First();
                    if(TypeRequest_dropdown.SelectedValue == "0")//Personal Type
                    {
                        
                            user.usedPHours = Convert.ToDecimal((totalHours + user.usedPHours) - subLunchFd);
                        
                    }
                    else //Type is Vacation
                    {
                        
                            user.usedVHours = Convert.ToDecimal((totalHours + user.usedVHours) - subLunchFd);
                        
                    }
                    useracct.SaveChanges();

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            //email to supervisor and user
            emailDetails(FDRequest);
            //redirect to beginning
            Response.Redirect("RequestOff.aspx");
        }

        protected void submitPD(object sender, EventArgs e)
        {
            request PDRequest = new request();
            decimal totalHours;
            try
            {
                using (var PDreqcontext = new PCTEntities())
                {
                    PDRequest.dept_id = Convert.ToInt32(deptDropDownList.SelectedValue);
                    PDRequest.requestType_id = Convert.ToInt32(TypeRequest_dropdown.SelectedValue);
                    PDRequest.userAccount_id = Convert.ToInt32(current_user);
                    PDRequest.created = requestStarted;
                    PDRequest.submitted = DateTime.Now;
                    //startDate is datetime instead of date.
                    DateTime fromDate = Convert.ToDateTime(datepickerSingle.Value);
                    DateTime toDate = Convert.ToDateTime(datepickerSingle.Value);
                    PDRequest.startDate = fromDate.Date;
                    PDRequest.endDate = toDate.Date;
                    var start = PDstartTime.Text; //fix
                    var end = PDendTime.Text;
                    DateTime start2 = Convert.ToDateTime(start);
                    DateTime end2 = Convert.ToDateTime(end);

                    PDRequest.startTime = TimeSpan.Parse(start);
                    PDRequest.endTime = TimeSpan.Parse(end);
                    totalHours = Convert.ToDecimal((end2 - start2).TotalHours);//switch the to and from       
                    PDRequest.totalHours = Convert.ToDecimal(totalHours);
                    PDRequest.status = "Pending";
                    PDRequest.comments = commentbox.Text.Trim();
                    //CREATE GOOGLE CALENDAR EVENT
                    CreateCalEvent(PDRequest);
                    //inserts the google calendar event id
                    PDRequest.eventID = insertedEventId;
                    //update userAccount forcasted and current available hours
                    PDreqcontext.requests.Add(PDRequest);
                    PDreqcontext.SaveChanges();

                }

                //Update used V hours and  P hours
                using (var useracct2 = new PCTEntities())
                {
                    var subLunch = (Convert.ToDecimal(LunchPD.Text) / 60);
                    var user2 = (from u in useracct2.userAccounts
                                 where u.ID.ToString() == current_user
                                 select u).First();
                    if (TypeRequest_dropdown.SelectedValue == "0")//Personal Type
                    {
                        if (!LunchCheckBoxPD.Checked)
                        {
                            user2.usedPHours = Convert.ToDecimal(totalHours + user2.usedPHours);
                        }
                        else
                        {
                            user2.usedPHours = Convert.ToDecimal((totalHours + user2.usedPHours) - subLunch);
                        }
                    }
                    else //Type is Vacation
                    {
                        if (!LunchCheckBoxPD.Checked)
                        {
                            user2.usedVHours = Convert.ToDecimal(totalHours + user2.usedVHours);
                        }
                        else
                        {
                            user2.usedVHours = Convert.ToDecimal((totalHours + user2.usedVHours) - subLunch);
                        }
                    }

                    useracct2.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //email to supervisor and user
            emailDetails(PDRequest);
            //redirect to beginning
            Response.Redirect("RequestOff.aspx");
        }
          
        //Email Dept Manager and User
            protected void emailDetails(TestProject.request RequestInfo)
            {
            DateTime StartDateTime = Convert.ToDateTime(RequestInfo.startDate + RequestInfo.startTime);
            DateTime EndDateTime = Convert.ToDateTime(RequestInfo.endDate + RequestInfo.endTime);
            string userEmail;
            string supervisorEmail;
            TestProject.userAccount user1;
            using (var PCTContext = new PCTEntities())
            {
                user1 = (from ua in PCTContext.userAccounts
                         join u in PCTContext.employees on ua.emp_id equals u.ID
                         where ua.ID.ToString() == current_user
                         select ua).First();
                userEmail = user1.email;
                string supervisor_id = user1.supervisor.ToString();

                //get supervisors email
                var selectSupervisor = (from s in PCTContext.userAccounts
                                        where s.ID.ToString() == supervisor_id
                                        select s).First();
                supervisorEmail = selectSupervisor.email;
                
                //hardcode Request :(
                string type;
                if (RequestInfo.requestType_id.ToString() == "0")
                {
                    type = "Personal";
                }
                else { type = "Vacation"; }

                string lunchInfo;
                if (MultiView1.ActiveViewIndex == 2)
                {
                    lunchInfo = "YES";
                }
                else
                {
                    if (LunchCheckBoxPD.Checked)
                    {
                        lunchInfo = "YES " + lunch.Text + " Minutes";
                    }
                    else
                    {
                        lunchInfo = "NO ";
                    }
                }
                // Create email message
                string emailMessage = "";
                emailMessage += "<html>";
                emailMessage += " <head>";
                emailMessage += " <style>";
                emailMessage += " h1{margin: 0;}";
                emailMessage += " p{margin: 0; height: auto;}";
                emailMessage += " </style>";
                emailMessage += " </head>";
                emailMessage += " <body>";
                emailMessage += " <h1>Request off Submission Details:</h1>";
                emailMessage += " <h2>Employee: " + user1.first_name + " " + user1.last_name + "<br />Department: " + deptDropDownList.SelectedItem.ToString() + "</h2>";
                emailMessage += " <h3>Request Info:<h3>";
                emailMessage += "<p>Start Date/Time: " + StartDateTime + "<br />End Date/Time: " + EndDateTime + "<br />Type: " + type + "<br />Request Submitted: " + RequestInfo.submitted + "<br/>Comments: " + RequestInfo.comments;
                emailMessage += "<br />Total Hours: " + RequestInfo.totalHours + "<br/>Status: " + RequestInfo.status + "<br />Lunch included? "+lunchInfo + "</p>";
                emailMessage += " </body>";
                emailMessage += "</html>";
                MailMessage Usermessage = new MailMessage();
                MailMessage Supervisormessage = new MailMessage();
                SmtpClient smtpClient = new SmtpClient();
                string msg = string.Empty;

                try
                {
                    MailAddress fromAddress = new MailAddress("regscantimeoff@gmail.com");
                    //Customize user message    
                    Usermessage.From = fromAddress;
                    //Usermessage.To.Add(userEmail);
                    Usermessage.To.Add("gabrielle@regscan.com");
                    Usermessage.Subject = "Request Off Confirmation Email";
                    Usermessage.IsBodyHtml = true;
                    Usermessage.Body = emailMessage;
                    //Customize supervisor message
                    Supervisormessage.From = fromAddress;
                    //Supervisormessage.To.Add(supervisorEmail);
                    Supervisormessage.To.Add("gal4@pct.edu");
                    Supervisormessage.Subject = "New Request Off";
                    Supervisormessage.IsBodyHtml = true;
                    Supervisormessage.Body = emailMessage;
                    //message.Attachments.Add(new Attachment(Server.MapPath("uploads/Appointment2.ics")));
                    smtpClient.Host = "smtp.gmail.com";
                    smtpClient.Port = 587;
                    smtpClient.EnableSsl = true;
                    //smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("regscantimeoff@gmail.com", "Regscan1234");
                    smtpClient.Send(Usermessage);
                    smtpClient.Send(Supervisormessage);
                    //litAlert.Text = "Successful";
                }
                catch (Exception ex)
                {
                    throw ex;
                    //litAlert.Text = ex.Message;
                }
            }
            }





            
        }
    
}