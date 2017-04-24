using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Ainbox : System.Web.UI.Page
{
    Database db = new Database();
    string query1, query2, toemail, subject;
    SqlDataReader dr1, dr2;
    int uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpuser.Items.Clear();
            drpuser.Items.Add("Select User");
            drpuser.Items.Add("Doctor to Patient");
            drpuser.Items.Add("Patient to Doctor");
            drpuser.Items.Add("Stock Manager");
            drpuser.Items.Add("Pharmaceutical Manager");
        }
    }
    protected void drpuser_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpuser.SelectedItem.Text == "Doctor to Patient")
        {
            query2 = "Select FromUser, ToUser, Subject, Message, Date, UploadFile from Mail where FromUID = '2' and ToUID = '5' ";
            dr2 = db.reader(query2);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
        }

        else if (drpuser.SelectedItem.Text == "Stock Manager")
        {
            query2 = "Select FromUser, ToUser, Subject, Message, Date, UploadFile from Mail where FromUID = '3' and ToUID = '1' ";
            dr2 = db.reader(query2);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
        }

        else if (drpuser.SelectedItem.Text == "Pharmaceutical Manager")
        {
            query2 = "Select FromUser, ToUser, Subject, Message, Date, UploadFile from Mail where FromUID = '4' and ToUID = '1' ";
            dr2 = db.reader(query2);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
        }

        else if (drpuser.SelectedItem.Text == "Patient to Doctor")
        {
            query2 = "Select FromUser, ToUser, Subject, Message, Date, UploadFile from Mail where FromUID = '5' and ToUID = '2' ";
            dr2 = db.reader(query2);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
        }
        
        
        
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        toemail = GridView1.SelectedRow.Cells[0].Text.ToString();
        subject = GridView1.SelectedRow.Cells[2].Text.ToString();
        lblto.Text = toemail;
        lblto.Visible = false;
        Session["emailto"] = toemail;
        Session["sub"] = subject;
        Response.Redirect("Aemail.aspx");
    }
}