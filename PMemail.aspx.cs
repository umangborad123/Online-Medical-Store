using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class PMemail : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1,dr2, dr3;
    string q1, filename, fromuser;
    int touid, touid2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["emailto"] != null)
            {
                lblmail.Text = "Response Mail";
                txtto.Text = Session["emailto"].ToString();
                txtto.Enabled = false;
                txtsub.Text = Session["sub"].ToString();
                Session.Remove("emailto");
            }
            else
            {
                lblmail.Text = "Compose Mail";
            }
        }
    }
    protected void snbt_Click(object sender, ImageClickEventArgs e)
    {
        q1 = "Select Email from Registration where RID = '" + Session["rid"].ToString() + "' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            fromuser = dr1[0].ToString();
        }
        dr1.Close();
        q1.Remove(0);
                
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

         if (txtto.Text != null && lblmail.Text == "Response Mail")
         {
             q1 = "Select UID from Registration where Email = '" + txtto.Text + "'";
             dr2 = db.reader(q1);
             while (dr2.Read())
             {
                touid = Convert.ToInt32(dr2[0].ToString());
             }
             dr2.Close();
             q1.Remove(0);

             q1 = "insert into Mail (FromUID, ToUID, FromUser, ToUser, Subject, Message, Date, UploadFile) values ('4', '" + touid + "', '" + fromuser + "', '" + txtto.Text + "', '" + txtsub.Text + "', '" + txtms.Text + "', '" + date + "', '" + filename + "' ) ";
             db.insertData(q1);
             q1.Remove(0);
         }
         else
         {
             q1 = "select UID from Registration where Email = '" + txtto.Text + "' ";
             dr2 = db.reader(q1);
             while (dr2.Read())
             {
                touid2 = Convert.ToInt32(dr2[0].ToString());
             }
             dr2.Close();
             q1.Remove(0);

             q1 = "insert into Mail (FromUID, ToUID, FromUser, ToUser, Subject, Message, Date, UploadFile) values ('4', '" + touid2 + "', '" + fromuser + "', '" + txtto.Text + "', '" + txtsub.Text + "', '" + txtms.Text + "', '" + date + "', '" + filename + "' ) ";
             db.insertData(q1);
             q1.Remove(0);
         }
         txtto.Text = "";
         txtsub.Text = "";
         txtms.Text = "";
          
    }
}