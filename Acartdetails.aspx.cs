using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Acartetails : System.Web.UI.Page
{
    Database db = new Database();
    int rid;
    string q1;
    SqlDataReader dr1, dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
        q1 = "select Title, FirstName, LastName, DeliveryAddress, State, City, Pincode, MobileNo, CategoryName, SubCatName, MedicineName, Price, Quantity, Total, OrderDate from CartDetails ";
        dr1 = db.reader(q1);
        GridView1.DataSource = dr1;
        GridView1.DataBind();
        dr1.Close();
    }
}