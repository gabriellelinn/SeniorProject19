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


namespace TestProject
{
    public partial class myDepartment : System.Web.UI.Page
    {
        string current_user;

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

    }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ClickedBtn(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if(e.CommandName == "ApproveRequest")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                //Gets id of Google Event
                string eventId = selectedRow.Cells[9].Text;
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                //ID of event
                string ID = selectedRow.Cells[11].Text;
                 
            }
            if (e.CommandName == "DenyRequest")
            {
                string id = GridView1.SelectedRow.Cells[0].Text;
                Console.WriteLine(id);
            }
        }
    }
        
 
}