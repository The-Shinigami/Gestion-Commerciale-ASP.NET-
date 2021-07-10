using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
class Article_
{ private string nom;
    private float PU;
    private string categorie;
    public Article_ (string nom, float PU,string categorie) {
        this.nom = nom;
        this.PU = PU;
        this.categorie = categorie;
}


    public string Nom
    {
        get { return nom; }
        set { nom = value; }
    }

    public float Pu
    {
        get { return PU; }
        set { PU = value; }
    }
    public string Categorie
    {
        get { return categorie; }
        set { categorie = value; }
    }
}

namespace Commande_Project
{
    public partial class Ad_item : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            var articls = (from Article
                           in dc.Article
                           select Article).ToList();
            var categoris = (from Categorie
                           in dc.Categorie
                           select Categorie ).ToList();
            var c1 = (from Categorie
                          in dc.Categorie
                             select Categorie.categorie1).ToList();

            if (string.IsNullOrWhiteSpace(DropDownList.Text))
            {
                c1.Insert(0, "");
            }
            else
            {
                c1.Insert(0, DropDownList.Text);
            }

            DropDownList.DataSource =c1;
            DropDownList.DataBind();

            List<Article_> articles = new List<Article_>();
          
            foreach (var article in articls)
            {
               foreach(var categorie in categoris)
                if (article.categorieId == categorie.Id)
                {
                    articles.Add(new Article_(article.nom, (float)article.PU,categorie.categorie1));
                }
                
            }
            //Response.Write(dc.Article.ToList());
        
            grd.DataSource = articles;
            grd.DataBind();
           
        }

        private string GenerateCodeFromFunction(string function)
        {
            throw new NotImplementedException();
        }

        protected void btnLister_Click(object sender, EventArgs e)
        {
            show_list.Visible = !show_list.Visible;
        }
        protected void btnAjouter_Click(object sender, EventArgs e)
        {

            string nom = txtLibelle.Text;
            float pu = 0;
            string categorie_ = DropDownList.Text;
            int categorie_id = 0;


            bool ok = true;


            if (string.IsNullOrWhiteSpace(nom))
            {
                errLib.Text = "inserer un nom s'il vous plait !";
                errLib.Visible = true;
                ok = false;
            }
            else
            { errLib.Visible = false; }
            if (string.IsNullOrWhiteSpace(categorie_))
            {
                errLib.Text = "inserer une categorie s'il vous plait !";
                errLib.Visible = true;
                ok = false;
            }
            else
            { errLib.Visible = false; }
              

            try
            {
                    Categorie categori = (from Categorie
                                         in dc.Categorie
                                          where Categorie.categorie1 == categorie_
                                          select Categorie).Single();
                
                pu = float.Parse(txtPU.Text);
               categorie_id = categori.Id;
                errPu.Visible = false;
            }
            catch (Exception ex)
            {
                errPu.Text = "Format numérique invalide !";
                errPu.Visible = true;
                ok = false;
            }
            if (ok)
            {
                Article art = new Article
                {
                    nom = nom,
                    PU = pu,
                    categorieId = categorie_id,
                    
                };
                dc.Article.InsertOnSubmit(art);
                dc.SubmitChanges();
            }


            txtLibelle.Text = "";
            txtPU.Text = "";
            DropDownList.Items.Clear();
            this.Page_Load(sender, e);

        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

     

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            try
            {
                string nom = grd.Rows[e.RowIndex].Cells[1].Text;

                Article article = (from Article in dc.Article
                                   where Article.nom == nom
                                   select Article).Single();

                dc.Article.DeleteOnSubmit(article);
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

     
      

     
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                Article article = (from Article in dc.Article
                                   where Article.nom == txtLibelle.Text
                                   select Article).Single();
                article.nom = txtLibelle.Text;
                article.PU = float.Parse(txtPU.Text);
                Categorie categori = (from Categorie
                                         in dc.Categorie
                                      where Categorie.categorie1 == DropDownList.Text
                                      select Categorie).Single();

                
                article.categorieId = categori.Id;

                dc.SubmitChanges();
                MessageBox.Show("Row Updated Successfully.");

            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }
            txtLibelle.Text = "";
            txtPU.Text = "";
            DropDownList.Items.Clear();
            this.Page_Load(sender, e);


        }

        protected void btnCherche_Click(object sender, EventArgs e)
        {
            
            string num = txtLibelle.Text;
            String categorie_ = DropDownList.Text;
            bool ok = true;


            if (string.IsNullOrWhiteSpace(num))
            {
                errLib.Text = "Pour chercher inserer le nom de l'article s'il vous plait!!";
                errLib.Visible = true;
                ok = false;
            }
            else
            {
                errLib.Visible = false;
            }
            if (ok)
            {
                
                Article article = (from Article in dc.Article
                                   where Article.nom == txtLibelle.Text
                                   select Article).Single();
                txtPU.Text = article.PU.ToString();

                Categorie c = (from Categorie in dc.Categorie
                               where Categorie.Id == article.categorieId
                                select Categorie).Single();

                DropDownList.Text = c.categorie1;
               
            }



        }

   
    }
}