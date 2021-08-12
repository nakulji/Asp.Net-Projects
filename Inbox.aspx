﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mail App</title>
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
           background-color:transparent;
           //color:white;
           width:107px;
           border:none;
           border-left:1px solid white;
       }
       table{
           margin-bottom:3px;
       }
       #btnLogOut{
           margin-top:5px;
       }
       #panel{
           /*position:absolute;
           top:0;
           margin-top:0;
           background-color:rgba(0, 0, 0, 0.54);
           width:100%;*/
       }
       #Panel1,#Panel2{
           position:absolute;
           top:0;
           width:100%;
           /*width:80%;
           margin:0;
           margin-right:100px;*/
       }
       #txtPnMsg{
           width:80%;
           height:200px;
           margin:auto;
           background-color:#0a77ee;
           color:white;
       }
       .btn{
           width:30%;
           margin-right:2%;
       }
       #txtPn2Msg{
           width:60%;
           height:200px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <!--<div class="icon">
            <div><span class="socicon-mail"></span></div>
            <div><h5>Mail<br />Services</h5></div>
        </div> -->
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
                    <h1 class="w3-center">Inbox</h1>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnLoad="Repeater1_Load">
                        <ItemTemplate>
                          <div class="w3-container">
                            <div class="w3-card-2">
                                <table class="w3-card-2 w3-round-large w3-white">
                                    <tr>
                                        <asp:TextBox ID="txtMsgId" runat="server" Text='<%#Eval("Massage_id")%>' Visible="False"></asp:TextBox>
                                        <td><span class="fa fa-user w3-xlarge"></span></td>
                                        <td>
                                            <asp:TextBox ID="txtfrom" runat="server" Text='<%#Eval("Sender_name") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td><span class="fa fa-address-card-o w3-large"></span></td>
                                        <td>
                                            <asp:TextBox ID="txtto" runat="server" Text='<%#Eval("Compose_from") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td><span class="fa fa-address-card-o w3-large"></span></td>
                                        <td>
                                            <asp:TextBox ID="txtsub" runat="server" Text='<%#Eval("Subject") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td><span class="fa fa-envelope-o w3-large"></span></td>
                                        <td>
                                            <asp:TextBox ID="txtmsg" runat="server" Text='<%#Eval("Massage") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td><span class="fa fa-calendar w3-large"></span></td>
                                        <td>
                                            <asp:TextBox ID="txt_Date" runat="server" Text='<%#Eval("_Date") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                         <td><span class="fa fa-clock-o w3-large"></span></td>
                                        <td>
                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("_Time") %>' CssClass="txt" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnRead" runat="server" CssClass="w3-button w3-blue w3-round-medium" CommandName="read"><span class="fa fa-newspaper-o"></span>&nbsp;</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnreply" runat="server" CssClass="w3-button w3-green w3-round-medium" CommandName="reply"><span class="fa fa-reply"></span>&nbsp;</asp:LinkButton>
                                        </td>

                                        <td>
                                            <asp:LinkButton ID="btndelete" runat="server" CssClass="w3-button w3-red w3-round-medium" CommandName="dlt"><span class="fa fa-trash"></span>&nbsp;</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                           </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br /><br />
                </div>
            </div>
        </div>

        <div class="w3-container">
            <div class="w3-card w3-red w3-center">
                <h3>Powered by</h3>
                <ul>
                    <li>Mukesh</li>
                    <li>Nakul</li>                    
                </ul>
            </div>
        </div>

        
            <asp:Panel ID="Panel1" runat="server" CssClass="w3-container w3-border w3-blue w3-center w3-animate-zoom" Visible="False">
                <div>
                <h2 class="w3-center">Massage</h2>
                <hr />
                <span class="fa fa-calendar w3-xlarge"></span>
                <asp:Label ID="lblPnDate" runat="server" Text="Label" ForeColor="#FFFF66"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="fa fa-clock-o w3-xlarge"></span>
                    <asp:Label ID="lblPnTime" runat="server" Text="Label" ForeColor="#FFFF66"></asp:Label>
                    <hr />
                <h3>From</h3><asp:Label ID="lblPnFrom" runat="server" Text="Label" ForeColor="#FFFF66"></asp:Label>
                <br />
                <h3>To You</h3>
                <br />
                <h3>Subject</h3><asp:Label ID="lblPnSubject" runat="server" Text="Label" ForeColor="#FFFF66"></asp:Label>
                <br />
                <h3>Massage</h3>
                <asp:TextBox ID="txtPnMsg" runat="server" TextMode="MultiLine" ReadOnly="True" ForeColor="#FFFF66"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btnPnReply" runat="server" Text="Reply" CssClass="w3-button w3-green  btn"/><asp:Button ID="btnPnClose" runat="server" Text="Close" CssClass="w3-button w3-orange btn" OnClick="btnPnClose_Click"/>  
                <br /><br />
                </div>
            </asp:Panel>
        
            <asp:Panel ID="Panel2" runat="server" CssClass="w3-container w3-border w3-blue w3-center w3-animate-zoom" Visible="false">
                <div>
                <h2 class="w3-center">Reply</h2>
                <hr />
                    <asp:Label ID="lblPn2msg" runat="server" Visible="False" ForeColor="Lime" Font-Size="Larger"></asp:Label>
                <h3>To</h3>
                    <asp:Label ID="lblPn2to" runat="server" Text="Label"></asp:Label>
                <br />
                <h3>Subject</h3>
                    <asp:Label ID="lblPn2sub" runat="server" Text="Label"></asp:Label>
                <br />
                <h3>Massage</h3>
                <asp:TextBox ID="txtPn2Msg" runat="server" TextMode="MultiLine" ReadOnly="false" ForeColor="#666666"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btnPn2Send" runat="server" Text="Send" CssClass="w3-button w3-green  btn" OnClick="btnPn2Send_Click"/><asp:Button ID="btnPn2close" runat="server" Text="Close" CssClass="w3-button w3-orange btn" OnClick="btnPnClose_Click"/>  
                <br /><br />
                </div>
            </asp:Panel>

    </div>
    </form>
</body>
</html>
