using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void drpyear_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpyear.SelectedItem.Text == "1990" || drpyear.SelectedItem.Text == "1991" || drpyear.SelectedItem.Text == "1992" || drpyear.SelectedItem.Text == "1993" || drpyear.SelectedItem.Text == "1994" || drpyear.SelectedItem.Text == "1995" || drpyear.SelectedItem.Text == "1996" || drpyear.SelectedItem.Text == "1997" || drpyear.SelectedItem.Text == "1998" || drpyear.SelectedItem.Text == "1999" || drpyear.SelectedItem.Text == "2000" || drpyear.SelectedItem.Text == "2001" || drpyear.SelectedItem.Text == "2002" || drpyear.SelectedItem.Text == "2003" || drpyear.SelectedItem.Text == "2004")
        {
            drpmonth.Items.Clear();
            drpmonth.Items.Add("Month");
            drpmonth.Items.Add("January");
            drpmonth.Items.Add("February");
            drpmonth.Items.Add("March");
            drpmonth.Items.Add("April");
            drpmonth.Items.Add("May");
            drpmonth.Items.Add("June");
            drpmonth.Items.Add("July");
            drpmonth.Items.Add("August");
            drpmonth.Items.Add("september");
            drpmonth.Items.Add("october");
            drpmonth.Items.Add("November");
            drpmonth.Items.Add("December");
        }
    }
    protected void drpmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpmonth.SelectedItem.Text == "January" || drpmonth.SelectedItem.Text == "March" || drpmonth.SelectedItem.Text == "May" || drpmonth.SelectedItem.Text == "July" || drpmonth.SelectedItem.Text == "August" || drpmonth.SelectedItem.Text == "October" || drpmonth.SelectedItem.Text == "December")
        {
            drpday.Items.Clear();
            drpday.Items.Add("Day");
            for(int i = 1 ; i<=31 ; i++ )
            {
                drpday.Items.Add(""+i);
            }
        }
        else if (drpmonth.SelectedItem.Text == "April" || drpmonth.SelectedItem.Text == "June" || drpmonth.SelectedItem.Text == "September" || drpmonth.SelectedItem.Text == "November")
        {
            drpday.Items.Clear();
            drpday.Items.Add("Day");
            for (int j = 1; j <= 30; j++)
            {
                drpday.Items.Add("" + j);
            }
        }
        else
        {
            int year = Convert.ToInt32(drpyear.SelectedItem.Text);
            int k = year % 4;
            if (k == 0)
            {
                drpday.Items.Clear();
                drpday.Items.Add("Day");
                for (int i = 1; i <= 29; i++)
                {
                    drpday.Items.Add("" + i);
                }
            }
            else
            {
                drpday.Items.Clear();
                drpday.Items.Add("Day");
                for (int i = 1; i < 29; i++)
                {
                    drpday.Items.Add("" + i);
                }
            }

        }
    }
    
}