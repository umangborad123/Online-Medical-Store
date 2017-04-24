using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Umedicine : System.Web.UI.Page
{
    Database db = new Database();
    int mdid;
    string q1;
    SqlDataReader dr1, dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpname.Items.Clear();
            drpname.Items.Add("Select Department");
            q1 = "select DeptName from MedicalDept";
            dr2 = db.reader(q1);
            while (dr2.Read())
            {
                drpname.Items.Add(dr2[0].ToString());
            }
            dr2.Close();
            q1.Remove(0);
        }
        
    }
    protected void drpname_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select MDID from MedicalDept where DeptName = '" + drpname.SelectedItem.Text + "' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            mdid = Convert.ToInt32(dr1[0].ToString());
        }
        dr1.Close();
        q1.Remove(0);
        
        q1 = "select CompanyName, MedicineName, Price, ExpiryDate, Discount from Medicine where MDID = '"+mdid+"' ";
        dr2 = db.reader(q1);
        GridView1.DataSource = dr2;
        GridView1.DataBind();
        dr2.Close();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    
}