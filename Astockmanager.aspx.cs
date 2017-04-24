using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Astockmanager : System.Web.UI.Page
{
    Database db = new Database();
    string query1;
    SqlDataReader dr1;
    protected void Page_Load(object sender, EventArgs e)
    {
        query1 = "select Name, Address, State, City, Pincode, MobileNo, Gender, Email from Registration where UID = '3'";
        dr1 = db.reader(query1);
        GridView1.DataSource = dr1;
        GridView1.DataBind();
    }
}