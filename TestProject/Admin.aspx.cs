using System;
using System.Data;
using System.Linq;
using System.Web.UI;

namespace TestProject
{
    public partial class About : Page
    {
        bool NewUserMode = false;
        bool EditUserMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
        //Need to verify user is authorized to view.
        
            //Do not show anything yet
            GeneralPanel.Visible = false;
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }      
        protected void NewUserbtn_Click(object sender, EventArgs e)
        {
            EditUserMode = false;
            NewUserMode = true;

            if (selectUser.Visible != true && UserDropDown.Visible != true)
            {
                //define variables

                //Enable the option to select an employee
                selectEmployee.Visible = true;
                selectEmployee.Enabled = true;
                EmployeeDropDown.Enabled = true;
                EmployeeDropDown.Visible = true;
                EmployeeSelect.Visible = true;
            }
            else
            {
                GeneralPanel.Visible = true;
                //get rid of edit user options
                selectUser.Visible = false;
                UserDropDown.Visible = false;
                UserSelect.Visible = false;
                //Enable the option to select an employee
                selectEmployee.Visible = true;
                selectEmployee.Enabled = true;
                EmployeeDropDown.Enabled = true;
                EmployeeDropDown.Visible = true;
                EmployeeSelect.Visible = true;
            }

        }

        protected void EditUserbtn_Click(object sender, EventArgs e)
        {
            NewUserMode = false;
            EditUserMode = true;
           
            if (selectEmployee.Visible != true && EmployeeDropDown.Visible
                != true)
            {
                //Enable the option to select an exisiting user 
                selectUser.Visible = true;
                selectUser.Enabled = true;
                UserDropDown.Enabled = true;
                UserDropDown.Visible = true;
                UserSelect.Visible = true;
            }
            else
            {
                //Get rid of new user options
                selectEmployee.Visible = false;
                EmployeeDropDown.Visible = false;
                EmployeeSelect.Visible = false;

                //bring in edit user options
                selectUser.Visible = true;
                selectUser.Enabled = true;
                UserDropDown.Enabled = true;
                UserDropDown.Visible = true;
                UserSelect.Visible = true;

            }
        }

        //Selects an employee to create a new user for
        protected void EmployeeSelect_Click(object sender, EventArgs e)
        {
            //Disable Edit User Button
            EditUserbtn.Enabled = false;
            EditUserbtn.Visible = false;
            NewUserbtn.Enabled = false;
            PasswordLabel.InnerText = "Password*:";
            confirmPass_label.InnerText = "Confirm Password*:";
            PasswordRFV.Enabled = true;
            confirmPassRFV.Enabled = true;
            // hireDate.Value = 

            //fill in form
            try
            {
                using (var PCTModel = new PCTEntities())
                {
                    var selectedEmployee = (from c in PCTModel.employees
                                            where c.ID.ToString() == EmployeeDropDown.SelectedValue
                                            select c).First();
                    fname_txt.Text = selectedEmployee.first_name;
                    lname_txt.Text = selectedEmployee.last_name;
                    username_txt.Text = selectedEmployee.email;
                    empStat_dropdownlist.SelectedValue = selectedEmployee.empStatus_id.ToString();
                    dept_dropdownlist.SelectedValue = selectedEmployee.dept_id.ToString();
                    //Need to parse the DATETIME for hiredate
                    string str = selectedEmployee.hireDate.ToString();
                    string[] HireDateArray = null;
                    char[] splitchar = {' '};
                    HireDateArray = str.Split(splitchar);
                    hireDate.Text = HireDateArray[0];


                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
            //Show Panel that contains the form
            GeneralPanel.Visible = true;

        }

        protected void UserSelect_Click(object sender, EventArgs e)
        {
            //Disable New User Button
            NewUserbtn.Enabled = false;
            NewUserbtn.Visible = false;
            EditUserbtn.Enabled = false;

           
            //Fill in form 
            try
            {
                using (var PCTModel = new PCTEntities())
                {
                    var selectedUser = (from ua in PCTModel.userAccounts
                                        join u in PCTModel.employees on ua.emp_id equals u.ID
                                            where ua.ID.ToString() == UserDropDown.SelectedValue
                                            select ua).First();

                    fname_txt.Text = selectedUser.first_name;
                    lname_txt.Text = selectedUser.last_name;
                    username_txt.Text = selectedUser.email;
                    empStat_dropdownlist.SelectedValue = selectedUser.employee.empStatus_id.ToString();
                    dept_dropdownlist.SelectedValue = selectedUser.employee.dept_id.ToString();
                    String status  = selectedUser.accountStatus.ToString();
                    if (status == "True") { acct_dropdownlist.SelectedValue = "1"; }
                    else { acct_dropdownlist.SelectedValue = "0"; }
     
                    RoleDropDownList.SelectedValue = selectedUser.userRole_id.ToString();


                    //var selectedUserEmp = (from ue in PCTModel.employees
                    //                       where ue.ID.ToString() == UserDropDown.SelectedValue
                    //                       select ue).First();



                    //Need to parse the DATETIME for hiredate
                    string str = selectedUser.employee.hireDate.ToString();
                    string[] HireDateArray = null;
                    char[] splitchar = { ' ' };
                    HireDateArray = str.Split(splitchar);
                    hireDate.Text = HireDateArray[0];
                    

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //Show Panel that contains the form
            GeneralPanel.Visible = true;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx",false);
        }

      
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
          
            //if user is creating a new user
            if (NewUserMode == true)
            {
         
                //if(NewPassword == null || confirmPass_txt.Text == null)
                // {
                //     Response.Write("<script>alert('Must type and confirm password!')</script>");
                //     goto start;
                // }



            }
            
            if(EditUserMode == true)
            {
                PasswordRFV.Enabled = false;
                confirmPassRFV.Enabled = false;
            }
        
        }
    }
}