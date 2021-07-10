<%@ Page Title="" Language="C#" MasterPageFile="~/MasterClient.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Commande_Project.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 480px;
            height: 49px;
        }
        .auto-style6 {
            height: 347px;
        }
        .auto-style7 {
            height: 49px;
            width: 116px;
        }
        .auto-style8 {
            width: 480px;
            height: 19px;
        }
        .auto-style9 {
            margin-left: 404px;
            margin-top: 0px;
        }
        .auto-style16 {
            border-radius: 12px;
             display:block;
             float:right;
            margin:auto;
            cursor:pointer;

        }
        .auto-style22{
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
        .auto-style23 {
            height: 49px;
            width: 214px;
        }
        .auto-style24 {
            height: 49px;
            width: 268px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <form id="form2" runat="server">
       <table class="auto-style6">
          <tr>
              <td class="auto-style8">

              </td>
          </tr> 
           <tr>
               <td class="auto-style4">
                   
               </td>
               <td class="auto-style7">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#996633" Text="Catégorie :"></asp:Label> </td>
               <td class="auto-style23">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource2" DataTextField="categorie1" DataValueField="categorie1" CssClass="auto-style22" Height="33px" Width="150px">
            </asp:DropDownList>
<asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="Commande_Project.DCDataContext" EntityTypeName="" Select="new (categorie1)" TableName="Categorie">
            </asp:LinqDataSource>
               </td>
               <td class="auto-style24">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button1" runat="server"   OnClick="Button1_Click" Text="Chercher"  CssClass="auto-style16" BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />

               </td>
           </tr>
       </table>
       
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" BorderColor="black" ForeColor="#333333" GridLines="None" Width="579px" CssClass="auto-style9">
            
            <FooterStyle BackColor="#DBC1AD" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#DBC1AD" Font-Bold="True" ForeColor="black" />
            <PagerStyle BackColor="white" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="white" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    </form>
    <br />
   
</asp:Content>



