using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MainPage : System.Web.UI.Page
{
    String conn = "Data Source=DESKTOP-A3A13JE\\MSSQLSERVER01; Initial Catalog=MailDB; Integrated Security=true";

    string Receiver, Sender;
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
    void disp()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("select * from Massage where Compose_to = '"+Session["UserName"]+ "'", conn);
        DataSet ds = new DataSet();
        adpt.Fill(ds);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }

    string userSession;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            userSession = Session["UserName"].ToString();
            getSenderName();
            disp();
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
        
    }

    static int pos;
   static string _from, _to, _sub;
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Massage", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        TextBox MassageId = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtMsgId");
        TextBox From = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtfrom");
        TextBox to = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtto");
        TextBox sub = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtsub");
        TextBox msg = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtmsg");
        TextBox date = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txt_Date");
        TextBox time = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtTime");

        if (e.CommandName == "dlt")
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["Massage_id"].ToString() == MassageId.Text)
                {
                    pos = i;
                    break;
                }
            }

            SqlCommandBuilder cmb = new SqlCommandBuilder(da);
            ds.Tables[0].Rows[pos].Delete();
            da.Update(ds);
            disp();
        }

        if (e.CommandName == "read")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            lblPnFrom.Text = From.Text+"-"+to.Text;
            lblPnSubject.Text = sub.Text;
            txtPnMsg.Text = msg.Text;
            lblPnDate.Text = date.Text;
            lblPnTime.Text = time.Text;
        }

        if (e.CommandName == "reply")
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            lblPn2to.Text = From.Text + "-" + to.Text;
            lblPn2sub.Text = sub.Text;
            getSenderName();
            
            TextBox From1 = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtfrom");
            TextBox to1 = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtto");
            TextBox sub1 = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtsub");
            _from = From1.Text;
            _to = to1.Text;
            _sub = sub1.Text;
            Response.Write(_from + _to + _sub);
        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/Login.aspx");
    }

    protected void btnPnClose_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
    }

    protected void btnPn2Send_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Massage", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        SqlCommandBuilder cmb = new SqlCommandBuilder(da);
        DataRow dr = ds.Tables[0].NewRow();
        dr["Compose_from"] = Session["UserName"].ToString();
        dr["Compose_to"] = _to;
        dr["Subject"] = _sub;
        dr["Massage"] = txtPn2Msg.Text;
        dr["Sender_name"] = Sender;
        dr["Receiver_name"] =_from;
        dr["_Time"] = DateTime.Now.ToString("HH:mm:tt");
        dr["_Date"] = DateTime.Now.ToString("dd-MMM-yyyy");
        ds.Tables[0].Rows.Add(dr);
        da.Update(ds);
        lblPn2msg.Text = "<span class=\"fa fa-check w3-xxlarge\"></span>  Massage Sent Succesfuly";
    }

    protected void Repeater1_Load(object sender, EventArgs e)
    {
        //TextBox From1 = (TextBox)Repeater1.Items[ItemIndex].FindControl("txtfrom");
        //TextBox to1 = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtto");
        //TextBox sub1 = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtsub");
       // TextBox jkl = (TextBox)Repeater1.FindControl("txtfrom");
        //_from = jkl.Text;
        //_to = to1.Text;
        //_sub = sub1.Text;
    }
}