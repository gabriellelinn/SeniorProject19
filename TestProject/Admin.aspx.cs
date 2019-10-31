using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace TestProject
{
    public partial class About : Page
    {
        
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
            ////Show Panel that contains the form
            //GeneralPanel.Visible = true;



            ////Try to fill in the text fields for a new user
            //try
            //{
            //    using (var PCTModel = new PCTEntities())
            //    {
            //        var username = (from c in PCTModel.userAccounts
            //                        where c.email == usernameTxt
            //                        select c).First();

            //        //Test with hashedPassword which is a string for my test account
            //        var password = (from p in PCTModel.userAccounts
            //                        where p.hashedPassword == passwordTxt
            //                        select p).First();
            //        //if username and password returns 1 then authorize to go to their home page
            //        if (username.email != null && password.hashedPassword != null)
            //        {
            //            //create session
            //            Session["USER"] = usernameTxt;
            //            Response.Redirect("Default.aspx");
            //        }
            //        else
            //        {
            //            Login1.FailureText = "Your username/password is incorrect. Try again!";
            //        }

            //    }
            //}
            //catch
            //{
            //    Login1.FailureText = "Your username/password is incorrect. Try again!";
            //}
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
            //Disable Edit User Button
            EditUserbtn.Enabled = false;
            EditUserbtn.Visible = false;
            NewUserbtn.Enabled = false;
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
                    string str = selectedEmployee.hireDate.ToString();
                    string[] HireDateArray = null;
                    char[] splitchar = {' '};
                    HireDateArray = str.Split(splitchar);
                    hireDate.Text = HireDateArray[0];
                    //hireDate.Text = selectedEmployee.hireDate.ToString();

                    //selectedEmployee.empStatu = empStat_dropdownlist.SelectedValue;
                    //empStat_dropdownlist.SelectedValue = selectedEmployee.empStatu.ToString();

                  

                    //This doesnt work -- selectedEmployee.empStatu = empStat_dropdownlist.SelectedValue;






                }
            }
            catch
            {
                
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


            //Show Panel that contains the form
            GeneralPanel.Visible = true;
        }
    }
}