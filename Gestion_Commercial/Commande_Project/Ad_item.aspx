<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ad_item.aspx.cs" Inherits="Commande_Project.Ad_item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #0033CC;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: x-large;
        }
        .auto-style5 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: large;
            color: #800000;
            font-weight: bold;
        }
        .auto-style8 {
            color: #000000;
            font-size: large;
        }
    .auto-style9 {
        margin-left: 251px;
        margin-right: 189px;
            margin-top: 0px;
        }
    .auto-style10{
         display:block;
            float:right;
           width:100px;
           width: 100%;
  padding: 5px 20px;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
    }
         input[type=text] {
  width: 100%;
  padding: 5px 20px;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 3px solid #555;
}
        .auto-style25 {
            width: 100%;
            font-weight: bold;
            font-size: xx-large;
            font-family: "High Tower Text";
            color: #FFFFFF;
            height: 267px;
            margin-bottom: 0px;
        }
        .auto-style30 {
            width: 678px;
            height:0px;
        }
        .auto-style63 {
            font-weight: bold;
            font-size: large;
            color: #000080;
            height: 42px;
        }
        .auto-style78 {
            width: 614px;
            height: 30px;
        }
        .auto-style79{
             border-radius: 12px;
             display:block;
            margin:auto;
            cursor:pointer;
        }
        .auto-style81 {
            width: 228px;
            height: 30px;
        }
        .auto-style82 {
            height: 30px;
        }
        .auto-style90 {
            width: 228px;
            height: 42px;
        }
        .auto-style91 {
            height: 42px;
        }
        .auto-style92 {
            width: 228px;
            height: 10px;
        }
        .auto-style93 {
            width: 614px;
            height: 10px;
        }
        .auto-style94 {
            height: 10px;
        }
        .auto-style95 {
            width: 228px;
            height: 46px;
        }
        .auto-style96 {
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Saisie d&#39;Article<br />
            </strong>
        </div>
        <table class="auto-style25" style="margin-top:150px;">
            <tr>
                <td></td>
              <td style="background-color:#E9967A;" class="auto-style30">
                    <div> <asp:Label ID="errCategorie" runat="server" style="color:black; font-size:20px;"></asp:Label></div>     
                    <div><asp:Label ID="errLib" runat="server" style="color:black; font-size:20px;"></asp:Label></div>
                    <div> <asp:Label ID="errPu" runat="server" style="color:black; font-size:20px;" ></asp:Label></div>
                </td>
            </tr> 
            <tr>
                <td class="auto-style90"></td>
                <td class="auto-style91">
                    <span class="auto-style8" style="float:left;">Nom de produit : </span>
                    <asp:TextBox cssclass="auto-style10" width="150px" ID="txtLibelle" runat="server"></asp:TextBox>
                   
                </td>
                <td class="auto-style63">
                    <asp:Button ID="Button3" runat="server"   OnClick="btnLister_Click" Text="Lister Produits" CssClass="auto-style79" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                    
</td>
            </tr>
            <tr>
                <td class="auto-style95"></td>
                <td style="padding:0px;" class="auto-style96" >
                    <span class="auto-style8" style="float:left;">Prix Unitaire : </span>
                    <asp:TextBox ID="txtPU" cssclass="auto-style10" width="150px" runat="server"></asp:TextBox>
                  </td>
                <td style="padding:0px;" class="auto-style96">
                 <asp:Button ID="btnAjouter" runat="server" OnClick="btnAjouter_Click" Text="Ajouter" CssClass="auto-style79" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style92">rieId</td>
                <td class="auto-style93">
                    <span class="auto-style8" style="float:left;">Catégorie: </span>
                     <asp:DropDownList ID="DropDownList" runat="server" CssClass="auto-style10" Height="33px" Width="150px">
                    </asp:DropDownList>
                   </td>
                    <td class="auto-style94">
                         <asp:Button ID="btnCherche" runat="server" Text="Chercher"  OnClick="btnCherche_Click" CssClass="auto-style79"  BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                
                    </td>
            </tr>
            <tr>
                <td class="auto-style81"></td>
                <td class="auto-style78">

<asp:Image ID="Image1" runat="server" /> 
                    </td>
                <td class="auto-style82">
                     <asp:Button ID="Button1" runat="server" Height="34px" OnClick="Button1_Click" Text="Editer" CssClass="auto-style79" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                
                </td>
            </tr>
            
        </table>
         <div runat="server" id="show_list" visible="false">
        <p class="auto-style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Liste des Produits</p>
        <p class="auto-style5">
            <asp:GridView ID="grd" runat="server" CellPadding="4" Width="732px" BackColor="White" BorderColor="#433E49" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="grd_SelectedIndexChanged"  OnRowDeleting="grd_RowDeleting" CssClass="auto-style9"  >
                
                <FooterStyle BackColor="#F3E8EB" ForeColor="#003399" />
                <HeaderStyle BackColor="#F3E8EB" Font-Bold="True" ForeColor="#433E49" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Supprimer"  >
                    
                    <ControlStyle BackColor="#433E49" Font-Bold="True" Font-Size="Large" ForeColor="#F3E8EB" />
                    </asp:ButtonField>
                    
                </Columns>
            </asp:GridView>
        </p>
             </div>
    </form>
</asp:Content>
