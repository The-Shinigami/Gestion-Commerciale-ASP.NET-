using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

public class Commande_
{
    private string numero;
    private string date;
    private string article;
    private int quantite;
    private int client_id;
    private string client_nom;
    public Commande_ (string numero, string date, string article,int quantite,int client_id, string client_nom)
{
    this.numero = numero;
    this.date = date;
    this.article = article;
    this.quantite = quantite;
    this.client_id = client_id;
    this.client_nom = client_nom;
}


public string Numero
{
    get { return numero; }
    set { numero = value; }
}

public string Date
{
    get { return date; }
    set { date = value; }
}
    public string Article 
    {
        get { return article; }
        set { article = value; }
    }
    public int Quantite
    {
        get { return quantite; }
        set { quantite = value; }
    }
    public int ClientId
{
    get { return client_id; }
    set { client_id = value; }
}
    public string ClientNom
    {
        get { return client_nom; }
        set { client_nom = value; }
    }
}

namespace Commande_Project
{
    public partial class Commande1 : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();


        protected void Page_Load(object sender, EventArgs e)
        {
          
             //remplir la list des clients
            var c1 = (from Client in dc.Client
                      select Client.nom+" "+Client.prenom ).ToList();
            if (string.IsNullOrWhiteSpace(DropDownList.Text)) {
                c1.Insert(0,"");
            }
            else
            {
                c1.Insert(0, DropDownList.Text);
            }

            DropDownList.DataSource = c1;
            DropDownList.DataBind();
            //remplir la list des articles
            var c2 = (from Article in dc.Article
                      select Article.nom).ToList();
            if (string.IsNullOrWhiteSpace(DropDownList1.Text))
            {
                c2.Insert(0, "");
            }
            else
            {
                c2.Insert(0, DropDownList1.Text);
            }
            
            DropDownList1.DataSource = c2;
            DropDownList1.DataBind();

            var commands = (from Commande
                         in dc.Commande
                            select Commande).ToList();
            var clients = (from Client
                           in dc.Client
                           select Client).ToList();
            var articls_cmds = (from Article_Cmd
                           in dc.Article_Cmd
                           select Article_Cmd).ToList();
            var articls = (from Article
                           in dc.Article
                                select Article).ToList();


            List<Commande_> commandes = new List<Commande_>();

           
            foreach (var article_cmd in articls_cmds)
            {
                foreach (var article in articls)
                    if (article.Id== article_cmd.articleId)
                    {
                        foreach (var commande in commands)
                        {
                            if (commande.Id == article_cmd.cmdId)
                            {
                                foreach (var client in clients)
                                {
                                    if(client.Id == commande.ClientId)
                                    commandes.Add(new Commande_(commande.num, commande.date,article.nom,(int)article_cmd.quantite, client.Id, client.nom + " " + client.prenom));

                                }
                            }
                        }
                        
                    }

            }
           
            grd.DataSource = commandes;
            grd.DataBind();



        }
        protected void btnLister_Click(object sender, EventArgs e)
        {
            show_list.Visible = !show_list.Visible; }
        protected void btnCherche_Click(object sender, EventArgs e)
        {
            string num = txtLibelle.Text;
            String client = DropDownList.Text;
            bool ok = true;


            if (string.IsNullOrWhiteSpace(num))
            {
                errLib.Text = "Pour chercher inserer le numero de commande s'il vous plait!!";
                errLib.Visible = true;
                ok = false;
                errDate.Visible = false;
            }
            else
            {

                errLib.Visible = false;
                errDate.Visible = false;
            }
            if (ok)
            {
                Commande cmd = (from Commande in dc.Commande
                                where Commande.num == txtLibelle.Text
                                select Commande).Single();
                Article_Cmd acmd = (from Article_Cmd in dc.Article_Cmd
                                    where Article_Cmd.cmdId == cmd.Id
                                    select Article_Cmd).Single();
                Article art = (from Article in dc.Article
                               where Article.Id == acmd.articleId
                               select Article).Single();
                txtDate.Text = cmd.date;
                DropDownList.Text = cmd.Client.nom + " " + cmd.Client.prenom;
                date.Visible = true;
                clientId.Visible = true;
                commande_chercher.Visible = true;
                date.Text = "Date : " + cmd.date;
                clientId.Text = "Client Id : " + cmd.ClientId.ToString();
                quantite.Text = acmd.quantite.ToString();
                DropDownList1.Text =art.nom;
                commande_chercher.Text = "La Commande Chercher";
                table_chercher.Visible = !table_chercher.Visible;
                    }


        }

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            string num = txtLibelle.Text;
            String date = txtDate.Text;
            //String client = txtClient.Text;
            String client = DropDownList.Text;
            int client_id = 0;
            int quentite = int.Parse(quantite.Text);
            string article = DropDownList1.Text;
            bool ok = true;


            

