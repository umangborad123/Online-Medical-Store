using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class DResponseEmail : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1, dr2, dr3;
    string q1, q2, q3, filename, fromuser;
    int fromrid, torid;

    protected void Page_Load(object sender, EventArgs e)
    {
        txtto.Text = Session["emailto"].ToString();
        txtto.Enabled = false;
        txtsub.Text = Session["sub"].ToString();
    }
    protected void snbt_Click(object sender, ImageClickEventArgs e)
    {
        filename = Path.GetFileName(fusmemail.PostedFile.FileName);
        if (fusmemail.HasFile == true)
        {
            fusmemail.SaveAs(Server.MapPath("FileUpload/" + filename));
        }
        else
        {
            //MessageBox.Show("Please select file!!!");
        }

        string date = DateTime.Now.ToShortDateString();

        fromrid = Convert.ToInt32(Session["rid"].ToString());

        q1 = "select RID from Registration where Email = '" + Session["emailto"].ToString() + "' ";
        dr2 = db.reader(q1);
        while (dr2.Read())
        {
            torid = Convert.ToInt32(dr2[0].ToString());
        }
        dr2.Close();
        q1.Remove(0);

        q1 = "select Email from Registration where RID = '" + fromrid + "' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            fromuser = dr1[0].ToString();
        }
        dr1.Close();
        q1.Remove(0);

        q2 = "insert into Mail (FromUID, ToUID, FromRID, ToRID, FromUser, ToUser, Subject, Message, UploadFile, Date ) values ('2','5','" + fromrid + "','" + torid + "','" + fromuser + "','" + txtto.Text + "','" + txtsub.Text + "','" + txtms.Text + "','" + filename + "','" + date + "')";
        db.insertData(q2);
        q2.Remove(0);

        txtto.Text = "";
        txtsub.Text = "";
        txtms.Text = "";
    }
}