using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class UBilling : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1, dr2, dr3;
    string q1, q2, tempmedicine, tempcat, tempsubcat, deliveryaddress, transaction, tempdept, title, fname, lname, state, city, pincode, mobileno ;
    double tempprice, temptotal;
    int sid, rid, tempqty;
    DateTime temporder, tempdelivery;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpcity.Items.Clear();
            drpcity.Items.Add("Select City");

           
                
                q1 = "Select MedicineName, Price, Quantity, Total, Path, CategoryName, SubCatName, DepartmentName from TempCart";
                dr3 = db.reader(q1);
                cartgridview.DataSource = dr3;
                cartgridview.DataBind();
                dr3.Close();
                q1.Remove(0);
                      

            
           
        }
    }
    protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpstate.SelectedItem.Text == "Select State")
        {
            drpcity.Items.Clear();
            drpcity.Items.Add("Select City");
        }
        
        q1 = "select SID from State where State = '" + drpstate.SelectedItem.Text + "' ";
        dr1 = db.reader(q1);

        while (dr1.Read())
        {
            sid = Convert.ToInt32(dr1[0].ToString());
        }
        dr1.Close();
        q1.Remove(0);

        q1 = "select City from City where SID = '" + sid + "'";
        dr2 = db.reader(q1);
        drpcity.Items.Clear();
        drpcity.Items.Add("Select City");
        while (dr2.Read())
        {

            drpcity.Items.Add(dr2[0].ToString());
        }
        dr2.Close();
        q1.Remove(0);
    }
    protected void btnplaceorder_Click(object sender, ImageClickEventArgs e)
    {
        title = drptitle.SelectedItem.Text;
        fname = txtfname.Text;
        lname = txtlname.Text;
        deliveryaddress = txtaddress.Text;
        state = drpstate.SelectedItem.Text;
        city = drpcity.SelectedItem.Text;
        pincode = txtpincode.Text;
        mobileno = txtmobile.Text;

        transaction = "Cash on Delivery";

        rid = Convert.ToInt32(Session["rid"].ToString());

        
            for (int i = 0; i < cartgridview.Rows.Count; i++)
            {
                tempcat = cartgridview.Rows[i].Cells[0].Text.ToString();
                tempsubcat = cartgridview.Rows[i].Cells[1].Text.ToString();
                tempdept = cartgridview.Rows[i].Cells[2].Text.ToString();
                tempmedicine = cartgridview.Rows[i].Cells[3].Text.ToString();
                tempprice = Convert.ToDouble(cartgridview.Rows[i].Cells[4].Text);
                tempqty = Convert.ToInt32(cartgridview.Rows[i].Cells[5].Text);
                temptotal = Convert.ToDouble(cartgridview.Rows[i].Cells[6].Text);




                q1 = "insert into CartDetails (RID, Title, FirstName, LastName, State, City, Pincode, MobileNo, TransactionType, CategoryName, SubCatName, DepartmentName, MedicineName, Price, Quantity, Total, DeliveryAddress, OrderDate ) values ( '" + rid + "', '" + title + "' , '" + fname + "' , '" + lname + "' , '" + state + "' , '" + city + "' , '" + pincode + "' , '" + mobileno + "' ,'" + transaction + "','" + tempcat + "','" + tempsubcat + "', '" + tempdept + "' , '" + tempmedicine + "' , '" + tempprice + "', '" + tempqty + "', '" + temptotal + "' , '" + deliveryaddress + "'  , '" + DateTime.Now.ToString("dd/MM/yyyy") + "'  ) ";
                db.insertData(q1);

            }



            string deliverydate = DateTime.Now.AddDays(3).ToString("dd/MM/yyyy");
            
            MessageBox.Show("You will get your item within 3 Business days i.e. on " + deliverydate + ". Thank you..." );
            
        q1 = "Delete from TempCart";
        db.delete(q1);
        q1.Remove(0);

        Response.Redirect("Uhome.aspx");
        
    }
}