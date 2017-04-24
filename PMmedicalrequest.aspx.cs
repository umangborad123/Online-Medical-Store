using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class PMmedicalrequest : System.Web.UI.Page
{
    Database db = new Database();
    string q1, companyname;
    
    SqlDataReader dr1, dr2, dr3;
    protected void Page_Load(object sender, EventArgs e)
    {
         q1 = "select CompanyName from Registration where RID  = '" + Session["rid"].ToString() + "' ";
         dr1 = db.reader(q1);
         q1.Remove(0);
         while (dr1.Read())
         {
            companyname = dr1[0].ToString();
         }
         dr1.Close();
        
    }
    protected void drpdeptcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            q1 = "select CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, MedicineImage from Medicine where CompanyName = '" + companyname + "' and flag = '0' ";
            dr2 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr2;
            GridView1.DataBind();
            dr2.Close();
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            q1 = "select CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, MedicineImage from Medicine where CompanyName = '" + companyname + "' and flag = '1' ";
            dr3 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr3;
            GridView1.DataBind();
            dr3.Close();
        }
    }
}