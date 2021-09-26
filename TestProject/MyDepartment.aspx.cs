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
    public partial class myDepartment : System.Web.UI.Page
    {
        string current_user;
        CalendarService service;
        string[] scopes = new string[] {
                CalendarService.Scope.Calendar }; // Manage your calendars
    protected void Page_Load(object sender, EventArgs e)
    {
            
            if (Session["USER"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //current_user = user id
            current_user = Session["USER"].ToString();
            bool deptManager;
            try
            {
                using (var deptModel = new PCTEntities())
                {
                    var User = (from u in deptModel.userAccounts
                                join emp in deptModel.employees on u.emp_id equals emp.ID
                                where u.ID.ToString() == current_user
                                select u).FirstOrDefault();
                    //employee is dept manager
                    deptManager = Convert.ToBoolean(User.employee.IsDeptManager);

                    //verify the user is authenticated
                    if (deptManager == true)
                    {
                        deptDropDownList.SelectedValue = User.employee.dept_id.ToString();
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
            var certificate = new X509Certificate2(@"C:\Users\glinn\Source\Repos\TestProject\TestProject\SeniorProject-ee5b3ab2ec84.p12", "notasecret", X509KeyStorageFlags.Exportable);

            var serviceAccountEmail = "requestoff@seniorproject-258919.iam.gserviceaccount.com";
            ServiceAccountCredential credential = new ServiceAccountCredential(
                 new ServiceAccountCredential.Initializer(serviceAccountEmail)
                 {
                     Scopes = scopes
                 }.FromCertificate(certificate));


            // Create the service.
            service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "SeniorProject",
            });

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        //    GridViewRow row = GridView1.SelectedRow;

        //    if (e.CommandName == "Approve")
        //    {
                
        //        //Gets id of Google Event
        //        string eventId = row.Cells[9].Text;
        //        //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
        //        //ID of event
        //        string ID = row.Cells[11].Text;
        //        updateRequest(ID, e);

        //    }
        //    if (e.CommandName == "Deny")
        //    {

               
        //        //Gets id of Google Event
        //        string eventId = row.Cells[9].Text;
        //        //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
        //        //ID of event
        //        string ID = row.Cells[11].Text;
        //        updateRequest(ID, e);
        //        updateGoogleEvent(service, ID, e);
           // }
        }

        protected void ClickedBtn(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                //Gets id of Google Event
                string eventId = selectedRow.Cells[9].Text;
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                //ID of event
                string ID = selectedRow.Cells[11].Text;
                updateRequest(ID, e);

            }
            if (e.CommandName == "Deny")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                //Gets id of Google Event
                string eventId = selectedRow.Cells[9].Text;
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                //ID of event
                string ID = selectedRow.Cells[11].Text;
                updateRequest(ID, e);
                updateGoogleEvent(service, ID, e);
            }
        }
        private void updateRequest(string ID, GridViewCommandEventArgs args)
        {
            //might just want to insert this in other method.
            try
            {
                using (var RequestEntity = new PCTEntities())
                {
                    var request = (from r in RequestEntity.requests
                                   where r.ID.ToString() == ID
                                   select r).FirstOrDefault();
                    if(args.CommandName == "Approve") { request.status = "Approved"; }
                    if(args.CommandName == "Deny") { request.status = "Denied"; }
                 
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        private void updateGoogleEvent(CalendarService service2,string EventID, GridViewCommandEventArgs cmdArgs)
        {
            string fullname;
            try
            {
                //join the request id and join on userAccount id to update the Summary to Approved or Denied
                using (var Googlecontext = new PCTEntities())
                {
                    var userEvent = (from ev in Googlecontext.requests
                                     join u in Googlecontext.userAccounts on ev.userAccount_id equals u.ID
                                     where ev.ID.ToString() == EventID
                                     select ev).First();
                    if (cmdArgs.CommandName == "Approve") 
                    {
                        //change google calendars summary
                        fullname = (userEvent.userAccount.first_name + " " + userEvent.userAccount.last_name + " Off - Approved");
                    }
                    if (cmdArgs.CommandName == "Deny")
                    {
                        
                        //delete event from google calendar
                        service2.Events.Delete("regscantimeoff@gmail.com", EventID).Execute();
                    }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

            
    }
        
 
}