using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace TestProject
{
    public partial class RequestOff : System.Web.UI.Page
    {
        string current_user;
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


                    string supervisor_id = selectedUser.supervisor.ToString();

                    var selectSupervisor = (from s in PCTModel.userAccounts
                                            where s.ID.ToString() == supervisor_id
                                            select s).First();
                    deptManagerbox.Text = (string)(selectSupervisor.first_name + ' '+ selectSupervisor.last_name);
                    creatorbox.Text = (selectedUser.first_name + ' ' + selectedUser.last_name).ToString();
                    deptDropDownList.SelectedValue = selectedUser.employee.dept_id.ToString();
                    VacationHrsbox.Text = selectedUser.usedVHours.ToString();
                    PersonalHrsbox.Text = selectedUser.usedPHours.ToString();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            SummaryPanel.Visible = true;

        }

        protected void PartDay_btn_Click(object sender, EventArgs e)
        {
         
            MultiView1.ActiveViewIndex = 1;
            displayTypeH.Text = TypeRequest_dropdown.SelectedItem.ToString();


        }

        protected void FullDay_btn_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 2;
            displayTypeF.Text = TypeRequest_dropdown.SelectedItem.ToString();

        }

      

        protected void comment_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}