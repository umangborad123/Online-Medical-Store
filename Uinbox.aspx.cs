using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class Uinbox : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1;
    string q1, emailto, touser, subject;
    int torid;

    protected void Page_Load(object sender, EventArgs e)
    {
        torid = Convert.ToInt32(Session["rid"].ToString());
    }

    protected void drpselect_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "Select Email from Registration where RID = '" + Session["rid"].ToString() + "' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            touser = dr1[0].ToString();
        }
        dr1.Close();
        q1.Remove(0);

        if (drpselect.SelectedItem.Text == "Admin")
        {
            q1 = "Select FromUser, Subject, Message, Date, UploadFile from Mail where FromUID = '1' and ToUser = '"+touser+"' ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr1;
            GridView1.DataBind();
        }
        else
        {
            q1 = "Select FromUser, Subject, Message, Date, UploadFile from Mail where FromUID = '2' and ToRID = '" + torid + "' ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr1;
            GridView1.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        emailto = GridView1.SelectedRow.Cells[0].Text.ToString();
        Session["emailto"] = emailto;
        subject = GridView1.SelectedRow.Cells[2].Text.ToString();
        Session["sub"] = subject;
        Response.Redirect("UResponseemail.aspx");
    }
    
}