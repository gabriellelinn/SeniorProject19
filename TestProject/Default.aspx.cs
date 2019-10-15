using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestProject
{
    public partial class _Default : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}