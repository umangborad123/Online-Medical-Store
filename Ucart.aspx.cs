using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;


public partial class Ucart : System.Web.UI.Page
{
    Database db = new Database();
    int rid;
    string q1;
    SqlDataReader dr1, dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
        rid = Convert.ToInt32(Session["rid"].ToString());

        q1 = "select Title, FirstName, LastName, DeliveryAddress, State, City, Pincode, MobileNo, CategoryName, SubCatName, MedicineName, Price, Quantity, Total, OrderDate from CartDetails where RID = '" + rid + "'";
        dr1 = db.reader(q1);
        GridView1.DataSource = dr1;
        GridView1.DataBind();
        dr1.Close();
    }
}