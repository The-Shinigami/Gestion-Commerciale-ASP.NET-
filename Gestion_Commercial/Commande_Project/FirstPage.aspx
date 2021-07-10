<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Commande_Project.FirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            width: 432px;
            height: 90px;
        }
        .auto-style5 {
            height: 72px;
        }
        .auto-style6{
            border-radius: 12px;
             box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
             cursor:pointer;
        }
        .auto-style6:hover {
  background-color: black; 
  color: white;
}
        .footer-basic {
  padding:40px 0;
  background-color:#ffffff;
  color:#4b4c4d;
}

.footer-basic ul {
  padding:0;
  list-style:none;
  text-align:center;
  font-size:18px;
  line-height:1.6;
  margin-bottom:0;
}

.footer-basic li {
  padding:0 10px;
}

.footer-basic ul a {
  color:inherit;
  text-decoration:none;
  opacity:0.8;
}

.footer-basic ul a:hover {
  opacity:1;
}

.footer-basic .social {
  text-align:center;
  padding-bottom:25px;
}

.footer-basic .social > a {
  font-size:24px;
  width:40px;
  height:40px;
  line-height:40px;
  display:inline-block;
  text-align:center;
  border-radius:50%;
  border:1px solid #ccc;
  margin:0 8px;
  color:inherit;
  opacity:0.75;
}

.footer-basic .social > a:hover {
  opacity:0.9;
}

.footer-basic .copyright {
  margin-top:0px;
  text-align:center;
  font-size:13px;
  color:#aaa;
  margin-bottom:0;
}
        .auto-style7 {
            width: 100%;
            height: 264px;
        }
        .auto-style8 {
            width: 245px;
            height: 90px;
        }
        .auto-style9 {
            width: 109px;
            height: 90px;
        }
        .auto-style10 {
            height: 90px;
        }
        .auto-style11 {
            width: 245px;
            height: 40px;
        }
        .auto-style12 {
            width: 109px;
            height: 40px;
        }
        .auto-style13 {
            height: 40px;
        }
        .auto-style14 {
            width: 245px;
            height: 35px;
        }
        .auto-style15 {
            width: 109px;
            height: 35px;
        }
        .auto-style16 {
            height: 35px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
      
        <div class="auto-style1" style=" box-shadow: 0 20px 30px 0 rgba(0,0,0,0.3), 0 10px 30px 0 rgba(0,0,0,0.19);background-color:#DBB895; text-align: center; font-weight: 700; color: #4F2700;height:50px;width:101vw; position:relative;top:-10px;left:-8px;">
           <span style="position:relative;top:60px;" class="auto-style5">Bienvenue Dans Votre Magasin</span> </div>
        <div style="height: 335px">

              <div style="box-shadow:0px -20px 20px 0 rgba(0,0,0,0.2), 0px 5px 5px 0px rgba(0,0,0,0.19);height:50px;background-color:#DBB895;position:relative;top:60px;left:-8px;width:101vw;margin-bottom:100px;">

        </div>
            <table class="auto-style7">
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" CssClass="auto-style6" runat="server" BackColor="#DBB895" Font-Bold="True" Font-Size="Large" ForeColor="black" Height="75px" OnClick="Button1_Click" style="margin-left: 60px" Text="Espace Client" Width="225px" />
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">
                        <asp:Button ID="Button2" CssClass="auto-style6" runat="server" BackColor="#DBB895" Font-Bold="True" Font-Size="Large" ForeColor="black" Height="69px" OnClick="Button2_Click" Text="Espace Admin" Width="222px" style="text-align: center" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                    <td class="auto-style13"></td>
                </tr>
            </table>
        </div>
    </form>
     <div class="footer-basic" style="padding:0px;margin-top:100px;">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2018</p>
        </footer>
         </div>
</body>
</html>
