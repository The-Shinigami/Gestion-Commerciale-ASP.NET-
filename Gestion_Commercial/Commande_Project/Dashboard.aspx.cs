using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Commande_Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var article = (from Article in dc.Article
                           select new { Article.nom, Article.PU }).ToList();
            GridView1.DataSource = article;
            GridView1.DataBind();

        }

        public List<Article> GetProducts()
        {
            
                var article = (from Article in dc.Article
                               select Article).ToList();
                return article;
            

        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            Categorie cg = (from Categorie in dc.Categorie where Categorie.categorie1 == DropDownList1.Text select Categorie).Single();
            var art = (from Article in dc.Article where Article.categorieId == cg.Id select new { Article.nom, Article.PU }).ToList();

            GridView1.DataSource = art;
            GridView1.DataBind();

        }

       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}