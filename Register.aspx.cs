using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Register : System.Web.UI.Page
{
    int uid,sid,mdid;
    string queryinsert, Selectq , gender, query1, query2, query3, q4, q5;
    Database db = new Database();
    
    SqlDataReader dr,dr1, dr2, dr3, dr4, dr5, dr6;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Panel1.Visible = false;
            drpusertype.Items.Clear();
            drpusertype.Items.Add("Select User");
            drpusertype.Items.Add("Patient");
            drpusertype.Items.Add("Doctor");
            drpusertype.Items.Add("Stock Manager");
            drpusertype.Items.Add("Pharma Manager");

            drpmedicaldept.Items.Clear();
            drpmedicaldept.Items.Add("Select Department");
            query1 = "select DeptName from MedicalDept";
            dr6 = db.reader(query1);
            query1.Remove(0);
            while (dr6.Read())
            {
                drpmedicaldept.Items.Add(dr6[0].ToString());
            }
            dr6.Close();
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
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        txtfname.Text = "";
        txtcname.Text = "";
        txtaddress.Text = "";
        //drpstate.Items.Clear();
        //drpcity.Items.Clear();
        txtpincode.Text = "";
        txtmobile.Text = "";
        txtemail.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
        txtconfirm.Text = "";

        
    }
    protected void drpusertype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpusertype.SelectedItem.Text == "Patient")
        {
            UpdatePanel1.Visible = true;
            Panel1.Visible = true;
            lbldob.Visible = true;
            Calendar.Visible = true;
            lblmedicaldept.Visible = false;
            drpmedicaldept.Visible = false;
            lblCname.Visible = false;
            txtcname.Visible = false;
            RequiredFieldValidatorcompany.Visible = false;
            RegularExpressionValidatorcompany.Visible = false;
            //lbluser.Visible = false;
            //drpusertype.Visible = false;
        }

        else if (drpusertype.SelectedItem.Text == "Stock Manager")
        {
            UpdatePanel1.Visible = true;
            Panel1.Visible = true;
            lblmedicaldept.Visible = false;
            drpmedicaldept.Visible = false;
            lblCname.Visible = false;
            txtcname.Visible = false;
            RequiredFieldValidatorcompany.Visible = false;
            RegularExpressionValidatorcompany.Visible = false;
            lbldob.Visible = false;
            Calendar.Visible = false;
        }
        else if (drpusertype.SelectedItem.Text == "Doctor")
        {
            UpdatePanel1.Visible = true;
            Panel1.Visible = true;
            lblmedicaldept.Visible = true;
            drpmedicaldept.Visible = true;
            lblCname.Visible = false;
            txtcname.Visible = false;
            RequiredFieldValidatorcompany.Visible = false;
            RegularExpressionValidatorcompany.Visible = false;
            lbldob.Visible = false;
            Calendar.Visible = false;
        }
        else
        {
            UpdatePanel1.Visible = true;
            Panel1.Visible = true;
            lblCname.Visible = true;
            txtcname.Visible = true;
            lblmedicaldept.Visible = false;
            drpmedicaldept.Visible = false;
            RequiredFieldValidatorcompany.Visible = false;
            RegularExpressionValidatorcompany.Visible = false;
            lbldob.Visible = false;
            Calendar.Visible = false;
            //lbluser.Visible = false;
            //drpusertype.Visible = false;
        }
    }

    protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
    {
       // opn.conOpen();
        query1 = "select State,SID from State where State = '"+drpstate.SelectedItem.Text+"' ";
        dr3 = db.reader(query1);
        
        while (dr3.Read())
        {
            sid = Convert.ToInt32(dr3[1].ToString());
        }
        dr3.Close();

        query2 = "select City,SID from City where SID = '"+sid+"'";
        dr4 = db.reader(query2);
        drpcity.Items.Clear();
        drpcity.Items.Add("Select City");
        while (dr4.Read())
        {
            
            drpcity.Items.Add(dr4[0].ToString());
        }
        dr4.Close();
        
    }


    
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        query1 = "Select UID,UserType from UserType where UserType='" + drpusertype.SelectedItem.Text + "'";
        dr1 = db.reader(query1);

        while (dr1.Read())
        {
            uid = Convert.ToInt16(dr1[0].ToString());
        }
        dr1.Close();


        if (rbmale.Checked == true)
        {
            gender = rbmale.Text;

        }
        else
        {
            gender = rbfemale.Text;
        }

        query2 = "select UserName from Registration where UserName = '" + txtusername.Text + "'";
        dr2 = db.reader(query2);

        if (dr2.HasRows)
        {

            MessageBox.Show("Already Exist");
            txtusername.Text = "";

        }
        dr2.Close();

        q5 = "select Email from Registration where Email = '"+txtemail.Text+"'";
        dr5 = db.reader(q5);
        if (dr5.HasRows)
        {
            
            MessageBox.Show("Already Exist");
            txtemail.Text = "";
        }
        dr5.Close();

        DropDownList Drpyear = Calendar.FindControl("drpyear") as DropDownList;
        string year = Drpyear.SelectedItem.Text;

        DropDownList Drpmonth = Calendar.FindControl("drpmonth") as DropDownList;
        string month = Drpmonth.SelectedItem.Text;

        DropDownList Drpday = Calendar.FindControl("drpday") as DropDownList;
        string day = Drpday.SelectedItem.Text;

        string finaldate = day + "/" + month + "/" + year;

        if (drpusertype.SelectedItem.Text == "Doctor")
        {
            query3 = "select MDID from MedicalDept where DeptName = '" + drpmedicaldept.Text + "'";
            dr3 = db.reader(query3);
            while (dr3.Read())
            {
                mdid = Convert.ToInt16(dr3[0].ToString());
            }
            dr3.Close();

            queryinsert = "insert into Registration (UID, MDID, Name, Address, State, City, Pincode, MobileNo, Gender, Email, UserName, Password) values ('" + uid + "','" + mdid + "','" + txtfname.Text + "', '" + txtaddress.Text + "','" + drpstate.SelectedItem.Text + "', '" + drpcity.SelectedItem.Text + "', '" + txtpincode.Text + "', '" + txtmobile.Text + "', '" + gender + "', '" + txtemail.Text + "', '" + txtusername.Text + "', '" + txtpassword.Text + "')";
            db.insertData(queryinsert);
            queryinsert.Remove(0);

        }

        else if (drpusertype.SelectedItem.Text == "Patient")
        {
            queryinsert = "insert into Registration (UID, Name, Address, DateOfBirth, State, City, Pincode, MobileNo, Gender, Email, UserName, Password) values ('" + uid + "','" + txtfname.Text + "', '" + txtaddress.Text + "','" + finaldate + "', '" + drpstate.SelectedItem.Text + "', '" + drpcity.SelectedItem.Text + "', '" + txtpincode.Text + "', '" + txtmobile.Text + "', '" + gender + "', '" + txtemail.Text + "', '" + txtusername.Text + "', '" + txtpassword.Text + "')";
            db.insertData(queryinsert);
            queryinsert.Remove(0);
        }

        else if (drpusertype.SelectedItem.Text == "Stock Manager")
        {
            queryinsert = "insert into Registration (UID, Name, Address, State, City, Pincode, MobileNo, Gender, Email, UserName, Password) values ('" + uid + "','" + txtfname.Text + "', '" + txtaddress.Text + "','" + drpstate.SelectedItem.Text + "', '" + drpcity.SelectedItem.Text + "', '" + txtpincode.Text + "', '" + txtmobile.Text + "', '" + gender + "', '" + txtemail.Text + "', '" + txtusername.Text + "', '" + txtpassword.Text + "')";
            db.insertData(queryinsert);
            queryinsert.Remove(0);
        }

        else
        {
            queryinsert = "insert into Registration (UID, Name, Address, State, City, Pincode, MobileNo, Gender, Email, UserName, Password, CompanyName) values('" + uid + "','" + txtfname.Text + "','" + txtaddress.Text + "','" + drpstate.SelectedItem.Text + "', '" + drpcity.SelectedItem.Text + "', '" + txtpincode.Text + "', '" + txtmobile.Text + "', '" + gender + "', '" + txtemail.Text + "', '" + txtusername.Text + "', '" + txtpassword.Text + "' , '" + txtcname.Text + "')";
            db.insertData(queryinsert);
            queryinsert.Remove(0);

            q4 = "insert into CompanyName (CompanyName) values ('" + txtcname.Text + "')";
            db.insertData(q4);

        }

        drpusertype.SelectedIndex = 0;
        drpmedicaldept.SelectedIndex = 0;
        txtfname.Text = "";
        txtaddress.Text = "";
        drpstate.SelectedIndex = 0;
        drpcity.SelectedIndex = 0;
        txtpincode.Text = "";
        txtmobile.Text = "";
        rbmale.Checked = false;
        rbfemale.Checked = false;
        txtemail.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
        txtconfirm.Text = "";
        txtcname.Text = "";
       
    }
}