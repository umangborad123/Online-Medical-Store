using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Apharmaprofile : System.Web.UI.Page
{
    Database db = new Database();
    int mdid;
    string q1, query1, query2;
    SqlDataReader dr1, dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
         query2 = "select Name, Address, State, City, Pincode, MobileNo, Gender, Email, UserName from Registration where UID = '4' ";
         dr2 = db.reader(query2);
         GridView1.DataSource = dr2;
         GridView1.DataBind();
         dr2.Close();
        
    }
    
}