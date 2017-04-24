using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class SMPharmacompany : System.Web.UI.Page
{
    Database db = new Database();
    string q1;
    SqlDataReader dr1, dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
        q1 = "select CompanyName, MedicineName, Description, Price, ExpiryDate from Medicine ";
        
    }
    protected void drpdeptcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            GridView2.Visible = true;
            q1 = "select CompanyName, MedicineName, Price, ExpiryDate from Medicine where flag = '0' ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            GridView2.DataSource = dr1;
            GridView2.DataBind();
            dr1.Close();
            GridView1.Visible = false;
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            GridView1.Visible = true;
            q1 = "select CompanyName, MedicineName, Description, Price, ExpiryDate from Medicine where flag = '1' ";
            dr2 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
            dr2.Close();
            GridView2.Visible = false;
        }
        
    }
}