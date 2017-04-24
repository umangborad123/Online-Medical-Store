using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class IndexShoppingCart : System.Web.UI.Page
{
    Database db = new Database();
    int mdid, did, cid, subcatid, qty, j = 0;
    decimal total;
    string q1, path;
    SqlDataReader dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            
            panelmedicdept.Visible = false;
            panelcategory.Visible = false;
            panelbtn.Visible = false;
            lblcname.Visible = false;
            drpcname.Visible = false;
            imgdisp.Visible = false;
            lblshoppingcart.Visible = false;

            q1 = "select CompanyName from CompanyName";
            dr1 = db.reader(q1);
            q1.Remove(0);
            drpcname.Items.Clear();
            drpcname.Items.Add("Select Company");
            while (dr1.Read())
            {
                drpcname.Items.Add(dr1[0].ToString());
            }
            dr1.Close();

            drpmedicdept.Items.Clear();
            drpmedicdept.Items.Add("Select Department");
            q1 = "select DeptName from MedicalDept";
            dr2 = db.reader(q1);
            q1.Remove(0);
            while (dr2.Read())
            {
                drpmedicdept.Items.Add(dr2[0].ToString());
            }
            dr2.Close();

            drpquantity.Items.Clear();
            drpquantity.Items.Add("Select Quantity");
            for (int i = 1; i <= 20; i++)
            {
                drpquantity.Items.Add("" + i);
            }
                        
        }
          
        q1 = "select MDID from MedicalDept where DeptName = '" + drpmedicdept.SelectedItem.Text + "'";
        dr3 = db.reader(q1);
        while (dr3.Read())
        {
            mdid = Convert.ToInt32(dr3[0].ToString());
        }
        dr3.Close();

        

    }
    protected void drpdeptcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            panelmedicdept.Visible = true;
            panelcategory.Visible = false;
            panelbtn.Visible = true;
            lblcname.Visible = true;
            drpcname.Visible = true;
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            panelmedicdept.Visible = false;
            panelcategory.Visible = true;
            panelbtn.Visible = true;
            lblcname.Visible = true;
            drpcname.Visible = true;
        }
    }

    protected void drpmedicdept_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select MDID from MedicalDept where DeptName = '" + drpmedicdept.SelectedItem.Text + "'";
        dr3 = db.reader(q1);
        q1.Remove(0);
        while (dr3.Read())
        {
            mdid = Convert.ToInt32(dr3[0].ToString());
        }
        dr3.Close();

        drpdisease.Items.Clear();
        drpdisease.Items.Add("Select Disease Name");
        q1 = "select DiseasesName from Diseases where MDID = '"+mdid+"' ";
        dr4 = db.reader(q1);
        q1.Remove(0);
        while (dr4.Read())
        {
            drpdisease.Items.Add(dr4[0].ToString());
        }
        dr4.Close();
    }

    protected void drpdisease_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select DID from Diseases where DiseasesName = '" + drpdisease.SelectedItem.Text + "'";
        dr5 = db.reader(q1);
        q1.Remove(0);
        while (dr5.Read())
        {
            did = Convert.ToInt32(dr5[0].ToString());
        }
        dr5.Close();

        drpmedicinename.Items.Clear();
        drpmedicinename.Items.Add("Select Medicine");
        q1 = "select MedicineName from Medicine where MDID = '" + mdid + "' and DID = '"+did+"' and CompanyName = '"+drpcname.SelectedItem.Text+"' ";
        dr6 = db.reader(q1);
        q1.Remove(0);
        while (dr6.Read())
        {
            drpmedicinename.Items.Add(dr6[0].ToString());
        }
        dr6.Close();
    }

    protected void drpmedicinename_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select Price, MedicineImage from Medicine where MedicineName = '"+drpmedicinename.SelectedItem.Text+"' ";
        dr7 = db.reader(q1);
        q1.Remove(0);
        while (dr7.Read())
        {
            lbldisplayprice.Text = dr7[0].ToString();
            path = dr7[1].ToString();
        }
        dr7.Close();

        imgdisp.Visible = true;
        imgdisp.ImageUrl = path;

         
    }

    protected void drpcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select CID from Category where CategoryName = '" + drpcategory.SelectedItem.Text + "'";
        dr8 = db.reader(q1);
        q1.Remove(0);
        while (dr8.Read())
        {
            cid = Convert.ToInt32(dr8[0].ToString());
        }
        dr8.Close();

        q1 = "select SubCatName from SubCategory where CID = '" + cid + "' ";
        dr9 = db.reader(q1);
        q1.Remove(0);
        drpsubcategory.Items.Clear();
        drpsubcategory.Items.Add("Select Sub-Category");
        while (dr9.Read())
        {
            drpsubcategory.Items.Add(dr9[0].ToString());
        }
        dr9.Close();
    }
    protected void drpsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select CID from Category where CategoryName = '" + drpcategory.SelectedItem.Text + "'";
        dr12 = db.reader(q1);
        q1.Remove(0);
        while (dr12.Read())
        {
            cid = Convert.ToInt32(dr12[0].ToString());
        }
        dr12.Close();

        q1 = "select SubCatID from SubCategory where subCatName = '" + drpsubcategory.SelectedItem.Text + "'";
        dr10 = db.reader(q1);
        q1.Remove(0);
        while (dr10.Read())
        {
            subcatid = Convert.ToInt32(dr10[0].ToString());
        }
        dr10.Close();

        q1 = "select MedicineName from Medicine where CID = '" + cid + "' and SubCatID = '" + subcatid + "' and CompanyName = '" + drpcname.SelectedItem.Text + "' ";
        dr11 = db.reader(q1);
        q1.Remove(0);
        drpmedicinename.Items.Clear();
        drpmedicinename.Items.Add("Select Medicine");
        while (dr11.Read())
        {
            drpmedicinename.Items.Add(dr11[0].ToString());
        }
        dr11.Close();
    }
    
    protected void drpquantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        total = Convert.ToDecimal(lbldisplayprice.Text);
        qty = Convert.ToInt32(drpquantity.SelectedItem.Text);
        lbldisplaytotal.Text = Convert.ToString(total * qty);
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        lblshoppingcart.Visible = true;
        Application["medCounts"] = Convert.ToInt32(Application["medCounts"].ToString()) + 1;
        lblshoppingcart.Text = "Items added to cart --> " + Application["medCounts"].ToString();
        
    }
}