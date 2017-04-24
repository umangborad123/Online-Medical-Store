using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class AManageStock : System.Web.UI.Page
{
    Database db = new Database();
    string q1;
    int cid, subcatid, mdid, did, mid;
    SqlDataReader dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12, dr13;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            deptcategory.Visible = false;
            Category.Visible = false;
            medicaldept.Visible = false;

            drpcompany.Items.Clear();
            drpcompany.Items.Add("Select Company");
            q1 = "select CompanyName from CompanyName";
            dr11 = db.reader(q1);
            q1.Remove(0);
            while (dr11.Read())
            {
                drpcompany.Items.Add(dr11[0].ToString());
            }
            dr11.Close();


            drpmdept.Items.Clear();
            drpmdept.Items.Add("Select Department");
            q1 = "select DeptName from MedicalDept";
            dr13 = db.reader(q1);
            q1.Remove(0);
            while (dr13.Read())
            {
                drpmdept.Items.Add(dr13[0].ToString());
            }
            dr13.Close();

            drpsubcat.Items.Clear();
            drpsubcat.Items.Add("Select Sub-Category");
            q1 = "select SubCatName from SubCategory";
            dr12 = db.reader(q1);
            q1.Remove(0);
            while (dr12.Read())
            {
                drpsubcat.Items.Add(dr12[0].ToString());
            }
            dr12.Close();
        }
    }

    public int medicID()
    {
        q1 = "select MDID, DeptName from MedicalDept where DeptName = '" + drpmdept.SelectedItem.Text + "'";
        dr3 = db.reader(q1);
        q1.Remove(0);
        while (dr3.Read())
        {
            mdid = Convert.ToInt32(dr3[0].ToString());
        }
        dr3.Close();
        return mdid;
    }

    protected void drpmdept_SelectedIndexChanged(object sender, EventArgs e)
    {
        medicID();
        drpdisease.Items.Clear();
        drpdisease.Items.Add("Select Disease");
        q1 = "Select DiseasesName from Diseases where MDID = '" + mdid + "'";
        dr10 = db.reader(q1);
        q1.Remove(0);
        while (dr10.Read())
        {
            drpdisease.Items.Add(dr10[0].ToString());
        }
        dr10.Close();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            deptcategory.Visible = true;
            medicaldept.Visible = true;
            Category.Visible = false;

        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            medicaldept.Visible = false;
            deptcategory.Visible = true;
            Category.Visible = true;
        }
        else
        {

        }
    }


    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select CID from Category where CategoryName = '" + drpcat.SelectedItem.Text + "' ";
        dr1 = db.reader(q1);
        q1.Remove(0);
        while (dr1.Read())
        {
            cid = Convert.ToInt32(dr1[0].ToString());
        }
        dr1.Close();

        q1 = "select SubCatName from SubCategory where CID = '" + cid + "'";
        dr5 = db.reader(q1);
        q1.Remove(0);
        drpsubcat.Items.Clear();
        drpsubcat.Items.Add("Select Sub Category");
        while (dr5.Read())
        {
            drpsubcat.Items.Add(dr5[0].ToString());
        }
    }

    protected void btndisplay_Click(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            g2.Visible = true;
            g1.Visible = false;
            medicID();

            q1 = "select DID, DiseasesName from Diseases where DiseasesName = '" + drpdisease.SelectedItem.Text + "'";
            dr4 = db.reader(q1);
            q1.Remove(0);
            while (dr4.Read())
            {
                did = Convert.ToInt32(dr4[0].ToString());
            }
            dr4.Close();

            q1 = "select MID from Medicine where MDID = '" + mdid + "' and DID = '" + did + "' ";
            dr8 = db.reader(q1);

            while (dr8.Read())
            {
                mid = Convert.ToInt32(dr8[0].ToString());
            }
            dr8.Close();
            q1.Remove(0);

            //q1 = "SELECT M.CompanyName, Medic.DeptName, M.MedicineName, D.DiseasesName, M.Price, S.Quantity, M.ExpiryDate, M.Discount, M.MedicineImage FROM Medicine M, MedicalDept Medic, Diseases D, Stock S where M.MDID = '"+mdid+"' and M.DID = '"+did+"' and Medic.MDID = '"+mdid+"' and D.DID = '"+did+"' and S.MID = '"+mid+"' ";
            q1 = "SELECT MedicalDept.DeptName, Medicine.CompanyName, Medicine.Description,  Diseases.DiseasesName, Medicine.MedicineName, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Diseases INNER JOIN  Medicine ON Diseases.DID = Medicine.DID INNER JOIN MedicalDept ON Diseases.MDID = MedicalDept.MDID INNER JOIN Stock ON Medicine.MID = Stock.MID where Medicine.CompanyName = '" + drpcompany.SelectedItem.Text + "' and MedicalDept.DeptName = '" + drpmdept.SelectedItem.Text + "' and Diseases.DiseasesName = '" + drpdisease.SelectedItem.Text + "' ";
            dr6 = db.reader(q1);

            GridView2.DataSource = dr6;
            GridView2.DataBind();

            dr6.Close();
            q1.Remove(0);
        }
        else
        {
            g2.Visible = false;
            g1.Visible = true;

            q1 = "select CID from Category where CategoryName = '" + drpcat.SelectedItem.Text + "' ";
            dr1 = db.reader(q1);
            q1.Remove(0);
            while (dr1.Read())
            {
                cid = Convert.ToInt32(dr1[0].ToString());
            }
            dr1.Close();

            

            q1 = "select SubCatID,SubCatName from SubCategory where SubCatName = '" + drpsubcat.SelectedItem.Text + "'";
            dr2 = db.reader(q1);
            q1.Remove(0);
            while (dr2.Read())
            {
                subcatid = Convert.ToInt32(dr2[0].ToString());
            }
            dr2.Close();

            q1 = "select MID from Medicine where CID = '" + cid + "' and SubCatID = '"+subcatid+"' ";
            dr9 = db.reader(q1);
            q1.Remove(0);
            while (dr9.Read())
            {
                mid = Convert.ToInt32(dr9[0].ToString());
            }
            dr9.Close();

            q1 = "SELECT Medicine.MedicineName, Medicine.Description, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Medicine INNER JOIN Category ON Medicine.CID = Category.CID INNER JOIN SubCategory ON Medicine.SubCatID = SubCategory.SubCatID INNER JOIN Stock ON Medicine.MID = Stock.MID AND Category.CID = Stock.CID AND SubCategory.SubCatID = Stock.SubCatID where Medicine.CompanyName = '" + drpcompany.SelectedItem.Text + "' and Category.CategoryName='" + drpcat.SelectedItem.Text + "' and SubCategory.SubCatName='" + drpsubcat.SelectedItem.Text + "' ";
            dr7 = db.reader(q1);
            q1.Remove(0);
            GridView1.DataSource = dr7;
            GridView1.DataBind();
            dr7.Close();
        }
    }
}