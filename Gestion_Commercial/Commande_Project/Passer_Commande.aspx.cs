using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

public class Commande_client
{
    private string numero;
    private string date;
    private string article;
    private int quantite;
    public Commande_client(string numero, string date, string article, int quantite)
    {
        this.numero = numero;
        this.date = date;
        this.article = article;
        this.quantite = quantite;
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

}

namespace Commande_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Client client_ = (from Client in dc.Client
                         where Client.Id == LoginC.id
                         select Client).Single();




            client_name.InnerText = client_.nom + " "+client_.prenom ;
       

            var commands = (from Commande
                        in dc.Commande
                            where Commande.ClientId == LoginC.id
                            select Commande).ToList();
            
            var articls_cmds = (from Article_Cmd
                           in dc.Article_Cmd
                                select Article_Cmd).ToList();
            var articls = (from Article
                           in dc.Article
                           select Article).ToList();


            List<Commande_client> commandes = new List<Commande_client>();
            foreach (var article_cmd in articls_cmds)
            {
                foreach (var article in articls)
                    if (article.Id == article_cmd.articleId)
                    {
                        foreach (var commande in commands)
                        {
                            if (commande.Id == article_cmd.cmdId)
                            {
                                        commandes.Add(new Commande_client(commande.num, commande.date, article.nom, (int)article_cmd.quantite));
   
                            }
                        }

                    }

            }

            grd.DataSource = commandes;
            grd.DataBind();


            //remplir la list des articles
            var c1 = (from Article in dc.Article
                      select Article.nom).ToList();
            if (string.IsNullOrWhiteSpace(DropDownList.Text))
            {
                c1.Insert(0, "");
            }
            else
            {
                c1.Insert(0, DropDownList.Text);
            }

            DropDownList.DataSource = c1;
            DropDownList.DataBind();

        }
       

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            int qt = 0;
            bool ok = true;
            string article = DropDownList.Text;


            if (string.IsNullOrWhiteSpace(DropDownList.Text))
            {
                errLib.Text = "Inseré un article s'il vous plait";
                ok = false;

            }
            else
            {
                errLib.Text = "";
            }

            try
            {
                qt = int.Parse(txtLibelle.Text);


            }
            catch (Exception ex)
            {

                ok = false;
            }
            if (ok)
            {
                var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var Charsarr = new char[8];
                var random = new Random();

                for (int i = 0; i < Charsarr.Length; i++)
                {
                    Charsarr[i] = characters[random.Next(characters.Length)];
                }

                var num = new String(Charsarr);

                Commande cd = new Commande { 
                 num = num,
                date =  DateTime.Now.ToString("dd/MM/yyyy"),
                ClientId = LoginC.id

            };
                dc.Commande.InsertOnSubmit(cd);
                dc.SubmitChanges();

                Article arti = (from Article in dc.Article
                                where Article.nom == DropDownList.Text
                                select Article).Single();
                Article_Cmd cmde = new Article_Cmd
                {
                    quantite = qt,
                    cmdId = cd.Id,
                    articleId = arti.Id
                };
                dc.Article_Cmd.InsertOnSubmit(cmde);
                dc.SubmitChanges();
            }



            this.Page_Load(sender, e);



        }

      



        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                string num = grd.Rows[e.RowIndex].Cells[1].Text;

                Commande commd = (from Commande in dc.Commande
                                  where Commande.num == num
                                  select Commande).Single();

                Article_Cmd art = (from Article_Cmd in dc.Article_Cmd
                                   where Article_Cmd.cmdId == commd.Id
                                   select Article_Cmd).Single();

                dc.Article_Cmd.DeleteOnSubmit(art);
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
    }
}