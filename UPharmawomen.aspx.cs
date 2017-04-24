using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class UPharmawomen : System.Web.UI.Page
{
    string q1, medicname, medicprice;
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
        
    }
    protected void datalistpharmawomen_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int i;
        if (e.CommandName == "AddCart")
        {
            i = e.Item.ItemIndex;
            System.Web.UI.WebControls.Label lblmnname = (System.Web.UI.WebControls.Label)datalistpharmawomen.Items[i].FindControl("l1");
            medicname = lblmnname.Text;

            System.Web.UI.WebControls.Label lblprice = (System.Web.UI.WebControls.Label)datalistpharmawomen.Items[i].FindControl("l2");
            medicprice = lblprice.Text;

            Session["medicname"] = medicname;
            Session["medicprice"] = medicprice;
            Session["catname"] = "Pharmaceutical";
            Session["subcatname"] = "Women Health";

        }
        Response.Redirect("UShoppingcart.aspx");
    }
}