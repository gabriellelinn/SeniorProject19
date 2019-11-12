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
        static int year = DateTime.Now.Year;
        DateTime firstDay = new DateTime(year, 1, 1);
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
                    fullDayHours.Text = selectedUser.fullDayHours.ToString();
                    var selectSupervisor = (from s in PCTModel.userAccounts
                                            where s.ID.ToString() == supervisor_id
                                            select s).First();
                    deptManagerbox.Text = (string)(selectSupervisor.first_name + ' '+ selectSupervisor.last_name);
                    creatorbox.Text = (selectedUser.first_name + ' ' + selectedUser.last_name).ToString();
                    deptDropDownList.SelectedValue = selectedUser.employee.dept_id.ToString();
                    
                    double carryOverV = Convert.ToDouble(selectedUser.vacation_carryOver);
                    double carryOverP = Convert.ToDouble(selectedUser.personal_carryOver);
                   
                    DateTime today = DateTime.Today;
                    DateTime hireDate = Convert.ToDateTime(selectedUser.employee.hireDate);
                   
                    double PersonalMax = 40;
                    var daysOfEmployment = (today - hireDate).TotalDays;
                    calc_timeAvailable(daysOfEmployment);
                    //if an employee's lenght of employment turned 1 year this year then calculate their available hours based on the month they were employed for a year
                    var startBenefitsDate = hireDate.AddYears(1);
                    double PredictedVHours;
                    double PredictedPHours;
                    double accruedVHours = 0;
                    double accruedPHours = 0;
                    if (startBenefitsDate.ToString("yyyy") == today.ToString("yyyy"))
                    {
                        int hiredateMnum = hireDate.Month;
                        var MonthsLeftofYear = (12 - hiredateMnum);
                        PredictedVHours = MonthsLeftofYear * 8;
                        PredictedPHours = MonthsLeftofYear * 4;


                        //cannot exceed the max allowed for the year
                        if(PredictedVHours > 80)
                        {
                            PredictedVHours = 80;
                        }
                        if(PredictedPHours > 40)
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
                        var currentVHrsAvailable = Convert.ToInt16(thisMonth) * monthlyVacation;
                        var currentPHrsAvailable = Convert.ToInt16(thisMonth) * monthlyPersonal;
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
                        selectedUser.personal_carryOver = Convert.ToInt32(personalLeft);
                        selectedUser.vacation_carryOver = Convert.ToInt32(vacationLeft);
                    }

                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            SummaryPanel.Visible = true;
        }

        double vacationLeft;
        double personalLeft;
        public void calc_carryOVer(double accruedVTimeLeft, double accruedPTimeLeft)
        {
            //might need to create separate class
            
            //will this clear the carry over field each year.
            int year = DateTime.Now.Year;
            DateTime firstDayyear = new DateTime(year, 1, 1);
          
            if (DateTime.Today == firstDayyear)
            {
                if (accruedVTimeLeft > 40) { 
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
        }

        protected void FullDay_btn_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 2;
            displayTypeF.Text = TypeRequest_dropdown.SelectedItem.ToString();     
        }

        protected void comment_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        //takes in number of da
        double monthlyVacation;
        double monthlyPersonal;
        double vacationMax;
        public void calc_timeAvailable(double daysofemp)
        {
            
            if(daysofemp > 365 && daysofemp < 1460 || daysofemp == 365 || daysofemp == 1460)
            {
                monthlyVacation = 8;
                monthlyPersonal = 4;
                vacationMax = 80;
            }
            else if(daysofemp > 1825 && daysofemp < 3285 || daysofemp == 1825 || daysofemp == 3285 ){
                monthlyVacation = 12;
                monthlyPersonal = 4;
                vacationMax = 120;
            }
            else if(daysofemp >= 3650)
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
            request Request = new request();

            try
            {
                using(var context = new PCTEntities())
                {

                    Request.submitted = DateTime.Now;
                    //startDate is datetime instead of date.
                    DateTime fromDate = Convert.ToDateTime(from);
                    DateTime toDate = Convert.ToDateTime(to);
                    var dateDiff = (fromDate - toDate).TotalDays;
                    Request.startDate = fromDate;
                    Request.endDate = toDate;
                    Request.totalDays = Convert.ToInt32(dateDiff) ;

                    string calculatedHours = fullDayHours.Text.ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void submitPD(object sender, EventArgs e)
        {

        }
    }
}