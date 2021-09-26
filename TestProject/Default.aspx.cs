using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Calendar.v3;

namespace TestProject
{
    public partial class _Default : Page
    {
        string current_user;
        CalendarService service;
        string[] scopes = new string[] {
                CalendarService.Scope.Calendar }; // Manage your calendars
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                current_user = Session["USER"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void RequestOff_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestOff.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
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
            if (e.CommandName == "Delete")
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
                    
                    if (args.CommandName == "Cancel") { request.status = "Cancelled"; }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private void updateGoogleEvent(CalendarService service2, string EventID, GridViewCommandEventArgs cmdArgs)
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
                    if (cmdArgs.CommandName == "Edit")
                    {
                        //change google calendars summary
                        ///fullname = (userEvent.userAccount.first_name + " " + userEvent.userAccount.last_name + " Off - Approved");
                    }
                    if (cmdArgs.CommandName == "Cancel")
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