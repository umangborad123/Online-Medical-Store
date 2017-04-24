using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class AManageMedicalDepartment : System.Web.UI.Page
{
    Database db = new Database();
    String query, q1;
    SqlDataReader dr1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            AddPanel.Visible = false;
            EditorDeletepanel.Visible = false;
            ViewPanel.Visible = false;
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
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        q1 = "select DeptName from MedicalDept where DeptName = '" + txtdept.Text + "' ";
        dr1 = db.reader(q1);
        if (dr1.HasRows)
        {
            dr1.Close();
            MessageBox.Show("Same department cannot be added twice!");
            txtdept.Text = "";
            
        }
        else
        {
            dr1.Close();
            query = "insert into MedicalDept (DeptName) values ('" + txtdept.Text + "')";
            db.insertData(query);
            txtdept.Text = "";
            drptype.SelectedIndex = 0;
            
        }

    }
    protected void txtdept_TextChanged(object sender, EventArgs e)
    {

    }
}