using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Compose : System.Web.UI.Page
{
    String conn = "Data Source=DESKTOP-A3A13JE\\MSSQLSERVER01; Initial Catalog=MailDB; Integrated Security=true";
    
    int flag=0;
    protected void chekRecv()
    {
        SqlDataAdapter da = new SqlDataAdapter(" select * from Account", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["User_name"].ToString() == txtto.Text.ToLower())
            {
                flag = 1;
                break;

            }
        }
    }

    string Receiver, Sender;
    protected void getRecvName()
    {
        SqlDataAdapter da = new SqlDataAdapter(" select * from Account", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["User_name"].ToString() == txtto.Text.ToLower())
            {
                Receiver = ds.Tables[0].Rows[i]["Name"].ToString();
                break;

            }
        }
    }
    protected void getSenderName()
    {
        SqlDataAdapter da = new SqlDataAdapter(" select * from Account", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["User_name"].ToString() == userSession)
            {
                Sender = ds.Tables[0].Rows[i]["Name"].ToString();
                break;

            }
        }
    }
    protected void sendMsg()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Massage",conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        SqlCommandBuilder cmb = new SqlCommandBuilder(da);
        DataRow dr = ds.Tables[0].NewRow();
        dr["Compose_from"] = Session["UserName"].ToString();
        dr["Compose_to"] = txtto.Text;
        dr["Subject"] = txtsubject.Text;
        dr["Massage"] = txtmsg.Text;
        dr["Sender_name"] = Sender;
        dr["Receiver_name"] = Receiver;
        dr["_Time"] = DateTime.Now.ToString("hh:mm:tt");
        dr["_Date"] = DateTime.Now.ToString("dd-MMM-yyyy");
        ds.Tables[0].Rows.Add(dr);
        da.Update(ds);
        lblServerMsg.Text = "Massage Sent";
    }

    string  userSession;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
        getRecvName();
        getSenderName();
        userSession = Session["UserName"].ToString();
        txtfrom.Text = "You" + "(" + Session["UserName"] + ")";
        }
        else
        {
            lblServerMsg.Text = "Oops! You are not logged in.";
            lblServerMsg.ForeColor = System.Drawing.Color.Red;
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void btnsend_Click1(object sender, EventArgs e)
    {
        chekRecv();
        if (flag == 1)
        {
            getRecvName();
            getSenderName();
            sendMsg();
        }
        else
        {
            lblServerMsg.Text = "Recever Does not have Account with Us.<br/>OR chek Receiver's Address";
        }

    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/Login.aspx");
    }
}