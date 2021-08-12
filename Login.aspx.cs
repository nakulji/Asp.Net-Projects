using System;
using System.Data;
using System.Data.SqlClient;

public partial class LoginSignup : System.Web.UI.Page
{
    String conn = "Data Source=DESKTOP-A3A13JE\\MSSQLSERVER01; Initial Catalog=MailDB; Integrated Security=true";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlDataAdapter adpt = new SqlDataAdapter("select * from Account", conn);
        DataSet ds = new DataSet();
        adpt.Fill(ds);


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["User_Name"].ToString() == txtEmail.Text.ToLower() && ds.Tables[0].Rows[i]["Password"].ToString() == txtpassword.Text)
            {
                Session["UserName"] = txtEmail.Text;
                Response.Redirect("~/Inbox.aspx");
                break;
            }
            else
            {
                lblMsg.Text = "*Wrong Username Or PassWord";
            }


        }
    }
}