using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Index : System.Web.UI.MasterPage
{
    Database db = new Database();
    string q1, q2, q3, q4, q5, q6, q7, pass1, Dname, Pname, Sname, Uname;
    int uid;
    SqlDataReader dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            //q6 = "select CompanyName from CompanyName";
            //dr6 = db.reader(q6);
            //while (dr6.Read())
            //{
            //    BulletedList1.Items.Add(dr6[0].ToString());  
               
            //}
            //dr6.Close();
            //q6.Remove(0);
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        q1 = "select UID from Registration where UserName = '" + txtUserName.Text + "'";
        dr1 = db.reader(q1);
        q1.Remove(0);
        while (dr1.Read())
        {
            uid = Convert.ToInt32(dr1[0].ToString());
        }
        dr1.Close();

        q1 = "select RID from Registration where UserName = '" + txtUserName.Text + "'";
        dr7 = db.reader(q1);
        q1.Remove(0);
        while (dr7.Read())
        {
            Session["rid"] = Convert.ToInt32(dr7[0].ToString()); 
        }
        dr7.Close();

        q1 = "select CompanyName from Registration where UserName = '" + txtUserName.Text + "' ";
        dr8 = db.reader(q1);
        while (dr8.Read())
        {
            Session["companyname"] = dr8[0].ToString();
        }
        dr8.Close();

        if (uid.Equals(2))
        {
            q2 = "select Name,Password from Registration where UserName = '"+txtUserName.Text+"'";
            dr2 = db.reader(q2);
            while (dr2.Read())
            {
                Dname = dr2[0].ToString();
                pass1 = dr2[1].ToString();
            }
            dr2.Close();

            if (pass1.Equals(txtPwd.Text))
            {
                Session["DoctorName"] = Dname;
                Response.Redirect("Dhome.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!");
            }
        }

        else if (uid.Equals(3))
        {
            q2 = "select Name,Password from Registration where UserName = '" + txtUserName.Text + "'";
            dr3 = db.reader(q2);
            while (dr3.Read())
            {
                Sname = dr3[0].ToString();
                pass1 = dr3[1].ToString();
            }
            dr3.Close();
            
            if (pass1.Equals(txtPwd.Text))
            {
                Session["StockManagerName"] = Sname;
                Response.Redirect("SMhome.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!");
            }
        }

        else if (uid.Equals(4))
        {
            q2 = "select Name, Password from Registration where UserName = '" + txtUserName.Text + "'";
            dr4 = db.reader(q2);
            while (dr4.Read())
            {
                Pname = dr4[0].ToString();
                pass1 = dr4[1].ToString();
            }
            dr4.Close();

            if (pass1.Equals(txtPwd.Text))
            {
                Session["PharmaManagerName"] = Pname;
                Response.Redirect("PMhome.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!");
            }
            
        }

        else if (uid.Equals(5))
        {
            q2 = "select Name, Password from Registration where UserName = '" + txtUserName.Text + "'";
            dr5 = db.reader(q2);
            while (dr5.Read())
            {
                Uname = dr5[0].ToString();
                pass1 = dr5[1].ToString();
            }
            dr5.Close();

            if (pass1.Equals(txtPwd.Text))
            {
                Session["PatientName"] = Uname;
                Response.Redirect("Uhome.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!");
            }

        }
        else
        {

            if (txtUserName.Text == "Admin" && txtPwd.Text == "Admin")
            {
                Session["Admin"] = txtUserName.Text;
                Response.Redirect("Ahome.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!");
            }
        }

    }
   
}
