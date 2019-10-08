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
            //String userName = Request.Form["UserName"];


            //using (var PCTModel = new PCTEntities())
            //{
            //    var username = (from c in PCTModel.userAccounts
            //                    where c.userName == userName
            //                    select c).First();
            //    if (username == null)
            //    {
                    
            //    }
            //}
        }
    }
}