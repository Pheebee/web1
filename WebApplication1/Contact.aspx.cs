﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;

namespace WebApplication1
{
    public partial class Contact : TicketInfo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();
        }
    }
}