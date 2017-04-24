using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class SMmedicineManage : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12, dr13, dr14, dr15, dr16;
    string q1, filename, imagepath;
    DateTime expdate, nowdate;
    int rid, cid, subcatid, mdid, did, mid, flag = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpmedical.Visible = false;
            AddPanel.Visible = false;
            //EditDeletePanel.Visible = false;
            ViewPanel.Visible = false;
            medicalDept.Visible = false;
            category.Visible = false;

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

            drpmdept.Items.Clear();
            drpmdept.Items.Add("Select Department");
            q1 = "select DeptName from MedicalDept";
            dr2 = db.reader(q1);
            q1.Remove(0);
            while (dr2.Read())
            {
                drpmdept.Items.Add(dr2[0].ToString());
            }
            dr2.Close();
        }
    }

    protected void drptype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drptype.SelectedItem.Text == "Add")
        {
            drpmedical.Visible = true;
            category.Visible = false;
            //EditDeletePanel.Visible = false;
            ViewPanel.Visible = false;
        }
       
        else if (drptype.SelectedItem.Text == "View")
        {
            ViewPanel.Visible = true;
            drpmedical.Visible = false;
            AddPanel.Visible = false;
            //EditDeletePanel.Visible = false;
            category.Visible = false;

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            AddPanel.Visible = true;
            medicalDept.Visible = true;
            category.Visible = false;
        }
        else
        {
            AddPanel.Visible = true;
            medicalDept.Visible = false;
            category.Visible = true;
        }
    }

    public void checkdataMedicalDeparrtment()
    {
        q1 = "select * from Medicine where CompanyName = '" + drpcname.SelectedItem.Text + "' and MedicineName = '" + txtmedicname.Text + "' and MDID = '" + mdid + "' ";
        dr3 = db.reader(q1);
        q1.Remove(0);
        if (dr3.HasRows)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }
        dr3.Close();
    }

    public void checkdataCategory()
    {
        q1 = "select * from Medicine where CompanyName = '" + drpcname.SelectedItem.Text + "' and MedicineName = '" + txtmedicname.Text + "' and CID = '" + cid + "' and SubCatID = '" + subcatid + "' ";
        dr4 = db.reader(q1);
        q1.Remove(0);
        if (dr4.HasRows)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }
        dr4.Close();
    }

    public int medicid()
    {
        q1 = "select MDID from MedicalDept where DeptName = '" + drpmdept.Text + "'";
        dr5 = db.reader(q1);
        q1.Remove(0);
        while (dr5.Read())
        {
            mdid = Convert.ToInt32(dr5[0].ToString());
        }
        dr5.Close();
        return mdid;
    }

    protected void drpcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select CID from Category where CategoryName = '" + drpcategory.SelectedItem.Text + "'";
        dr6 = db.reader(q1);
        q1.Remove(0);
        while (dr6.Read())
        {
            cid = Convert.ToInt32(dr6[0].ToString());
        }
        dr6.Close();
        q1 = "select SubCatName from SubCategory where CID = '" + cid + "' ";
        dr7 = db.reader(q1);
        q1.Remove(0);
        drpsubcategory.Items.Clear();
        //drpsubcategory.Items.Add("Select Sub-Category");
        while (dr7.Read())
        {
            drpsubcategory.Items.Add(dr7[0].ToString());
        }
        dr7.Close();

        if (drpcategory.SelectedItem.Text == "Baby Care" || drpcategory.SelectedItem.Text == "Nutrition Health")
        {
            lblsubcategory.Visible = false;
            drpsubcategory.Visible = false;
        }
        else
        {
            lblsubcategory.Visible = true;
            drpsubcategory.Visible = true;
        }
    }

    protected void drpmdept_SelectedIndexChanged(object sender, EventArgs e)
    {
        medicid();
        drpdisease.Items.Clear();
        drpdisease.Items.Add("Select Disease");
        q1 = "select DiseasesName from Diseases where MDID = '" + mdid + "'";
        dr8 = db.reader(q1);
        q1.Remove(0);
        while (dr8.Read())
        {
            drpdisease.Items.Add(dr8[0].ToString());
        }
        dr8.Close();
    }



    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

        AddPanel.Visible = false;
        drpmedical.Visible = false;
        //EditDeletePanel.Visible = false;
        ViewPanel.Visible = false;
        drptype.SelectedIndex = 0;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        imagepath = "FileUpload/" + imageupload.FileName;



        if (imageupload.HasFile == true)
        {
            imageupload.SaveAs(Server.MapPath("FileUpload/" + imageupload.FileName));
        }
        else
        {
            MessageBox.Show("Please select file!!!");
        }

        filename = Path.GetFileName(imageupload.PostedFile.FileName);

        medicid();

        q1 = "select RID from Registration where CompanyName = '" + drpcname.Text + "'";
        dr9 = db.reader(q1);
        q1.Remove(0);
        while (dr9.Read())
        {
            rid = Convert.ToInt32(dr9[0].ToString());
        }
        dr9.Close();

        q1 = "select DID from Diseases where DiseasesName = '" + drpdisease.Text + "'";
        dr10 = db.reader(q1);
        q1.Remove(0);
        while (dr10.Read())
        {
            did = Convert.ToInt32(dr10[0].ToString());
        }
        dr10.Close();

        q1 = "select CID from Category where CategoryName = '" + drpcategory.Text + "'";
        dr11 = db.reader(q1);
        q1.Remove(0);
        while (dr11.Read())
        {
            cid = Convert.ToInt32(dr11[0].ToString());
        }
        dr11.Close();

        q1 = "select SubCatID from SubCategory where SubCatName = '" + drpsubcategory.Text + "'";
        dr12 = db.reader(q1);
        q1.Remove(0);
        while (dr12.Read())
        {
            subcatid = Convert.ToInt32(dr12[0].ToString());
        }
        dr12.Close();

        q1 = "select MID from Medicine where CompanyName = '" + drpcname.Text + "'";
        dr13 = db.reader(q1);
        q1.Remove(0);
        while (dr13.Read())
        {
            mid = Convert.ToInt32(dr13[0].ToString());
        }
        dr13.Close();



        if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            checkdataMedicalDeparrtment();
            if (flag == 1)
            {
                MessageBox.Show("Same Medicine name for same company is not allow!");
                txtmedicname.Text = "";
            }
            else
            {
                q1 = "insert into Medicine (DID, MDID, CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, ImageName, MedicineImage, flag) values ('" + did + "','" + mdid + "','" + drpcname.SelectedItem.Text + "','" + txtmedicname.Text + "','"+txtdescription.Text+"','" + txtmprice.Text + "','" + txtexdate.Text + "','" + txtdiscount.Text + "','" + filename + "', '" + imagepath + "', '0' )";
                db.insertData(q1);
                q1.Remove(0);

                q1 = "select MID from Medicine where CompanyName = '" + drpcname.Text + "'";
                dr14 = db.reader(q1);
                q1.Remove(0);
                while (dr14.Read())
                {
                    mid = Convert.ToInt32(dr14[0].ToString());
                }
                dr14.Close();
                q1 = "insert into Stock (MID, MDID, MedicineName, CompanyName, Quantity) values ('" + mid + "','" + mdid + "','" + txtmedicname.Text + "','" + drpcname.SelectedItem.Text + "','" + txtqty.Text + "')";
                db.insertData(q1);
                q1.Remove(0);

                drptype.SelectedIndex = 0;
                drpdeptcat.SelectedIndex = 0;
                drpmdept.SelectedIndex = 0;
                drpdisease.SelectedIndex = 0;
                drpcname.SelectedIndex = 0;
                txtmedicname.Text = "";
                txtdescription.Text = "";
                txtmprice.Text = "";
                txtqty.Text = "";
                txtexdate.Text = "";
                txtdiscount.Text = "";

            }
        }
        else
        {
            checkdataCategory();
            if (flag == 1)
            {
                MessageBox.Show("Same Medicine name for same company is not allow!");
                txtmedicname.Text = "";
            }
            else
            {
                if (drpcategory.SelectedItem.Text == "Baby Care" )
                {
                    q1 = "insert into Medicine (CID, SubCatID, CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, ImageName, MedicineImage, flag) values ('" + cid + "','9','" + drpcname.Text + "','" + txtmedicname.Text + "','" + txtdescription.Text + "','" + txtmprice.Text + "','" + txtexdate.Text + "','" + txtdiscount.Text + "','" + filename + "', '" + imagepath + "', '1' )";
                    db.insertData(q1);
                    q1.Remove(0);
                }
                else if (drpcategory.SelectedItem.Text == "Nutrition Health")
                {
                    q1 = "insert into Medicine (CID, SubCatID, CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, ImageName, MedicineImage, flag) values ('" + cid + "','10','" + drpcname.Text + "','" + txtmedicname.Text + "','" + txtdescription.Text + "','" + txtmprice.Text + "','" + txtexdate.Text + "','" + txtdiscount.Text + "','" + filename + "', '" + imagepath + "', '1' )";
                    db.insertData(q1);
                    q1.Remove(0);
                }
                else
                {
                    q1 = "insert into Medicine (CID, SubCatID, CompanyName, MedicineName, Description, Price, ExpiryDate, Discount, ImageName, MedicineImage, flag) values ('" + cid + "','" + subcatid + "','" + drpcname.Text + "','" + txtmedicname.Text + "','" + txtdescription.Text + "','" + txtmprice.Text + "','" + txtexdate.Text + "','" + txtdiscount.Text + "','" + filename + "', '" + imagepath + "', '1' )";
                    db.insertData(q1);
                    q1.Remove(0);
                }
                

                q1 = "select MID from Medicine where CompanyName = '" + drpcname.Text + "'";
                dr14 = db.reader(q1);
                q1.Remove(0);
                while (dr14.Read())
                {
                    mid = Convert.ToInt32(dr14[0].ToString());
                }
                dr14.Close();

                if (drpcategory.SelectedItem.Text == "Baby Care")
                {
                    q1 = "insert into Stock (MID, CID, SubCatID, MedicineName, CompanyName, Quantity) values ('" + mid + "','" + cid + "','9','" + txtmedicname.Text + "','" + drpcname.SelectedItem.Text + "','" + txtqty.Text + "')";
                    db.insertData(q1);
                    q1.Remove(0);
                }
                else if (drpcategory.SelectedItem.Text == "Nutrition Health")
                {
                    q1 = "insert into Stock (MID, CID, SubCatID, MedicineName, CompanyName, Quantity) values ('" + mid + "','" + cid + "','10','" + txtmedicname.Text + "','" + drpcname.SelectedItem.Text + "','" + txtqty.Text + "')";
                    db.insertData(q1);
                    q1.Remove(0);
                }
                else
                {
                    q1 = "insert into Stock (MID, CID, SubCatID, MedicineName, CompanyName, Quantity) values ('" + mid + "','" + cid + "','" + subcatid + "','" + txtmedicname.Text + "','" + drpcname.SelectedItem.Text + "','" + txtqty.Text + "')";
                    db.insertData(q1);
                    q1.Remove(0);
                }

                

                drptype.SelectedIndex = 0;
                drpdeptcat.SelectedIndex = 0;
                drpcategory.SelectedIndex = 0;
                drpsubcategory.SelectedIndex = 0;
                drpcname.SelectedIndex = 0;
                txtmedicname.Text = "";
                txtdescription.Text = "";
                txtmprice.Text = "";
                txtqty.Text = "";
                txtexdate.Text = "";
                txtdiscount.Text = "";

            }
        }



    }
    protected void txtexdate_TextChanged(object sender, EventArgs e)
    {
        nowdate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        expdate = Convert.ToDateTime(txtexdate.Text);
        if (expdate < nowdate)
        {
            MessageBox.Show("Please enter valid expiry date!");
            txtexdate.Text = "";
        }
    }


    protected void txtmedicname_TextChanged(object sender, EventArgs e)
    {

    }

    //protected void drpselect_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpselect.SelectedItem.Text == "Medical Category")
    //    {
            
    //        q1 = "SELECT Medicine.CompanyName, Category.CategoryName, SubCategory.SubCatName, Medicine.MedicineName, Medicine.Description, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Medicine INNER JOIN Category ON Medicine.CID = Category.CID INNER JOIN SubCategory ON Medicine.SubCatID = SubCategory.SubCatID INNER JOIN Stock ON Medicine.MID = Stock.MID AND Category.CID = Stock.CID AND SubCategory.SubCatID = Stock.SubCatID where flag = '1' ";
    //        dr15 = db.reader(q1);
    //        editdeletegridview.DataSource = dr15;
    //        editdeletegridview.DataBind();
    //        editdeletegridview.Visible = true;
    //        dr15.Close();
    //        q1.Remove(0);
    //    }
    //    else if (drpselect.SelectedItem.Text == "Medical Department")
    //    {
    //        editdeletegridview.Visible = false;
    //        q1 = "SELECT Medicine.CompanyName, MedicalDept.DeptName, Diseases.DiseasesName, Medicine.MedicineName, Medicine.Description, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Medicine INNER JOIN MedicalDept ON Medicine.MDID = MedicalDept.MDID INNER JOIN Stock ON Medicine.MID = Stock.MID AND MedicalDept.MDID = Stock.MDID INNER JOIN Diseases ON Medicine.DID = Diseases.DID where flag = '0' ";
    //        dr16 = db.reader(q1);
    //        editdeletegridview2.DataSource = dr16;
    //        editdeletegridview2.DataBind();
    //        dr16.Close();
    //        q1.Remove(0);
    //    }
    //}
    protected void drpselect2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpselect2.SelectedItem.Text == "Medical Category")
        {

            q1 = "SELECT Medicine.CompanyName, Category.CategoryName, SubCategory.SubCatName, Medicine.MedicineName, Medicine.Description, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Medicine INNER JOIN Category ON Medicine.CID = Category.CID INNER JOIN SubCategory ON Medicine.SubCatID = SubCategory.SubCatID INNER JOIN Stock ON Medicine.MID = Stock.MID AND Category.CID = Stock.CID AND SubCategory.SubCatID = Stock.SubCatID where flag = '1' ";
            dr15 = db.reader(q1);
            viewgridview1.DataSource = dr15;
            viewgridview1.DataBind();
            viewgridview1.Visible = true;
            dr15.Close();
            q1.Remove(0);
        }
        else if (drpselect2.SelectedItem.Text == "Medical Department")
        {
            viewgridview1.Visible = false;
            q1 = "SELECT Medicine.CompanyName, MedicalDept.DeptName, Diseases.DiseasesName, Medicine.MedicineName, Medicine.Description, Medicine.Price, Stock.Quantity, Medicine.ExpiryDate, Medicine.Discount, Medicine.MedicineImage FROM Medicine INNER JOIN MedicalDept ON Medicine.MDID = MedicalDept.MDID INNER JOIN Stock ON Medicine.MID = Stock.MID AND MedicalDept.MDID = Stock.MDID INNER JOIN Diseases ON Medicine.DID = Diseases.DID where flag = '0' ";
            dr16 = db.reader(q1);
            viewgridview2.DataSource = dr16;
            viewgridview2.DataBind();
            dr16.Close();
            q1.Remove(0);
        }
    }
}