using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class pharmawomen : System.Web.UI.Page
{
    string q1;
    SqlDataReader dr1;
    Database db = new Database();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            q1 = "select MedicineName, ImageName, Price, Description from Medicine where CID = '2' and SubCatID = '2'  ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            datalistpharmawomen.DataSource = dr1;
            datalistpharmawomen.DataBind();
            dr1.Close();
        }
        
    }
    protected void btnaddtocart_Click(object sender, ImageClickEventArgs e)
    {
        MessageBox.Show("Login First!");
        Response.Redirect("Index.aspx");
    }
}