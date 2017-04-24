using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class Dpatientpro : System.Web.UI.Page
{
    Database db = new Database();
    
    string q1, doctorname;
    SqlDataReader dr1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            doctorname = Session["DoctorName"].ToString();
            q1 = "select PatientName, DeptName, Problem from UserProblem where DoctorName = '"+doctorname+"' ";
            dr1 = db.reader(q1);
            GridView1.DataSource = dr1;
            GridView1.DataBind();
        }
    }
}