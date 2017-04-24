using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class Umail : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr1, dr2, dr3;
    string q1, filename, fromuser;
    int fromrid, torid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            lblmail.Text = "Respose Mail";
            txtto.Text = Session["emailto"].ToString();
            fromrid = Convert.ToInt32(Session["rid"].ToString());
            txtto.Enabled = false;

            if (Session["sub"] != null)
            {
                txtsub.Text = Session["sub"].ToString();
            }
            else
            {
                
            }
        }
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
           // MessageBox.Show("Please select file!!!");
        }

        string date = DateTime.Now.ToShortDateString();

        fromrid = Convert.ToInt32(Session["rid"].ToString());

        q1 = "select RID from Registration where Email = '" + Session["emailto"].ToString() + "' ";
        dr3 = db.reader(q1);
        while (dr3.Read())
        {
            torid = Convert.ToInt32(dr3[0].ToString());
        }
        dr3.Close();
        q1.Remove(0);

        q1 = "select Email from Registration where RID = '"+fromrid+"' ";
        dr1 = db.reader(q1);
        while (dr1.Read())
        {
            fromuser = dr1[0].ToString();
        }
        dr1.Close();
        q1.Remove(0);
        
        q1 = "insert into Mail (FromUID, ToUID, FromRID, ToRID, FromUser, ToUser, Subject, Message, UploadFile, Date ) values ('5','2','" +fromrid+ "','" + torid + "','"+fromuser+"','" + txtto.Text + "','" + txtsub.Text + "','" + txtms.Text + "','" + filename + "','" + date + "')";
        db.insertData(q1);
        q1.Remove(0);

        txtto.Text = "";
        txtsub.Text = "";
        txtms.Text = "";
    }
}