using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;

namespace WebApplication1
{
    public partial class SummaryThanks : TicketInfo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserInfo != null) { LoadVariables(); }
            Page.DataBind();
        }

        protected void LoadVariables()
        {
            string tcktChoice = "";
            string playOffChoice = "";

            switch (UserInfo["SeasonPlan"].ToString())
            {
                case "Option1": tcktChoice = "Pay in full for my 2014-2015 Season  Tickets with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + " on March 15*";
                    break;
                case "Option2": tcktChoice = "Pay in full, no later than March 15,  for my 2014-2015 Season Tickets and I am sending a check to*:<br /><span class='indent'>Florida Flames</span><br /><span class='indent'>Attn: " + UserInfo["SalesName"].ToString() + "</span><br /><span class='indent'>211 N. Robinson-Suite 300</span><br /><span class='indent'>Daytona Beach, FL 32114</span>";
                    break;
                case "Option3": tcktChoice = "Pay for my 2014-2015 Season Tickets in Three Monthly Installments with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ". I understand my card will not be charged until March 15.<br /><span class='indent'>33% or $" + UserInfo["Per1"].ToString() + " on March 15 </span><br /><span class='indent'>33% or $" + UserInfo["Per2"].ToString() + " on May 17</span><br /><span class='indent'>34% or $" + UserInfo["Per3"].ToString() + " on July 19</span>";
                    break;
                case "Option4": tcktChoice = "Pay for my 2014-2015 Season Tickets in Six Monthly Installments with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ". I understand my card will not be charged until March 15, if applicable. <br /><span class='indent'>20% or $" + UserInfo["Per4"].ToString() + " on March 15 </span><br /><span class='indent'>16% or $" + UserInfo["Per5"].ToString() + " on April 19</span><br /><span class='indent'>16% or $" + UserInfo["Per6"].ToString() + " on May 17</span><br /><span class='indent'>16% or $" + UserInfo["Per7"].ToString() + " on June 21</span><br /><span class='indent'>16% or $" + UserInfo["Per8"].ToString() + " on July 19</span><br /><span class='indent'>16% or $" + UserInfo["Per9"].ToString() + " on August 16</span>";
                    break;
                case "Option5": tcktChoice = "I would like to renew my 2014-2015 Season Tickets using a different credit card.<br />Please click on the TicketMaster icon below and input Account ID and PIN when prompted or contact your <a href='mailto:" + UserInfo["SalesEmail"].ToString() + "?subject=Message from thunderstm.com " + User.Identity.Name + @"'>Thunder Account Manager</a>";
                    break;
            }

            if (!String.IsNullOrEmpty(UserInfo["PlayoffOption"].ToString()))
            {
                switch (UserInfo["PlayoffOption"].ToString())
                {
                    case "P_Option1": playOffChoice = "<strong>Playoff Ticket Renewal:</strong><br />Yes...I want to order my playoff tickets!<br />At the conclusion of each round, I agree to pay for the 2014 Thunder home playoff games with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ".";
                        break;
                    case "P_Option2": playOffChoice = "<strong>Playoff Ticket Renewal:</strong><br />Yes...I want to order my playoff tickets!<br />I choose to pay in advance for all potential Thunder home playoff games with check, cash or credit card. Any credits from games  not played will be automatically applied to my 2014-2015 Thunder season ticket account unless otherwise requested for refund.";
                        break;
                    case "P_Option3": playOffChoice = "<stong>Playoff Ticket Renewal:</strong><br />I choose to not puchase any 2012 NBA Playoffs tickets and understand my seats will be resold for the 2014 NBA Playoffs.";
                        break;
                }
            }
            else
            {
                playOffChoice = "";
            }

            selSmry.Text = "<p>For your convenience, here is a summary of your renewal:<br /><br /><strong>Total Balance Due:</strong> $" + String.Format("{0:n}", Convert.ToInt32(UserInfo["FullSeasonTotal"].ToString())) + @"<br /><br /><strong>Season Ticket Renewal:</strong><br />" + tcktChoice + @"<br /><br />" + playOffChoice + @"</p>";
        }
    }
}