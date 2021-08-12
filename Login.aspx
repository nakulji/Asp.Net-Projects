<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LoginSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MailApp | Login/Signup</title>
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
          font-size:10px;
       }
       .txt{
           width:65%;
           border:none;
          border-bottom: 2px solid red;
          box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.31);
          font-size:10px;
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
            <div class="w3-card-4 w3-animate-left w3-round-large" style="width:35%; margin:auto;" id="divLogin">
                <h2 class="w3-center w3-red">Login</h2>
                <br />
                <br />
                <table style="margin:auto;">
                    <tr style="border:2px solid red;">
                        <td><span class="fa fa-user w3-xxxlarge"></span></td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="w3-xlarge" placeholder="UserName"></asp:TextBox>

                        </td>
                    </tr>
                </table>
                <br />
                <table style="margin:auto;">
                    <tr style="border:2px solid red;">
                        <td><span class="fa fa-lock w3-xxxlarge"></span></td>
                        <td>
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="w3-xlarge" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

                        </td>
                    </tr>
                </table>
                <br />
               

                       <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="w w3-button  w3-block w3-green" OnClick="btnlogin_Click" />
                <br />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <br />
                         <center><small class=" w3-text-blue">Do not have any Account yet! Get it here.<span class="fa fa-hand-o-down"></span></small></center>
                      <a id="btnSignup" class="w3-button w3-block w3-blue" href="SignUp.aspx">SignUp</a>
                      
                     
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
