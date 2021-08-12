using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Sent : System.Web.UI.Page
{

    String conn = "Data Source=DESKTOP-A3A13JE\\MSSQLSERVER01; Initial Catalog=MailDB; Integrated Security=true";

    void disp()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Massage where Compose_from = '"+Session["UserName"]+ "'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            disp();
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    int pos;
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Massage", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        TextBox MassageId = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtMsgId");
        TextBox recName = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtrecname");
        TextBox recId = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtrecid");
        TextBox sub = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtsub");
        TextBox msg = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtmsg");
        TextBox date = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtdate");
        TextBox time = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txttime");

        if (e.CommandName == "dlt")
        {
            for(int i=0; i<ds.Tables[0].Rows.Count; i++)
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
            lblPnDate.Text = date.Text;
            lblPnTime.Text = time.Text;
            lblPnFrom.Text = recName.Text + "-" + recId.Text;
            txtPnMsg.Text = msg.Text;
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
    }
}