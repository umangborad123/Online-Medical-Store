using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Web.Security;

public partial class dmaster : System.Web.UI.MasterPage
{
    Database db = new Database();
    string q1;
    SqlDataReader dr1;
    protected void Page_Load(object sender, EventArgs e)
    {
        q1 = "select CompanyName from CompanyName";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            BulletedList1.Items.Add(dr1[0].ToString());

        }
        dr1.Close();
        q1.Remove(0);
        if (Page.IsPostBack == false)
        {
            if (Session["DoctorName"] == null)
            {
                Response.Redirect("Index.aspx");

            }
            else
            {
                lblname.Text = Session["DoctorName"].ToString();
            }
            
        }
        
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        String RedirectUrl = FormsAuthentication.LoginUrl + "? ReturnUrl= Index.aspx";
        FormsAuthentication.SignOut();
        //Response.Cookies[".ASXAUTH"].Expires = DateTime.Now.AddDays(-10);
        Session.Abandon();
        Session.Clear();
        //FormsAuthentication.RedirectToLoginPage();

        Response.Redirect(RedirectUrl);
    }
}
