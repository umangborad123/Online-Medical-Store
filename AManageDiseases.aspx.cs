using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class AManageDiseases : System.Web.UI.Page
{
    SqlDataReader dr, dr1, dr3, dr4, dr5, dr6, dr7;
    Database db = new Database();
    String query1, q1, query2, query3, q4, diseaseName;
    int mdid, mdid2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            AddPanel.Visible = false;
            EditorDeletepanel.Visible = false;
            ViewPanel.Visible = false;

            drpdeptname.Items.Clear();
            drpdeptname.Items.Add("Select Department");
            query1 = "select DeptName from MedicalDept";
            dr1 = db.reader(query1);
            while (dr1.Read())
            {
                drpdeptname.Items.Add(dr1[0].ToString());
            }
            dr1.Close();
            query1.Remove(0);

        }
    }
    protected void drptype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drptype.SelectedItem.Text == "Add")
        {
            AddPanel.Visible = true;
            EditorDeletepanel.Visible = false;
            ViewPanel.Visible = false;

        }
        else if (drptype.SelectedItem.Text == "Edit or Delete")
        {
            AddPanel.Visible = false;
            EditorDeletepanel.Visible = true;
            ViewPanel.Visible = false;

        }
        else if (drptype.SelectedItem.Text == "View")
        {
            AddPanel.Visible = false;
            EditorDeletepanel.Visible = false;
            ViewPanel.Visible = true;
            
            drpmedicaldept.Items.Clear();
            drpmedicaldept.Items.Add("Select Medical Department");
            q1 = "select DeptName from MedicalDept";
            dr5 = db.reader(q1);
            while (dr5.Read())
            {
                drpmedicaldept.Items.Add(dr5[0].ToString());
            }
            dr5.Close();
            q1.Remove(0);

            


        }
    }

    protected void drpmedicaldept_SelectedIndexChanged(object sender, EventArgs e)
    {
        q1 = "select MDID from MedicalDept where DeptName = '" + drpmedicaldept.SelectedItem.Text + "' ";
        dr6 = db.reader(q1);
        while (dr6.Read())
        {
            mdid2 = Convert.ToInt32(dr6[0].ToString());
        }
        dr6.Close();
        q1.Remove(0);

        q1 = "select DiseasesName, Symptoms from Diseases where MDID = '" + mdid2 + "' ";
        dr7 = db.reader(q1);
        viewgridview.DataSource = dr7;
        viewgridview.DataBind();
        q1.Remove(0);
        dr7.Close();
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        query1 = "select MDID from MedicalDept where DeptName = '" + drpdeptname.Text + "'";
        dr = db.reader(query1);
        while (dr.Read())
        {
            mdid = Convert.ToInt32(dr[0].ToString());
        }
        dr.Close();

        query3 = "select DiseasesName from Diseases where DiseasesName = '" + txtdisease.Text + "' ";
        dr3 = db.reader(query3);

        if (dr3.HasRows)
        {
            MessageBox.Show("Same Disease name is not allowed!");
            txtdisease.Text = "";
            txtsymptoms.Text = "";
            dr3.Close();
        }

        else
        {
            dr3.Close();
            query2 = "insert into Diseases (MDID, DiseasesName, Symptoms) values ('" + mdid + "', '" + txtdisease.Text + "', '" + txtsymptoms.Text + "')";
            db.insertData(query2);
            drptype.SelectedIndex = 0;
            drpdeptname.SelectedIndex = 0;
            txtdisease.Text = "";
            txtsymptoms.Text = "";
        }



    }
    protected void txtdisease_TextChanged(object sender, EventArgs e)
    {
        q4 = "select * from Diseases where MDID = '" + mdid + "' and DiseasesName = '" + txtdisease.Text + "' ";
        dr4 = db.reader(q4);
        if (dr4.HasRows)
        {
            MessageBox.Show("Same Disease name is not allowed!");
        }
        dr4.Close();
    }
    
}