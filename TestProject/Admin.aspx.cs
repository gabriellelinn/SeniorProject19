using System;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web.UI;





namespace TestProject
{
    public partial class About : Page
    {
        
        public int current_user;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Need to verify user is authorized to view.
            if (Session["USER"] != null)
            {
                current_user = Convert.ToInt32(Session["USER"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            //Do not show anything yet
            GeneralPanel.Visible = false;
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void NewUserbtn_Click(object sender, EventArgs e)
        {
            

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
            UserMode.Text = string.Empty;
            UserMode.Text = "NewUser";

            //Disable Edit User Button
            EditUserbtn.Enabled = false;
            EditUserbtn.Visible = false;
            NewUserbtn.Enabled = false;
            PasswordLabel.InnerText = "Password*:";
            confirmPass_label.InnerText = "Confirm Password*:";
           
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

        protected void UserSelect_Click(object sender, EventArgs e)
        {
            UserMode.Text = string.Empty;
            UserMode.Text = "EditUser";
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
                    String status = selectedUser.accountStatus.ToString();
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
            confirmPassRFV.Enabled= false;
             confirmPass_txt.CausesValidation = false;
            Response.Redirect("Default.aspx");
        }


        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            userAccount userEnt = new userAccount();
            PasswordRFV.Enabled = true;
            confirmPassRFV.Enabled = true;
            try
            {
                //if user is creating a new user
                if (UserMode.Text == "NewUser")
                {
                    //
                    using (var PCTModel = new PCTEntities())
                    {
                        //post
                        int fullday;
                        int lunchBreak;
                        using (var context = new PCTEntities())
                        {
                            userEnt.first_name = fname_txt.Text;
                            userEnt.last_name = lname_txt.Text;
                            userEnt.email = username_txt.Text;
                            userEnt.dateCreated = DateTime.Now;
                            userEnt.createdBy = current_user;
                            userEnt.emp_id = Convert.ToInt32(EmployeeDropDown.SelectedValue);
                            userEnt.userRole_id = Convert.ToInt32(RoleDropDownList.SelectedValue);
                            if (empStat_dropdownlist.SelectedItem.ToString() == "Full-Time")
                            {
                                fullday = 8;
                                lunchBreak = 60;
                            }
                            else if (empStat_dropdownlist.SelectedItem.ToString() == "Part-Time")
                            {
                                fullday = 4;
                                lunchBreak = 15;
                            }
                            else
                            {
                                fullday = 0;
                                lunchBreak = 0;
                            }
                            userEnt.fullDayHours = fullday;
                            userEnt.lunch = lunchBreak;
                            //BAD PRACTICE 
                            userEnt.hashedPassword = NewPassword.Value.ToString();
                            //account status, and user role
                            int accountStat = Convert.ToInt16(acct_dropdownlist.SelectedValue);
                            userEnt.accountStatus = Convert.ToBoolean(accountStat);


                            //------------------create a hashed password-----------------------
                            //string password = NewPassword.Value.ToString();
                            // // Run the functions on the code, 
                            // string hashed = Crypto.Hash(password, "MD5");
                            // string sha256 = Crypto.SHA256(password);
                            // string sha1 = Crypto.SHA1(password);

                            //string salt = Crypto.GenerateSalt();

                            // hashedPassword = Crypto.HashPassword(password);

                            // // First parameter is the previously hashed string using a Salt
                            // verify = Crypto.VerifyHashedPassword("{hash_password_here}", password);
                            //}

                            context.userAccounts.Add(userEnt);
                            context.SaveChanges();

                        }

                    }
                }
                if (UserMode.Text == "EditUser")
                {
                    PasswordRFV.Enabled = false;
                    confirmPassRFV.Enabled = false;

                    using (var editUserSub = new PCTEntities())
                    {
                        var User = (from ua in editUserSub.userAccounts
                                    where ua.ID.ToString() == UserDropDown.SelectedValue
                                    select ua).First();

                        User.first_name = fname_txt.Text;
                        User.last_name = lname_txt.Text;
                        User.email = username_txt.Text;
                        User.lastUpdated = DateTime.Now;
                        User.userRole_id = Convert.ToInt32(RoleDropDownList.SelectedValue);
                        int accountStat = Convert.ToInt16(acct_dropdownlist.SelectedValue);
                        User.accountStatus = Convert.ToBoolean(accountStat);
                        //BAD PRACTICE 
                        bool np = string.IsNullOrEmpty(NewPassword.Value.ToString());
                        bool cp = string.IsNullOrEmpty(confirmPass_txt.Text);
                        if (np == false && cp == false)
                        {
                            User.hashedPassword = NewPassword.Value.ToString();
                        }
                        //account status, and user role
                        int accountStatus2 = Convert.ToInt16(acct_dropdownlist.SelectedValue);
                        userEnt.accountStatus = Convert.ToBoolean(accountStatus2);


                        //------------------create a hashed password-----------------------
                        //string password = NewPassword.Value.ToString();
                        // // Run the functions on the code, 
                        // string hashed = Crypto.Hash(password, "MD5");
                        // string sha256 = Crypto.SHA256(password);
                        // string sha1 = Crypto.SHA1(password);

                        //string salt = Crypto.GenerateSalt();

                        // hashedPassword = Crypto.HashPassword(password);

                        // // First parameter is the previously hashed string using a Salt
                        // verify = Crypto.VerifyHashedPassword("{hash_password_here}", password);
                        //}

                        editUserSub.SaveChanges();

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