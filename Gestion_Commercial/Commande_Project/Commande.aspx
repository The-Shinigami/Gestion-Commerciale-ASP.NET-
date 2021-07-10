<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Commande.aspx.cs" Inherits="Commande_Project.Commande1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: black;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: x-large;
            position:relative;
            right:130px;
            margin-top:150px;
        }
        
        .auto-style2 {
            width: 100%;
            font-weight: bold;
            font-size: large;
        }
        .auto-style5 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: large;
            color: black;
            font-weight: bold;
        }
        .auto-style8 {
            color: #000000;
            font-size: large;
            display:block;
            float:left;
        }
        .margin_width{
         margin-left:35px;
        }
        .font_chercher{
            font-size:20px;
            color:black;
            display:block;
            margin:auto;
        }
        .auto-style16 {
            border-radius: 12px;
             display:block;
            margin:auto;
            cursor:pointer;

        }
         .auto-style17 {
            height: 27px;
            width:500px;

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
        .auto-style29 {
            width: 190px;
        }
        .auto-style30 {
            width: 678px;
        }
        .auto-style31 {
            margin-left: 259px;
        margin-right: 0px;
    }
        .auto-style32 {
            width: 190px;
            height: 46px;
        }
        .auto-style33 {
            width: 678px;
            height: 46px;
        }
        .auto-style34 {
            height: 46px;
        }
        .auto-style35 {
            width: 190px;
            height: 50px;
        }
        .auto-style36 {
            width: 678px;
            height: 50px;
        }
        .auto-style37 {
            height: 50px;
        }
        .auto-style38 {
            width: 190px;
            height: 48px;
        }
        .auto-style39 {
            width: 678px;
            height: 48px;
        }
        .auto-style40 {
            height: 48px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server" style="margin-top:50px;">
        <div class="auto-style1">
            <strong>Saisie d&#39;Article<br />
            </strong>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style29">

                </td>
                <td style="background-color:#E9967A;" class="auto-style30">
                    <div> <asp:Label ID="errLib" runat="server" style="color:black; font-size:20px; ">
                    </asp:Label></div>
                    <div><asp:Label ID="errDate" runat="server" style="color:black; font-size:20px; ">
                    </asp:Label></div>
                   
                    
                </td>
                
            </tr>
            <tr>
               <td class="auto-style38">
               </td>
                <td class="auto-style39" >
                    <span class="auto-style8">Numero de commande: </span>&nbsp;<asp:TextBox CssClass="auto-style22"  width="150px" ID="txtLibelle" runat="server"  ></asp:TextBox>
                </td>
               
                  <td class="auto-style40">
                                 <asp:Button  runat="server" CssClass="auto-style16" OnClick="btnLister_Click" Text="Lister Commandes"  BackColor="#DBC1AD"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                    
                    </td>
                
            </tr>
          
            <tr>
                <td class="auto-style32">
               </td>
                <td class="auto-style33"><span class="auto-style8">Date :</span>
                           <asp:TextBox ID="txtDate" runat="server"  CssClass="auto-style22"  width="150px" OnTextChanged="txtDate_TextChanged" ></asp:TextBox>
                </td>
                <td class="auto-style34">
                                 <asp:Button ID="btnAjouter" runat="server" BackColor="#DBC1AD" CssClass="auto-style16" OnClick="btnAjouter_Click" Text="Ajouter"  Width="200px" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                    
                    </td>
            
            </tr>
            <tr>
                <td class="auto-style35">
               </td>
                <td class="auto-style36"><span class="auto-style8">Client Nom :</span>
                     
                       <asp:DropDownList ID="DropDownList" runat="server" CssClass="auto-style22" Height="33px" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style37">
                 <asp:Button ID="btnCherche" runat="server" Text="Chercher" Width="200px" CssClass="auto-style16"  OnClick="btnCherche_Click" BackColor="#DBC1AD" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                </td >
                
            </tr>
           
                <tr>
          <td class="auto-style32"></td>
                <td class="auto-style33" >  
                  <span class="auto-style8">Quantite :</span>
                  <asp:TextBox ID="quantite" runat="server"  CssClass="auto-style22"  width="150px" OnTextChanged="txtDate_TextChanged" ></asp:TextBox>  
               </td>
                <td class="auto-style34">
                    <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Editer" Width="200px" BackColor="#DBC1AD"  CssClass="auto-style16" Font-Bold="True" Font-Size="Large" ForeColor="#433E49" />
                </td>
                </tr>
            <tr>
          <td class="auto-style32"></td>
                <td class="auto-style33">  
                  <span class="auto-style8">Article :</span>
                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style22" Height="33px" Width="150px"> 
                     </asp:DropDownList>
               </td>
                
                </tr>
            <tr>
                <td class="auto-style29">

                </td>
                <td style="border:2px solid black; " runat="server" id="table_chercher" visible="false" class="auto-style30">

                    <table style="width:400px;">

                    <tr >
               <td> </td>

<td class="auto-style17" >
                      <asp:label id="commande_chercher" runat="server"  cssclass="font_chercher" visible="false">  </asp:label>
                </td>
               </tr>
            <tr class="auto-style17">
                <td> </td>
           <td>
                   <asp:label id="date" runat="server" cssclass="font_chercher" visible="false">  </asp:label>
                  </td>
            </tr>
            <tr class="auto-style17">
                <td> </td>
<td>
                     <asp:label id="clientId" runat="server"  cssclass="font_chercher" visible="false"> clientid : </asp:label>

                </td>
            </tr>
                </table>
                </td>   
            </tr>
                
           
                  
                
           
             

        </table>
     
         
        
            <div id="show_list" runat="server" Visible="false">
                <p class="auto-style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Liste des Commandes</p>
                <p class="auto-style5">
            <asp:GridView ID="grd" runat="server" CellPadding="4" Width="633px" BackColor="White" BorderColor="#433E49" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="grd_SelectedIndexChanged"  OnRowDeleting="grd_RowDeleting" CssClass="auto-style31"  >
                
                <FooterStyle BackColor="#F3E8EB" ForeColor="#433E49" />
                <HeaderStyle BackColor="#F3E8EB" Font-Bold="True" ForeColor="#433E49" />
                <PagerStyle BackColor="#433E49" ForeColor="#433E49" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#433E49" />
                <SelectedRowStyle BackColor="#433E49" Font-Bold="True" ForeColor="#433E49" />
                <SortedAscendingCellStyle BackColor="#433E49" />
                <SortedAscendingHeaderStyle BackColor="#433E49" />
                <SortedDescendingCellStyle BackColor="#433E49" />
                <SortedDescendingHeaderStyle BackColor="#433E49" />
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
