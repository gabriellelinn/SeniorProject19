using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.IO;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Services.Description;
using System.Security.Cryptography.X509Certificates;

namespace TestProject
{
    public partial class calendar : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 //           string[] scopes = new string[] {
 //               CalendarService.Scope.Calendar, // Manage your calendars
 //	            CalendarService.Scope.CalendarReadonly // View your Calendars
 //};

 //           var certificate = new X509Certificate2("C:/Users/glinn/Source/Repos/TestProject/TestProject/SeniorProject-81fed4e75236.json", "notasecret", X509KeyStorageFlags.Exportable);
 //           var serviceAccountEmail = "requestoff@seniorproject-258919.iam.gserviceaccount.com";
 //           ServiceAccountCredential credential = new ServiceAccountCredential(
 //                new ServiceAccountCredential.Initializer(serviceAccountEmail)
 //                {
 //                    Scopes = scopes
 //                }.FromCertificate(certificate));


 //           // Create the service.
 //           CalendarService service = new CalendarService(new BaseClientService.Initializer()
 //           {
 //               HttpClientInitializer = credential,
 //               ApplicationName = "SeniorProject",
 //           });

 //           Google.Apis.Calendar.v3.Data.Event calEvent = new Google.Apis.Calendar.v3.Data.Event();

 //           calEvent.Summary = "";
 //           calEvent.Description = "";
 //           calEvent.Location = "";
 //           calEvent.Start = new Google.Apis.Calendar.v3.Data.EventDateTime
        

            //var requestOff = new Event();
            //EventDateTime start = new EventDateTime();
            //start.DateTime = new DateTime(2019, 3, 11, 10, 0, 0);

            //EventDateTime end = new EventDateTime();
            //end.DateTime = new DateTime(2019, 3, 11, 10, 30, 0);


            //requestOff.Start = start;
            //requestOff.End = end;
            //requestOff.Summary = "New Event";
            //requestOff.Description = "Description...";

            //var calendarId = "regscantimeoff@gmail.com";

            //    Google.Apis.Calendar.v3.CalendarService g = new Google.Apis.Calendar.v3.CalendarService();
            //    Google.Apis.Calendar.v3.Data.Event ev = new Google.Apis.Calendar.v3.Data.Event();

            //    EventDateTime start = new EventDateTime();
            //    start.DateTime = "09/09/2012 15:00";

            //    EventDateTime end = new EventDateTime();
            //    end.DateTime = "09/09/2012 18:00";

            //    //ev.Title < ?????
            //    ev.Start = start;
            //    ev.End = end;
            //    ev.Description = "Description...";
            //    g.Events.Insert(ev, "sdfskdjfj334k324jk324@group.calendar.google.com");
            //}
            //catch (Exception ex)
            //{
            //    string error = ex.Message;
            //}//////////////////new/////////////////////
            //var certificate = new X509Certificate2("https://www.googleapis.com/robot/v1/metadata/x509/requestoff%40seniorproject-258919.iam.gserviceaccount.com");
            //var credential = new ServiceAccountCredential(new ServiceAccountCredential.Initializer("service account email id")
            //{
            //    Scopes = Scopes
            //}.FromCertificate(certificate));
            ///*Authenticated Successfully */
            //// Create the  Calendar service.
            //CalendarService service = new CalendarService(new BaseClientService.Initializer()
            //{
            //    HttpClientInitializer = credential,
            //    ApplicationName = ApplicationName,
            //});

            //Event myEvent = new Event
            //{
            //    Summary = "test1",
            //    Location = "Gurugram",
            //    Description = "test1",

            //    Start = new EventDateTime() /*Always using future dates*/
            //    {
            //        DateTime = new DateTime(2019, 9, 11, 17, 0, 0),
            //        TimeZone = "(GMT+05:30) India Standard Time"
            //    },
            //    End = new EventDateTime()/*Plus 1 hour from start date*/
            //    {
            //        DateTime = new DateTime(2019, 9, 11, 18, 0, 0),
            //        TimeZone = "(GMT+05:30) India Standard Time"
            //    },

            //    Reminders = new Event.RemindersData()
            //    {
            //        UseDefault = false,
            //        Overrides = new EventReminder[] {
            //        new EventReminder() { Method = "email", Minutes = 2 * 60 }
            //        }
            //    },
            //    Attendees = new List<EventAttendee>()
            //      {
            //        new EventAttendee() { Email = email }
            //      }
            //};
            //EventsResource.InsertRequest request = service.Events.Insert(myEvent, "primary");
            //request.SendNotifications = true;
            //request.MaxAttendees = 2;
            //Event result = request.Execute();
            //return result.Id; /*Event id returned*/


        }

    }
}