using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SignUp : System.Web.UI.Page
{
    String conn = "Data Source=DESKTOP-A3A13JE\\MSSQLSERVER01; Initial Catalog=MailDB; Integrated Security=true";

    int flag;
    public void checkUserName()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Account", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string username = txtUserName.Text;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["User_Name"].ToString().ToLower() == username.ToLower() + "@mail.com")
            {
                flag = 0;
               // btnsave.Enabled = false;
                break;

            }
            else
            {
                flag = 1;
                // savadata();
            }
        }
    }

    int temp;
    protected void varifyusername()
    {
        string username = txtUserName.Text.ToLower();
        if (username.Contains("@mail.com"))
        {
            temp = 1;
        }
        else if (username.Contains("@")) { temp = 1; }
        else if (username.Contains("#")) { temp = 1; }
        else if (username.Contains("%")) { temp = 1; }
        else if (username.Contains("&")) { temp = 1; }
        else if (username.Contains("*")) { temp = 1; }
        else if (username.Contains("(")) { temp = 1; }
        else if (username.Contains(")")) { temp = 1; }
        else if (username.Contains("-")) { temp = 1; }
        else if (username.Contains("+")) { temp = 1; }
        else if (username.Contains("=")) { temp = 1; }
        else if (username.Contains(".com")) { temp = 1; }
        else if (username.Contains("$")) { temp = 1; }
        else { temp = 0; }
    }
    protected void savadata()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Account", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        SqlCommandBuilder cmb = new SqlCommandBuilder(da);
        if (txtPassword.Text == txtRePassword.Text)
        {
            DataRow dt = ds.Tables[0].NewRow();
            dt["Name"] = txtname.Text;
            dt["User_Name"] = txtUserName.Text.ToLower() + "@mail.com";
            dt["Password"] = txtPassword.Text;
            dt["Phone"] = txtPhone.Text;
            ds.Tables[0].Rows.Add(dt);
            da.Update(ds);
            lblMsg.Text = "<span class=\"fa fa-check w3-xxlarge\"></span><br/>Account is Succesfully created";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblMsg.Text = "<span class=\"fa fa-times w3-xxlarge\"></span><br/>*Password Is Not Same! Please Enter Same Password.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

   
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        varifyusername();
        if (temp == 0) { 
            checkUserName();
            if (flag == 1)
          {
           savadata();
          }
          else
          {
             lblMsg.Text = "OPPs! User Name " +txtUserName.Text.ToLower()+" Is Not Available Please Choose Another.";
          }
        }
        else
        {
            lblMsg.Text = "<span class=\"fa fa-times w3-xxlarge\"></span><br/>*You can not insert Symbols and Special character into User Name<br/>Like @!@#$%^&*()-+, \"@mail.com\" ,\".com\" Etc.<br/>You can use Underscore \"_\")";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        
    }
}