using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    SqlConnection con = new SqlConnection("Data Source=PRATIX\\SQL2008;Initial Catalog=OMSI;Integrated Security=True");
    SqlCommand cmd;
    
	public Database()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void insertData(String query)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }

    public SqlDataReader reader(string query)
    {
       // opn.conOpen();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
            // con.Open();
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            return dr;

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
       // cls.closeCon();
    }
    public void delete(string query)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
}



