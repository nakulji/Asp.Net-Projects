<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MailApp | Signup</title>
    <link rel="stylesheet" href="w3.css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css" />
   
    <style>
       @font-face {
           font-family : Bitter;
           src: url(Bitter-Regular.ttf) format('truetype');
       }
       body{
           font-family:Bitter;
       }
       h1,h2,h3,h4,h5,h6,p{
           font-family:Bitter;
       }
       li{
           display:inline;
         //  float:left;
           margin-right:10px;
       }
       ul{
           list-style-type:circle !important;
       }
       #txtEmail,#txtpassword,{
          width:330px;
          border:none;
          border-bottom: 2px solid red;
          box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.31);
          
       }
       .txt{
           width:60%;
           border:none;
          border-bottom: 2px solid red;
          box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.31);
          font-size:5px;
          //float:right;
       }
       table{
          // margin:auto;
         //  border:2px solid red;
           //border-radius:20px;
       }
       #btnlogin{
           width:70%;
           display:inline;
           margin-bottom:10px;
          margin-left:15%;
       }
       #btnSignup{
           //margin-left:3px;
       }
       .lbl{
           font-weight:bolder;
           font-size:130%;
           float:left;
           margin-left:20px;
       }
       #btnsave{
           width:70%;
           margin:auto;
           margin-bottom:10px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="w3-container">
           <div class="w3-bar w3-card-4 w3-red w3-center w3-round-large "  style="padding-top:10px;">
               <div style="padding:0 -1px 0 -1px; border:2px solid white; width:100px; margin:auto; border-radius:10px 0 10px 0;"><span class="fa fa-envelope" style="font-size:450%; margin:0 !important; padding:0 !important;"></span></div>
               <h3>Mail Services</h3>
           </div>
         </div>
        
        <div class="w3-container">
            <div class="w3-card-4 w3-animate-right" style="width:43%; margin:auto;" id="divSignup">
                <h3 class="w3-center w3-red" style="">SignUp</h3>
                <table>
                    <tr>
                        <td><label  class="lbl">Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtname" runat="server" CssClass="txt w3-xlarge" Required placeholder="Ex:John Smith"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                
                <table>
                    <tr>
                        <td><label  class="lbl">User Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtUserName" runat="server" CssClass="txt w3-xlarge" OnTextChanged="txtUserName_TextChanged" Required placeholder="Ex:JohnSmith@mail.com"></asp:TextBox></td>
                            <td><label class="lbl" style="margin:0;">@Mail.com</label></td>
                    </tr>
                </table>
                <br />

                <table>
                    <tr>
                        <td><label  class="lbl">Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="txt w3-xlarge" TextMode="Password" Required placeholder="Your Secret Password"></asp:TextBox></td>
                    </tr>
                </table>
                <br />

                <table>
                    <tr>
                        <td><label  class="lbl">Re-Password</label>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRePassword" runat="server" CssClass="txt w3-xlarge" TextMode="Password" Required placeholder="Same As Above"></asp:TextBox></td>
                    </tr>
                </table>
                <br />

                <table>
                    <tr>
                        <td><label  class="lbl">Phone</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPhone" runat="server" CssClass="txt w3-xlarge" Required placeholder="Your Phone/Mobile No."></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                
                <asp:Button ID="btnsave" runat="server" Text="Register" CssClass="w3-button w3-block w3-green" OnClick="btnsave_Click" />
                <center><asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></center>
                <center><small class=" w3-text-blue">Alredy have an Account! Login Here.<span class="fa fa-hand-o-down"></span></small></center>
                <a id="Login" class="w3-button w3-block w3-blue" href="Login.aspx">Login</a>
                      
            </div>
        </div>

        <div class="w3-container">
            <div class="w3-card w3-red w3-center w3-round-large" >
                <h3>Powered by</h3>
                <ul>
                    <li>Mukesh</li>
                    <li>Nakul</li>
                    
                </ul>
            </div>
        </div>

    </div>
    </form>
</body>
</html>
