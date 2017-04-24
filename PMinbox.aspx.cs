using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class PMinbox : System.Web.UI.Page
{
    Database db = new Database();
    string q1 ,to, fromuser, touser, subject;
    SqlDataReader dr1, dr2;
    int uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpuser.Items.Clear();
            drpuser.Items.Add("Select User");
            drpuser.Items.Add("Admin");
            drpuser.Items.Add("Stock Manager");
        }
    }
    protected void drpuser_SelectedIndexChanged(object sender, EventArgs e)
    {


        if (drpuser.SelectedItem.Text == "Admin")
        {
            uid = 1;
        }

        else if (drpuser.SelectedItem.Text == "Stock Manager")
        {
            uid = 3;
        }

        q1 = "Select Email from Registration where RID = '" + Session["rid"].ToString() + "' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            touser = dr1[0].ToString();
        }
        dr1.Close();
        q1.Remove(0);

        q1 = "Select FromUser, Subject, Message, Date, UploadFile from Mail where FromUID = '" + uid + "' and ToUser = '"+touser+"' ";
        dr2 = db.reader(q1);
        GridView1.DataSource = dr2;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        to = GridView1.SelectedRow.Cells[0].Text.ToString();
        Session["emailto"] = to;
        subject = GridView1.SelectedRow.Cells[2].Text.ToString();
        Session["sub"] = subject;
        Response.Redirect("PMemail.aspx");
    }
}