<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Categorie.aspx.cs" Inherits="Commande_Project.Categorie1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #0033CC;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
            font-weight: bold;
            font-size: large;
        }
        .auto-style4 {
            font-weight: bold;
            font-size: large;
            color: #000080;
            height: 45px;
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
        .auto-style10 {
            margin-left: 268px;
        margin-right: 0px;
    }
        .auto-style16 {
            border-radius: 12px;
             display:block;
            margin:auto;
            cursor:pointer;

        }
        .auto-style17 {
            width: 219px;
            height: 45px;
        }
        .auto-style18 {
            width: 636px;
            height: 45px;
        }
        .auto-style19 {
            width: 219px;
        }
        .auto-style20 {
            width: 636px;
        }
        .auto-style21 {
            width: 219px;
            height: 50px;
        }
        .auto-style22 {
            width: 636px;
            height: 50px;
        }
        .auto-style23 {
            height: 50px;
        }
        .auto-style24 {
            width: 219px;
            height: 46px;
        }
        .auto-style25 {
            width: 636px;
            height: 46px;
        }
        .auto-style26 {
            height: 46px;
        }
        .auto-style27 {
            width: 219px;
            height: 48px;
        }
        .auto-style28 {
            width: 636px;
            height: 48px;
        }
        .auto-style29 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Saisie d&#39;Article<br />
            </strong>
        </div>
        <table class="auto-style2" style="margin-top:150px;">
           
            <tr>
                <td class="auto-style19">

                </td>
                <td style="background-color:#E9967A;" class="auto-style20">
                     <asp:Label ID="errLib" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="20px" style="color:black;" Visible="False"></asp:Label>           
                </td>
                
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18">
                    <span class="auto-style8" style="float:left;">Categorie : </span>
                    <asp:TextBox ID="txtLibelle" runat="server" style="float:right;" Width="200px"></asp:TextBox>
                    </td>
                <td class="auto-style4">
                    <asp:Button  runat="server" BackColor="#DBC1AD" CssClass="auto-style16" OnClick="btnLister_Click" Text="Lister Categories" Font-Bold="True"  Width="200px" Font-Size="Large" ForeColor="#433E49" />
                </td>
                
            </tr>
           
           
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22"><strong>
                    
                    </strong></td>
                <td class="auto-style23"><asp:Button ID="btnAjouter" runat="server" BackColor="#DBC1AD" CssClass="auto-style16" OnClick="btnAjouter_Click" Text="Ajouter"  Font-Bold="True"  Width="200px" Font-Size="Large" ForeColor="#433E49" /></td>
            </tr>
            <tr>
                 <td class="auto-style24"> </td>
                 <td class="auto-style25"></td>
                 <td class="auto-style26"><asp:Button ID="btnCherche" runat="server" Text="Chercher"  Width="200px"  OnClick="btnCherche_Click" CssClass="auto-style16"  BackColor="#DBC1AD" Font-Bold="True" Font-Size="Large" ForeColor="#433E49"/></td>

            </tr>
            <tr>
                 <td class="auto-style27"> </td>
                 <td class="auto-style28"></td>
                 <td class="auto-style29"> <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" CssClass="auto-style16" Text="Editer"  Width="200px" BackColor="#DBC1AD" Font-Bold="True"  Font-Size="Large" ForeColor="#433E49" />
              </td>

            </tr>
        </table>
         <div id="show_list" runat="server" visible="false">
             <p class="auto-style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Liste des Catégories</p>
        <p class="auto-style5">
            <asp:GridView ID="grd" runat="server" CellPadding="4" Width="593px" BackColor="White" BorderColor="#433E49" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="grd_SelectedIndexChanged"  OnRowDeleting="grd_RowDeleting" CssClass="auto-style10"  >
                
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