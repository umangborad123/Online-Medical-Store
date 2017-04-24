using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class PMupdateProfile : System.Web.UI.Page
{
    Database db = new Database();
    int sid;
    string q1;
    SqlDataReader dr1, dr2, dr3;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            panelstate.Visible = false;
            paneltextstate.Visible = true;
            txtfname.Enabled = false;
            txtcname.Enabled = false;
            txtaddress.Enabled = false;
            txtpincode.Enabled = false;
            txtmobile.Enabled = false;
            txtemail.Enabled = false;
            txtstate.Enabled = false;
            txtcity.Enabled = false;
            btnsubmit.Visible = false;

            q1 = "select * from Registration where RID = '" + Session["rid"].ToString() + "' ";
            dr1 = db.reader(q1);
            while (dr1.Read())
            {
                txtfname.Text = dr1[3].ToString();

                txtaddress.Text = dr1[4].ToString();
                txtstate.Text = dr1[6].ToString();
                txtcity.Text = dr1[7].ToString();
                txtpincode.Text = dr1[8].ToString();

                txtmobile.Text = dr1[9].ToString();

                txtemail.Text = dr1[11].ToString();
                txtcname.Text = dr1[14].ToString();
            }
            dr1.Close();
            q1.Remove(0);
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length == 10)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select State,SID from State where State = '" + drpstate.SelectedItem.Text + "' ";
        dr2 = db.reader(q1);
        while (dr2.Read())
        {
            sid = Convert.ToInt32(dr2[1].ToString());
        }
        dr2.Close();
        q1.Remove(0);

        q1 = "select City,SID from City where SID = '" + sid + "'";
        dr3 = db.reader(q1);
        drpcity.Items.Clear();
        drpcity.Items.Add("Select City");
        while (dr3.Read())
        {

            drpcity.Items.Add(dr3[0].ToString());
        }
        dr3.Close();
        q1.Remove(0);
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        txtcname.Enabled = true;
        txtaddress.Enabled = true;
        txtpincode.Enabled = true;
        txtmobile.Enabled = true;
        txtemail.Enabled = true;
        paneltextstate.Visible = false;
        panelstate.Visible = true;
        btncancel.Visible = false;
        btnsubmit.Visible = true;
        
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        q1 = "update Registration set CompanyName = '" + txtcname.Text + "' Address = '" + txtaddress.Text + "', State = '" + drpstate.SelectedItem.Text + "', City = '" + drpcity.SelectedItem.Text + "', Pincode = '" + txtpincode.Text + "', MobileNo = '" + txtmobile.Text + "', Email = '" + txtemail.Text + "' where Name = '" + txtfname.Text + "' ";
        db.insertData(q1);
        q1.Remove(0);

        MessageBox.Show("Successfully Updated!");
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("PMhome.aspx");
    }
}