using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Dmedicine : System.Web.UI.Page
{
    Database db = new Database();
    int mdid;

    string q1;
    SqlDataReader dr1, dr2, dr3;

    protected void Page_Load(object sender, EventArgs e)
    {
        q1 = "select MDID from Registration where RID  = '"+Session["rid"].ToString()+"' ";
        dr1 = db.reader(q1);
        q1.Remove(0);
        while (dr1.Read())
        {
            mdid = Convert.ToInt32(dr1[0].ToString());
        }
        dr1.Close();

        q1 = "select CompanyName, MedicineName, Price, ExpiryDate, Discount, MedicineImage from Medicine where MDID = '" + mdid + "' and flag = '0' ";
        dr2 = db.reader(q1);
        GridView1.DataSource = dr2;
        GridView1.DataBind();
        dr2.Close();
    }

    //protected void drpdeptcat_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpdeptcat.SelectedItem.Text == "Medical Department")
    //    {
    //        
    //    }
    //    else if (drpdeptcat.SelectedItem.Text == "Medical Category")
    //    {
    //        q1 = "select CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, MedicineImage from Medicine where flag = '1' ";
    //        dr3 = db.reader(q1);
    //        GridView1.DataSource = dr3;
    //        GridView1.DataBind();
    //        dr3.Close();
    //    }
    //}

}