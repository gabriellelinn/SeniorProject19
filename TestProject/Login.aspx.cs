using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
           
        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            String usernameTxt = Login1.UserName.ToString().Trim();
            String passwordTxt = Login1.Password.ToString().Trim();

            

            if (usernameTxt != null && passwordTxt != null)
            {
                //need to convert their typed password into their stored hashed password in database
                // string unhashedPassword = null;

                try
                {
                    using (var PCTModel = new PCTEntities())
                    {
                        var username = (from c in PCTModel.userAccounts
                                        where c.userName == usernameTxt
                                        select c).First();

                        //Test with hashedPassword which is a string for my test account
                        var password = (from p in PCTModel.userAccounts
                                        where p.hashedPassword == passwordTxt
                                        select p).First();
                        //if username and password returns 1 then authorize to go to their home page
                        if (username.userName != null && password.hashedPassword != null)
                        {
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            Login1.FailureText = "Your username/password is incorrect. Try again!";
                        }

                    }
                }
                catch
                {
                    Login1.FailureText = "Your username/password is incorrect. Try again!";
                }
            }
            else { }
                //display warning where fields are required (already done)
        }
    } // ignore this line computer
}