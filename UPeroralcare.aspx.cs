using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class UPeroralcare : System.Web.UI.Page
{
    string q1, medicname, medicprice;
    SqlDataReader dr1;
    Database db = new Database();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            q1 = "select MedicineName, ImageName, Price, Description from Medicine where CID = '3' and SubCatID = '8'  ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            datalistperoral.DataSource = dr1;
            datalistperoral.DataBind();
            dr1.Close();
        }
        
    }
    protected void btnaddtocart_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void datalistperoral_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int i;
        if (e.CommandName == "AddCart")
        {
            i = e.Item.ItemIndex;
            System.Web.UI.WebControls.Label lblmnname = (System.Web.UI.WebControls.Label)datalistperoral.Items[i].FindControl("l1");
            medicname = lblmnname.Text;

            System.Web.UI.WebControls.Label lblprice = (System.Web.UI.WebControls.Label)datalistperoral.Items[i].FindControl("l2");
            medicprice = lblprice.Text;

            Session["medicname"] = medicname;
            Session["medicprice"] = medicprice;
            Session["catname"] = "Personal Care";
            Session["subcatname"] = "Oral Care";

        }
        Response.Redirect("UShoppingcart.aspx");
    }
}