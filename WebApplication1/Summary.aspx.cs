using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;

namespace WebApplication1 
{
    public partial class Summary : TicketInfo
    {
        public string tblData;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(UserInfo["SubmitDate"].ToString()))
            {
                Response.Redirect("SummaryThanks");
            }
            else
            {
                if (UserInfo != null) { LoadVariables(); }
                Page.DataBind();
                if(UserInfo["AccountActive"].ToString() != "True")
                {
                    acntDisabled.Visible = true;
                    renewFrm.Visible = false;
                }
                else
                {
                    acntDisabled.Visible = false;
                }
                //testMsg.Text = UserInfo["AccountActive"].ToString();
            }
        }

        protected void LoadVariables()
        {
            if (!String.IsNullOrEmpty(UserInfo["LastFour"].ToString()))
            {
                tcktTxt.Text = "Choose Your Preference From The Following Five Options:";
                tcktOpt.Items.Add(new ListItem("<td VALIGN='top'>Pay in full for my 2014-2015 Season  Tickets with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + " on March 15*</td>", "Option1", true));

                tcktOpt.Items.Add(new ListItem("<td>Pay in full, no later than March 15,  for my 2014-2015 Season Tickets and I am sending a check to*:<br /><span class='indent'>Florida Flames</span><br /><span class='indent'>Attn: " + UserInfo["SalesName"].ToString() + "</span><br /><span class='indent'>211 N. Robinson-Suite 300</span><br /><span class='indent'>Daytona Beach, FL 32114</span></td>", "Option2"));

                tcktOpt.Items.Add(new ListItem("<td>Pay for my 2014-2015 Season Tickets in Three Monthly Installments with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ". I understand my card will not be charged until March 15.<br /><span class='indent'>33% or $" + UserInfo["Per1"].ToString() + " on March 15</span><br /><span class='indent'>33% or $" + UserInfo["Per2"].ToString() + " on May 17</span><br /><span class='indent'>34% or $" + UserInfo["Per3"].ToString() + " on July 19</span><br /></td>", "Option3"));

                tcktOpt.Items.Add(new ListItem("<td>Pay for my 2014-2015 Season Tickets in Six Monthly Installments with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ". I understand my card will not be charged until March 15, if applicable. <br /><span class='indent'>20% or $" + UserInfo["Per4"].ToString() + " on March 15</span><br /><span class='indent'>16% or $" + UserInfo["Per5"].ToString() + " on April 19</span><br /><span class='indent'>16% or $" + UserInfo["Per6"].ToString() + " on May 17</span><br /><span class='indent'>16% or $" + UserInfo["Per7"].ToString() + " on June 21</span><br /><span class='indent'>16% or $" + UserInfo["Per8"].ToString() + " on July 19</span><br /><span class='indent'>16% or $" + UserInfo["Per9"].ToString() + " on August 16</span><br /></td>", "Option4"));

                tcktOpt.Items.Add(new ListItem("<td>I would like to renew my 2014-2015 Season Tickets using a different credit card.<br />Please click on the TicketMaster icon below and input Account ID and PIN when prompted or contact your <a href='mailto:" + UserInfo["SalesEmail"].ToString() + "?subject=Message from Season Ticket Holder " + User.Identity.Name + @"'>Account Manager</a></td>", "Option5"));
            }
            else
            {
                tcktTxt.Text = "Choose Your Preference From The Following Two Options:";
                tcktOpt.Items.Add(new ListItem("<td>Pay in full, no later than March 15, for my 2014-2015 Season Tickets and I am sending a check to*:<br /><span class='indent'>Oklahoma City Thunder</span><br /><span class='indent'>Attn: " + UserInfo["SalesName"].ToString() + "</span><br /><span class='indent'>211 N. Robinson-Suite 300</span><br /><span class='indent'>Oklahoma City, OK 73102</span></td>", "Option2", true));
                tcktOpt.Items.Add(new ListItem("<td>I would like to renew my 2014-2015 Season Tickets using a different credit card.<br />Please click on the TicketMaster icon below and input Account ID and PIN when prompted or contact your <a href='mailto:" + UserInfo["SalesEmail"].ToString() + "?subject=Message from thunderstm.com " + User.Identity.Name + @"'>Thunder Account Manager</a></td>", "Option5"));
            }

            if (!String.IsNullOrEmpty(UserInfo["TotalPricePer"].ToString()))
            {
                if (!String.IsNullOrEmpty(UserInfo["LastFour"].ToString()))
                {
                    PlayoffsOpt.Items.Add(new ListItem("<td>Yes...I want to order my playoff tickets!<br />At the conclusion of each round, I agree to pay for the 2014 Thunder home playoff games with my credit/debit card type " + UserInfo["CardType"].ToString() + " ending in " + UserInfo["LastFour"].ToString() + ".</td>", "P_Option1", true));
                    //item.selected = true;
                    PlayoffsOpt.Items.Add(new ListItem("<td>Yes...I want to order my playoff tickets!<br />I choose to pay in advance for all potential Thunder home playoff games with check, cash or credit card. Any credits from games not played will be automatically applied to my 2014-2015 Thunder season ticket account unless otherwise requested for refund.</td>", "P_Option2"));
                    PlayoffsOpt.Items.Add(new ListItem("<td>I choose to not puchase any 2014 NBA Playoffs tickets and understand my seats will be resold for the 2014 NBA Playoffs.</td>", "P_Option3"));
                }
                else
                {
                    PlayoffsOpt.Items.Add(new ListItem("<td>Yes...I want to order my playoff tickets!<br />I choose to pay in advance for all potential Thunder home playoff games with check, cash or credit card. Any credits from games not played will be automatically applied to my 2014-2015 Thunder season ticket account unless otherwise requested for refund.</td>", "P_Option2", true));
                    PlayoffsOpt.Items.Add(new ListItem("<td>I choose to not puchase any 2014 NBA Playoffs tickets and understand my seats will be resold for the 2014 NBA Playoffs.</td>", "P_Option3"));
                }
            }

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            int AccountID = Convert.ToInt32(User.Identity.Name);
            string ticketOption = tcktOpt.SelectedItem.Value;
            string PlayoffsOption = "";
            if (!String.IsNullOrEmpty(UserInfo["TotalPricePer"].ToString()))
            {
                PlayoffsOption = PlayoffsOpt.SelectedItem.Value;
            }

            updateCIF(AccountID, ticketOption, PlayoffsOption, DateTime.Now);

            //send email
            Response.Redirect("SummaryThanks");
        }
    }
}