            if (string.IsNullOrWhiteSpace(num))
            {
                errLib.Text = "Inserer le numero de commande s'il vous plait!!";
                errLib.Visible = true;
                ok = false;
            }
            else
            {
                errLib.Visible = false;
            }
            if (string.IsNullOrWhiteSpace(date))
            {
                errDate.Text = "Inserer une date s'il vous plait!!";
                errDate.Visible = true;
                ok = false;
            }
            else
            { errDate.Visible = false;
            }
            if (string.IsNullOrWhiteSpace(client))
            {
                errDate.Text = "Inserer le nom d'un client s'il vous plait!!";
                errDate.Visible = true;
                ok = false;
            }
            else
            {
                errDate.Visible = false;
            }
            if (string.IsNullOrWhiteSpace(quantite.ToString()))
            {
                errDate.Text = "Inserer une quantite  s'il vous plait!!";
                errDate.Visible = true;
                ok = false;
            }
            else
            {
                errDate.Visible = false;
            }
            if (string.IsNullOrWhiteSpace(article))
            {
                errDate.Text = "Inserer un article s'il vous plait!!";
                errDate.Visible = true;
                ok = false;
            }
            else
            {
                errDate.Visible = false;
            }




            try
            {
                
                foreach (var client_ in dc.Client)
                {
                    if ((client_.nom+" "+client_.prenom).Equals(client))
                    {
                        client_id = client_.Id;
                    }
                }

            }
            catch
            {
                ok = false;
            }
            if (ok)
            {
                
                Article arti = (from Article in dc.Article
                                where Article.nom == article
                                select Article).Single();
                Commande cmd = new Commande
                {
                    num = num,
                    date = date,
                    ClientId = client_id
                };

                dc.Commande.InsertOnSubmit(cmd);
                dc.SubmitChanges();


                Article_Cmd acmd = new Article_Cmd
                {
                    quantite = quentite,
                    articleId = arti.Id,
                    cmdId = cmd.Id
                };

                dc.Article_Cmd.InsertOnSubmit(acmd);
                dc.SubmitChanges();

                txtLibelle.Text = "";
                txtDate.Text = "";
            }
            quantite.Text = "";
            DropDownList.Items.Clear();
            DropDownList1.Items.Clear();
            this.Page_Load(sender, e);



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                Commande cmd = (from Commande in dc.Commande
                                   where Commande.num == txtLibelle.Text
                                   select Commande).Single();
                Article_Cmd acmd= (from Article_Cmd in dc.Article_Cmd
                                   where Article_Cmd.cmdId == cmd.Id
                                   select Article_Cmd).Single();
                Article art= (from Article in dc.Article
                              where Article.nom == DropDownList1.Text
                              select Article).Single();
                cmd.num = txtLibelle.Text;
                cmd.date = txtDate.Text;
                acmd.quantite = int.Parse(quantite.Text);
                acmd.articleId = art.Id;

                dc.SubmitChanges();
                MessageBox.Show("Row Updated Successfully.");

            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }
            txtLibelle.Text = "" ;
            txtDate.Text = "" ;
            date.Text = "" ;
            clientId.Text = "" ;
            quantite.Text = "";
            DropDownList.Items.Clear();
            DropDownList1.Items.Clear();
            commande_chercher.Text = "" ;
            table_chercher.Visible = false ;

            this.Page_Load(sender ,  e);

        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string num = grd.Rows[e.RowIndex].Cells[1].Text;
              
                Commande commd = (from Commande in dc.Commande
                                where Commande.num == num
                                   select Commande).Single();
                
                Article_Cmd acmd = (from Article_Cmd in dc.Article_Cmd
                                    where Article_Cmd.cmdId == commd.Id
                                    select Article_Cmd).Single();
                dc.Article_Cmd.DeleteOnSubmit(acmd);
                dc.SubmitChanges();

                dc.Commande.DeleteOnSubmit(commd);
                dc.SubmitChanges();

                
                MessageBox.Show("Row Deleted Successfully.");

            }
            catch (Exception Ex)
            {
                
                MessageBox.Show(Ex.Message);
                return;
            }
            this.Page_Load(sender, e);
        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}