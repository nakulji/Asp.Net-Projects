<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Compose.aspx.cs" Inherits="Compose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MailApp | Compose</title>
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
      .txt{
        //  background-color:red;
          margin-left:20px;
          width:80%;
          height:40px;
          margin-bottom:5px;
          border:none;
      }
      .lbl{
          margin-left:5%;
         // background-color:orangered;
          padding:10px;
          border-radius:10px;
      }
      #txtmsg{
          height:150px;
      }
      .btn{
          width:39%;
          height:40px;
          border:none;
        //  border-radius:10px;
         // margin-left:17%;
      //   background: -webkit-linear-gradient(90deg,rgb(45, 121, 186),rgb(29, 75, 157));
       //  background-color:-webkit-linear-gradient(90deg,rgb(56, 157, 216),rgb(42, 91, 208));
       //  color:white;
         font-size:110%;
      }
      #btnsend{
          margin-left:16%;
      }
      #btnclear{
          margin-left:5px;
      }
      #lblFrom{
          padding:10px 20px 10px 20px;
      }
      #lblto{
          padding:10px 30px 10px 30px;
      }
      #lblsubject{
          padding:10px 12px 10px 12px;
      }
      #lblmsg{
          position:absolute;
          top:57.3%;
          left:28.7%;
      }
      #Button1{
          background-color:transparent;
          border:none;
          color:white;
      }
      #btnLogOut{
          margin-top:5px;
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

        <div class="w3-container w3-margin-top">
            <div class="w3-row">
                <div class="w3-col l3">
                    <div class="w3-bar-block w3-margin-right">
                        <a href="Compose.aspx" class="w3-bar-item w3-btn w3-block w3-red w3-round-large w3-center" style="margin-bottom:4px;"><span class="fa fa-edit"></span>&nbsp;Compose Mail</a>
                        <a href="Inbox.aspx" class="w3-bar-item w3-btn w3-block w3-red w3-round-large w3-center" style="margin-bottom:4px;"><span class="fa fa-inbox"></span>&nbsp;Inbox</a>
                        <a href="Sent.aspx" class="w3-bar-item w3-btn w3-block w3-red w3-round-large w3-center"><span class="fa fa-send"></span> Sent Mails</a>
                        <asp:LinkButton ID="btnLogOut" runat="server" CssClass="w3-bar-item w3-btn w3-block w3-red w3-round-large w3-center" OnClick="btnLogOut_Click"><span class="fa fa-sign-out"> Log-Out</span></asp:LinkButton>
                    </div>
                </div>
                <div class="w3-col l9 w3-green w3-round-large">
                    <h1 class="w3-center">Compose Mail   <span class="fa fa-edit"></span></h1>
                    
                    <div class="w3-container w3-card-4 w3-round-large w3-whit" style="width:90%; margin-left:5%;">
                        <br />
                        <asp:Label ID="lblFrom" runat="server" Text="From" AssociatedControlID="txtfrom" CssClass="lbl w3-red"></asp:Label><asp:TextBox CssClass="txt w3-round-large" ID="txtfrom" runat="server" ReadOnly="True"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblto" runat="server" Text="To" AssociatedControlID="txtto" CssClass="lbl w3-red"></asp:Label><asp:TextBox ID="txtto" runat="server" CssClass="txt w3-round-large" ></asp:TextBox>
                        <br />
                         <asp:Label ID="lblsubject" runat="server" Text="Subject" AssociatedControlID="txtsubject" CssClass="lbl w3-red"></asp:Label> <asp:TextBox CssClass="txt w3-round-large" ID="txtsubject" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblmsg" runat="server" Text="Message" CssClass="lbl w3-red"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="txt w3-round-large" ID="txtmsg" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <center><asp:Label ID="lblServerMsg" runat="server" ForeColor="#99FF66"></asp:Label></center>
                        <br />
                        <asp:LinkButton ID="btnsend" runat="server" CssClass="btn w3-centered w3-blue-gray w3-round-large w3-button" OnClick="btnsend_Click1"><span class="fa fa-paper-plane"></span>&nbsp;Send</asp:LinkButton>
                        <asp:LinkButton ID="btnclear" runat="server" CssClass="btn w3-button w3-blue-grey w3-round-large">Clear&nbsp;<span class="fa fa-trash"></span></asp:LinkButton>
                        <br />
                        <br />
                        <asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
                    </div>
                    <br /><br />
                </div>
            </div>
        </div>

        <div class="w3-container">
            <div class="w3-card w3-red w3-center w3-round-large">
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
