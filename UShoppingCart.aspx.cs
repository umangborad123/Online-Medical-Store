using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class UShoppingCart : System.Web.UI.Page
{
    Database db = new Database();
   
    int mdid, did, cid, subcatid, qty, j = 0, tempqty;
    decimal total;
    double tempprice, temptotal;
    string q1, path, tempmedicine, temppath, tempcat, tempsubcat, tempdept, dept, cat, subcat;
    
    SqlDataReader dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            if (Session["medicname"] != null && Session["medicprice"] != null && Session["catname"] != null && Session["subcatname"] != null)
            {
                drpdeptcat.SelectedItem.Text = "Medical Category";
                drpdeptcat.Enabled = false;
                lblcname.Visible = true;
                drpcname.Visible = true;
                panelmedicdept.Visible = false;
                btnproceed.Visible = false;

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

                drpcname.SelectedItem.Text = "Himalaya" ;
                drpcname.Enabled = false;
                panelcategory.Visible = true;
                

                q1 = "select CategoryName from Category where CategoryName='"+Session["catname"].ToString()+"'";
                dr1 = db.reader(q1);
                q1.Remove(0);
                //drpcategory.Items.Clear();
                
                while (dr1.Read())
                {
                     drpcategory.Items.Add(dr1[0].ToString());
                }
                dr1.Close();

                
               
                drpcategory.Enabled = false;

                subcat = Session["subcatname"].ToString();

                q1 = "select SubCatName from SubCategory where SubCatName = '" + Session["subcatname"].ToString() + "' ";
                dr1 = db.reader(q1);
                q1.Remove(0);
                drpsubcategory.Items.Clear();

                while (dr1.Read())
                {
                    drpsubcategory.Items.Add(dr1[0].ToString());
                }
                dr1.Close();

                drpsubcategory.Enabled = false;
                panelbtn.Visible = true;

                q1 = "select MedicineName from Medicine where MedicineName = '" + Session["medicname"].ToString() + "' ";
                dr1 = db.reader(q1);
                q1.Remove(0);
                drpmedicinename.Items.Clear();

                while (dr1.Read())
                {
                    drpmedicinename.Items.Add(dr1[0].ToString());
                }
                dr1.Close();

                
                //drpmedicinename.SelectedItem.Text = Session["medicname"].ToString();
                drpmedicinename.Enabled = false;
                lbldisplayprice.Text = Session["medicprice"].ToString();
                drpquantity.Items.Clear();
                drpquantity.Items.Add("Select Quantity");
                for (int i = 1; i <= 20; i++)
                {
                    drpquantity.Items.Add("" + i);
                }

                storepath();

                imgdisp.Visible = true;
                imgdisp.Src = path;
               


            }
            else
            {
                panelmedicdept.Visible = false;
                panelcategory.Visible = false;
                panelbtn.Visible = false;
                lblcname.Visible = false;
                drpcname.Visible = false;
                imgdisp.Visible = false;
                lblshoppingcart.Visible = false;
                btnproceed.Visible = false;

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

                q1 = "select CategoryName from Category ";
                dr1 = db.reader(q1);
                q1.Remove(0);
                drpcategory.Items.Clear();
                
                while (dr1.Read())
                {
                    drpcategory.Items.Add(dr1[0].ToString());
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
            



        }

        //q1 = "select MDID from MedicalDept where DeptName = '" + drpmedicdept.SelectedItem.Text + "'";
        //dr3 = db.reader(q1);
        //while (dr3.Read())
        //{
        //    mdid = Convert.ToInt32(dr3[0].ToString());
        //}
        //dr3.Close();
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
            lblshoppingcart.Visible = true;
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            panelmedicdept.Visible = false;
            panelcategory.Visible = true;
            panelbtn.Visible = true;
            lblcname.Visible = true;
            drpcname.Visible = true;
            lblshoppingcart.Visible = true;
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
        q1 = "select DiseasesName from Diseases where MDID = '" + mdid + "' ";
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
        q1 = "select MDID from MedicalDept where DeptName = '" + drpmedicdept.SelectedItem.Text + "'";
        dr3 = db.reader(q1);
        while (dr3.Read())
        {
            mdid = Convert.ToInt32(dr3[0].ToString());
        }
        dr3.Close();

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
        q1 = "select MedicineName from Medicine where MDID = '" + mdid + "' and DID = '" + did + "' and CompanyName = '" + drpcname.SelectedItem.Text + "' ";
        dr6 = db.reader(q1);
        q1.Remove(0);
        while (dr6.Read())
        {
            drpmedicinename.Items.Add(dr6[0].ToString());
        }
        dr6.Close();
    }

    public void storepath()
    {
        if (Session["medicname"] != null && Session["medicprice"] != null && Session["catname"] != null && Session["subcatname"] != null)
        {
            q1 = "select MedicineImage from Medicine where MedicineName = '" + Session["medicname"].ToString() + "' ";
            dr7 = db.reader(q1);
            q1.Remove(0);
            while (dr7.Read())
            {
                
                path = dr7[0].ToString();
            }
            dr7.Close();
        }
        else
        {
            q1 = "select Price, MedicineImage from Medicine where MedicineName = '" + drpmedicinename.SelectedItem.Text + "' ";
            dr7 = db.reader(q1);
            q1.Remove(0);
            while (dr7.Read())
            {
                lbldisplayprice.Text = dr7[0].ToString();
                path = dr7[1].ToString();
            }
            dr7.Close();
        }
        
         
    }

    protected void drpmedicinename_SelectedIndexChanged(object sender, EventArgs e)
    {

        storepath();

        imgdisp.Visible = true;
        imgdisp.Src = path;


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

        if (drpcategory.SelectedItem.Text == "Baby Care" || drpcategory.SelectedItem.Text == "Nutrition Health")
        {
            q1 = "select MedicineName from Medicine where CID = '" + cid + "' and CompanyName = '" + drpcname.SelectedItem.Text + "' ";
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

        else
        {
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

        
    }

    protected void drpquantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["medicname"] != null && Session["medicprice"] != null && Session["catname"] != null && Session["subcatname"] != null)
        {
            lbldisplayprice.Text = Session["medicprice"].ToString();
            total = Convert.ToDecimal(lbldisplayprice.Text);
            qty = Convert.ToInt32(drpquantity.SelectedItem.Text);
            lbldisplaytotal.Text = Convert.ToString(total * qty);
        }
        else
        {
            total = Convert.ToDecimal(lbldisplayprice.Text);
            qty = Convert.ToInt32(drpquantity.SelectedItem.Text);
            lbldisplaytotal.Text = Convert.ToString(total * qty);
        }
        
    }

    private void BindGrid(int rowcount)
    {
        storepath();

        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        dt.Columns.Add(new System.Data.DataColumn("Medicine Name", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Price", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Quantity", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Total Price", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Path", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Category Name", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("SubCategory Name", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Department Name", typeof(String)));

        if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            
            //dr["Department Name"] = "";



            if (ViewState["CurrentData"] != null)
            {
                for (int i = 0; i < rowcount + 1; i++)
                {
                    dt = (DataTable)ViewState["CurrentData"];
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr[0] = dt.Rows[0][0].ToString();

                    }
                }
                dr = dt.NewRow();
                dr[0] = drpmedicinename.SelectedItem.Text;
                dr[1] = lbldisplayprice.Text;
                dr[2] = drpquantity.SelectedItem.Text;
                dr[3] = lbldisplaytotal.Text;
                dr[4] = path;
                dr[5] = drpcategory.SelectedItem.Text;
                dr[6] = drpsubcategory.SelectedItem.Text;
                dr[7] = "Null";


                //GridView1.Columns[4].Visible = false;
                dt.Rows.Add(dr);

            }
            else
            {
                dr = dt.NewRow();
                dr[0] = drpmedicinename.SelectedItem.Text;
                dr[1] = lbldisplayprice.Text;
                dr[2] = drpquantity.SelectedItem.Text;
                dr[3] = lbldisplaytotal.Text;
                dr[4] = path;
                dr[5] = drpcategory.SelectedItem.Text;
                dr[6] = drpsubcategory.SelectedItem.Text;
                dr[7] = "Null";
                //GridView1.Columns[4].Visible = false;
                dt.Rows.Add(dr);


            }

            // If ViewState has a data then use the value as the DataSource
            if (ViewState["CurrentData"] != null)
            {
                GridView1.DataSource = (DataTable)ViewState["CurrentData"];
                GridView1.DataBind();
            }
            else
            {
                // Bind GridView with the initial data assocaited in the DataTable
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            // Store the DataTable in ViewState to retain the values
            ViewState["CurrentData"] = dt;
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            //dr["Category Name"] = "";
            //dr["SubCategory Name"] = "";


            if (ViewState["CurrentData"] != null)
            {
                for (int i = 0; i < rowcount + 1; i++)
                {
                    dt = (DataTable)ViewState["CurrentData"];
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr[0] = dt.Rows[0][0].ToString();

                    }
                }
                dr = dt.NewRow();
                dr[0] = drpmedicinename.SelectedItem.Text;
                dr[1] = lbldisplayprice.Text;
                dr[2] = drpquantity.SelectedItem.Text;
                dr[3] = lbldisplaytotal.Text;
                dr[4] = path;
                dr[5] = "Null";
                dr[6] = "Null";
                dr[7] = drpmedicdept.SelectedItem.Text;


                //GridView1.Columns[4].Visible = false;
                dt.Rows.Add(dr);

            }
            else
            {
                dr = dt.NewRow();
                dr[0] = drpmedicinename.SelectedItem.Text;
                dr[1] = lbldisplayprice.Text;
                dr[2] = drpquantity.SelectedItem.Text;
                dr[3] = lbldisplaytotal.Text;
                dr[4] = path;
                dr[5] = "Null";
                dr[6] = "Null";
                dr[7] = drpmedicdept.SelectedItem.Text;

                dept = drpmedicdept.SelectedItem.Text;
                //GridView1.Columns[4].Visible = false;
                dt.Rows.Add(dr);


            }

            // If ViewState has a data then use the value as the DataSource
            if (ViewState["CurrentData"] != null)
            {
                GridView1.DataSource = (DataTable)ViewState["CurrentData"];
                GridView1.DataBind();
            }
            else
            {
                // Bind GridView with the initial data assocaited in the DataTable
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            // Store the DataTable in ViewState to retain the values
            ViewState["CurrentData"] = dt;
        }

        

    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        
        Application["medCounts"] = Convert.ToInt32(Application["medCounts"].ToString()) + 1;
        lblitemcount.Text = GridView1.Rows.Count.ToString();
        lblshoppingcart.Text = "Items added to cart --> " + Application["medCounts"].ToString();
       // lblitemcount.Text = Application["medCounts"].ToString();
        
        Session.Remove("medicname");
        Session.Remove("medicprice");
        Session.Remove("catname");
        Session.Remove("subcatname");

        if (ViewState["CurrentData"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentData"];
            int count = dt.Rows.Count;
            BindGrid(count);
           
        }
        else
        {
            BindGrid(1);
           
        }
        if (drpdeptcat.SelectedItem.Text == "Medical Category")
        {
            drpcategory.SelectedIndex = 0;
            drpsubcategory.SelectedIndex = 0;
        }
        else if (drpdeptcat.SelectedItem.Text == "Medical Department")
        {
            drpmedicdept.SelectedIndex = 0;
            drpdisease.SelectedIndex = 0;
        }


        drpmedicinename.SelectedIndex = 0;
        lbldisplayprice.Text = "0.00";
        drpquantity.SelectedIndex = 0;
        lbldisplaytotal.Text = "0.00";
        drpdeptcat.SelectedIndex = 0;
        drpcname.SelectedIndex = 0;
        
        drpquantity.Focus();
        btnproceed.Visible = true;

    }
    protected void btnproceed_Click(object sender, ImageClickEventArgs e)
    {
       
        
          for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (GridView1.Rows[i].Cells[7].Text != "Null")
                {


                    tempmedicine = GridView1.Rows[i].Cells[0].Text.ToString();
                    tempprice = Convert.ToDouble(GridView1.Rows[i].Cells[1].Text);
                    tempqty = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                    temptotal = Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                    temppath = GridView1.Rows[i].Cells[4].Text.ToString();
                    //tempcat = GridView1.Rows[i].Cells[5].Text.ToString();
                    //tempsubcat = GridView1.Rows[i].Cells[6].Text.ToString();
                    tempdept = GridView1.Rows[i].Cells[7].Text.ToString();


                    q1 = "insert into TempCart (MedicineName, Price, Quantity, Total, Path, CategoryName, SubCatName, DepartmentName, OrderDate ) values ( '" + tempmedicine + "' , '" + tempprice + "', '" + tempqty + "', '" + temptotal + "' , '" + temppath + "' , 'Null ' , 'Null ' , '" + tempdept + "' , '" + DateTime.Now.ToString("dd/MM/yyyy") + "' ) ";
                    db.insertData(q1);

                }
                else
                {
                    tempmedicine = GridView1.Rows[i].Cells[0].Text.ToString();
                    tempprice = Convert.ToDouble(GridView1.Rows[i].Cells[1].Text);
                    tempqty = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                    temptotal = Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                    temppath = GridView1.Rows[i].Cells[4].Text.ToString();
                    tempcat = GridView1.Rows[i].Cells[5].Text.ToString();
                    tempsubcat = GridView1.Rows[i].Cells[6].Text.ToString();
                    //tempdept = GridView1.Rows[i].Cells[7].Text.ToString();


                    q1 = "insert into TempCart (MedicineName, Price, Quantity, Total, Path, CategoryName, SubCatName, DepartmentName, OrderDate ) values ( '" + tempmedicine + "' , '" + tempprice + "', '" + tempqty + "', '" + temptotal + "' , '" + temppath + "' , '" + tempcat + "' , ' " + tempsubcat + " ' , 'Null' , '" + DateTime.Now.ToString("MM/dd/yyyy") + "' ) ";
                    db.insertData(q1);
                }
            }
     
        Response.Redirect("UBilling.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[4].Visible = false;
    }
}