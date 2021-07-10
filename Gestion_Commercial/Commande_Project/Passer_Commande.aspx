<%@ Page Title="" Language="C#" MasterPageFile="~/MasterClient.Master" AutoEventWireup="true" CodeBehind="Passer_Commande.aspx.cs" Inherits="Commande_Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
        .auto-style3 {
            width: 336px;
            height: 50px;
        }
        .auto-style4 {
            font-weight: bold;
            font-size: large;
            color: #000080;
        }
        .auto-style5 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: large;
            color: #800000;
            font-weight: bold;
        }
        .auto-style10 {
            height: 44px;
            width: 336px;
        }
        .auto-style11 {
            width: 649px;
        }
         .auto-style12 {
            color: #000000;
            font-size: large;
            display:block;
            float:left;
        }
         .auto-style13{
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
         .auto-style14 {
            border-radius: 12px;
             display:block;
            margin:auto;
            cursor:pointer;

        }
        .auto-style15 {
            margin-left: 252px;
            margin-right: 0px;
        }
        .auto-style17 {
            width: 336px;
        }
        .auto-style18 {
            height: 86px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
             <div class="auto-style1" >
            <strong  style="color:#433E49;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </strong>
        </div>
        <table class="auto-style2">
             <tr>
                 <td class="auto-style18">

                 </td>
                 <td>
                       <strong  style="color:#433E49;font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; welcome to your page <span runat="server" id="client_name"></span> <br />
            </strong>
                 </td>
             </tr>
            <tr>
                <td class="auto-style17"></td>
                <td style="background-color:#E9967A;" class="auto-style30">
                                        <asp:Label ID="errLib" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Larger" style="color: black" ></asp:Label>


                </td>
            </tr>
            <tr>
                 
                <td class="auto-style10" >
            
                    &nbsp;</td>
                 <td class="auto-style11" >
                     &nbsp;</td>
            </tr>
            <tr>

                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style11">
                    <span class="auto-style12">Quantité d'article :</span>
                    <asp:TextBox ID="txtLibelle" runat="server" CssClass="auto-style13"  width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btnAjouter" runat="server"  CssClass="auto-style14" OnClick="btnAjouter_Click" Text="Ajouter" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                </td>
            </tr>
            <tr>
                <td class="auto-style17">  
<%--                    <asp:Button ID="btnCherche" runat="server" Text="Chercher" CssClass="auto-style14"  OnClick="btnCherche_Click" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />--%>

</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style11">
                    <span class="auto-style12">Article :</span>
                    <asp:DropDownList ID="DropDownList" runat="server" CssClass="auto-style13" Height="33px" Width="150px"> 
                        
                     </asp:DropDownList>
                </td>
                <td>                   
</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style11"><strong>
                    </strong></td>
                <td>
                </td>
            </tr>
        </table>
        <p class="auto-style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Liste de vos Commandes</p>
        <p class="auto-style5">
            <asp:GridView ID="grd" runat="server" CellPadding="4" Width="674px" BackColor="White" BorderColor="#433E49" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="grd_SelectedIndexChanged"  OnRowDeleting="grd_RowDeleting" CssClass="auto-style15"  >
                
                <FooterStyle BackColor="#F3E8EB" ForeColor="#433E49" />
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
