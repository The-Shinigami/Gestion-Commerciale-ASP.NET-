using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Commande_Project
{
    public partial class Categorie1 : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        public string catq;
        public static string lab;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.catq = lab;
            grd.DataSource = dc.Categorie.ToList();
            grd.DataBind();
        }

        protected void btnLister_Click(object sender, EventArgs e)
        {
            show_list.Visible = !show_list.Visible;
        }

            
        protected void btnAjouter_Click(object sender, EventArgs e)
        {

            string categorie = txtLibelle.Text;
        
            bool ok = true;


            if (string.IsNullOrWhiteSpace(categorie))
            {
                errLib.Text = "Inserer une Catégorie s'il vous plait!!";
                errLib.Visible = true;
                ok = false;
            }
            else
                errLib.Visible = false;

            if (ok)
            {
               Categorie cat = new Categorie
                {
                    categorie1 = categorie,
                  
                };
                dc.Categorie.InsertOnSubmit(cat);
                dc.SubmitChanges();
                txtLibelle.Text ="";
            }



            grd.DataSource = dc.Categorie;
            grd.DataBind();

        }
        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCherche_Click(object sender, EventArgs e)
        {
            string categorie = txtLibelle.Text;
      
            bool ok = true;


            if (string.IsNullOrWhiteSpace(categorie))
            {
                errLib.Text = "Pour chercher inserer une Catégorie s'il vous plait!!";
                
                ok = false;
            }

            if (ok)
            {
                
                Categorie categories = (from Categorie in dc.Categorie
                                       where Categorie.categorie1 == txtLibelle.Text
                                       select Categorie).Single();
                txtLibelle.Text = categories.categorie1;
                this.catq = txtLibelle.Text;
                lab= txtLibelle.Text;
               
                errLib.Visible = false;
            }
            else
            {
                errLib.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                Categorie categorie = (from Categorie in dc.Categorie
                                   where Categorie.categorie1 == this.catq
                                   select Categorie).Single();
                categorie.categorie1 = txtLibelle.Text;
               

                dc.SubmitChanges();
                MessageBox.Show("Row Updated Successfully.");

            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }
            this.Page_Load(sender, e);
        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

          
            int id = int.Parse(grd.Rows[e.RowIndex].Cells[1].Text);
            Categorie categorie = (from Categorie in dc.Categorie
                                   where Categorie.Id == id
                                   select Categorie).Single();

                Article art = (from Article in dc.Article
                               where Article.categorieId == categorie.Id
                               select Article).Single();

                dc.Article.DeleteOnSubmit(art);
                dc.SubmitChanges();

                dc.Categorie.DeleteOnSubmit(categorie);
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