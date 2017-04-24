using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class UaddDisease : System.Web.UI.Page
{
    Database db = new Database();
    int mdid;
    string q1, patientname;
    SqlDataReader dr1, dr2, dr3, dr4;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            drpdoctor.Visible = false;
            lbldoctor.Visible = false;
            lblproblem.Visible = false;
            txtproblem.Visible = false;
            btnadd.Visible = false;

            drpname.Items.Clear();
            drpname.Items.Add("Select Department");
            q1 = "select DeptName from MedicalDept";
            dr4 = db.reader(q1);
            q1.Remove(0);
            while (dr4.Read())
            {
                drpname.Items.Add(dr4[0].ToString());
            }
            dr4.Close();

        }
    }
    protected void drpname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpname.SelectedItem != null)
        {
            q1 = "select MDID from MedicalDept where DeptName = '"+drpname.SelectedItem.Text+"' ";
            dr1 = db.reader(q1);
            while (dr1.Read())
            {
                mdid = Convert.ToInt32(dr1[0].ToString());
            }
            dr1.Close();
            q1.Remove(0);

            lbldoctor.Visible = true;
            drpdoctor.Visible = true;
            lblproblem.Visible = true;
            txtproblem.Visible = true;
            btnadd.Visible = true;
            drpdoctor.Items.Clear();
            drpdoctor.Items.Add("Select Doctor");
            q1 = "select Name from Registration where MDID = '"+mdid+"' ";
            dr2 = db.reader(q1);
            while (dr2.Read())
            {
                drpdoctor.Items.Add(dr2[0].ToString());
            }
            dr2.Close();
            q1.Remove(0);
            
            

        }
        
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        q1 = "select Name from Registration where RID = '" + Session["rid"].ToString() + "' ";
        dr3 = db.reader(q1);
        while (dr3.Read())
        {
            patientname = dr3[0].ToString();
        }
        dr3.Close();
        q1.Remove(0);

        q1 = "insert into UserProblem (PatientName, DeptName, DoctorName, Problem) values ('"+patientname+"', '"+drpname.SelectedItem.Text+"', '"+drpdoctor.SelectedItem.Text+"', '"+txtproblem.Text+"' ) ";
        db.insertData(q1);
        q1.Remove(0);

        drpname.SelectedIndex = 0;
        drpdoctor.SelectedIndex = 0;
        txtproblem.Text = "";
    }
}