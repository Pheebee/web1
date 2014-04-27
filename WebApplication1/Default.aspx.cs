using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (User.Identity.Name.ToLower() == "admin")
                {
                    Response.Redirect("Administration");
                }
                else
                {
                    Response.Redirect("Home");
                }
            }
            else
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}