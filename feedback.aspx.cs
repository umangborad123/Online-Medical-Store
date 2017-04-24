using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=UMANG;Initial Catalog=OMSI;Integrated Security=True");
    SqlCommand cmd;
    String query;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void buttonsubmit_Click(object sender, ImageClickEventArgs e)
    {
        con.Open();
        query = "Insert into Feedback (Name,Email,Comment) values ('" + txtname.Text + "','" + txtemail.Text + "','" + txtcomment.Text + "')";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        Response.Redirect("Index.aspx");
        txtname.Text = "";
        txtemail.Text = "";
        txtcomment.Text = "";
    }
}