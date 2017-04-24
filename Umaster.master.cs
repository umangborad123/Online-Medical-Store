using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Web.Security;


public partial class uuser : System.Web.UI.MasterPage
{
    Database db = new Database();
    SqlDataReader dr;
    string q1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["PatientName"] == null)
            {
                Response.Redirect("Index.aspx");

            }
            else
            {
                lblname.Text = Session["PatientName"].ToString();
            }
        }
        

        
    }
    protected void btnshoppingcart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UShoppingCart.aspx");
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
