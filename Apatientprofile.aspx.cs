﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Apatientprofile : System.Web.UI.Page
{
    Database db = new Database();
    string query1, query2;
    SqlDataReader dr1, dr2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            query1 = "select Name from Registration where UID = '5' ";
            dr1 = db.reader(query1);
            drpname.Items.Clear();
            drpname.Items.Add("Select Patient");
            while (dr1.Read())
            {
                drpname.Items.Add(dr1[0].ToString());
            }
            dr1.Close();
        }
        
    }
    protected void drpname_SelectedIndexChanged(object sender, EventArgs e)
    {
        query2 = "select Name, Address, DateOfBirth, State, City, Pincode, MobileNo, Gender, Email, UserName from Registration where Name = '"+drpname.SelectedItem.Text+"'";
        dr2 = db.reader(query2);
        GridView1.DataSource = dr2;
        GridView1.DataBind();
    }
}