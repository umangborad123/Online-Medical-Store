using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.IO;

public partial class Aemail : System.Web.UI.Page
{
    Database db = new Database();
    SqlDataReader dr2,dr3, dr4,dr5,dr6;
    string q1, filename;
    int touid, touid2, torid, torid2;

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
               
        filename = Server.MapPath("FileUpload/" + fusmemail.FileName);
        
        if (fusmemail.HasFile == true)
        {
            fusmemail.SaveAs(Server.MapPath("FileUpload/" + fusmemail.FileName));
        }
        else
        {
            //MessageBox.Show("Please select file!!!");
        }
                   
        string date = DateTime.Now.ToShortDateString();

        //string toemail=txt
       //System.Web.UI.WebControls.Label Sourcelbl = (System.Web.UI.WebControls.Label)Page.PreviousPage.FindControl("lblto");
           
        
        
        if ( txtto.Text!=null && lblmail.Text == "Response Mail")
        {
            q1 = "Select UID, RID from Registration where Email = '" + txtto.Text+ "'";
           dr3 = db.reader(q1);
           while (dr3.Read())
           {
               touid = Convert.ToInt32(dr3[0].ToString());
               torid = Convert.ToInt32(dr3[1].ToString());
           }
           dr3.Close();
           q1.Remove(0);

           q1 = "insert into Mail (FromUID , ToUID, ToRID, FromUser, ToUser, Subject, Message, UploadFile, Date ) values ('1','" + touid + "','" + torid + "','admin@yahoo.com','" + txtto.Text + "','" + txtsub.Text + "','" + txtms.Text + "','" + filename + "','" + date + "')";
           db.insertData(q1);
           q1.Remove(0);

           txtto.Text = "";
           txtsub.Text = "";
           txtms.Text = "";
           Response.Redirect("Ahome.aspx");
        }
        else
        {
           q1 = "select UID, RID from Registration where Email = '"+txtto.Text+"' ";
           dr4 = db.reader(q1);
           while (dr4.Read())
           {
              touid2 = Convert.ToInt32(dr4[0].ToString());
              torid2 = Convert.ToInt32(dr4[1].ToString());
           }
           dr4.Close();
           q1.Remove(0);
           
           q1 = "insert into Mail (FromUID , ToUID, ToRID, FromUser, ToUser, Subject, Message, UploadFile, Date ) values ('1','" + touid2 + "','" + torid2 + "','admin@yahoo.com','" + txtto.Text + "','" + txtsub.Text + "','" + txtms.Text + "','" + filename + "','" + date + "')";
           db.insertData(q1);
           q1.Remove(0);

           txtto.Text = "";
           txtsub.Text = "";
           txtms.Text = "";
        }           
   }
}