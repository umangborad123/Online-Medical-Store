using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


public partial class PMmaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["PharmaManagerName"] == null)
            {
                Response.Redirect("Index.aspx");

            }
            else
            {
                lblname.Text = Session["PharmaManagerName"].ToString();
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
