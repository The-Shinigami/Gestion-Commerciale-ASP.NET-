using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Commande_Project
{
    public partial class Passer_Cmd : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            grd.DataSource = dc.Article_Cmd.ToList();
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

        //protected void btnCherche_Click(object sender, EventArgs e)
        //{
        //    Article_Cmd cmd = (from Article_Cmd in dc.Article_Cmd
        //                       where Article_Cmd.Id == int.Parse(txtId.Text)
        //                       select Article_Cmd).Single();
        //    Commande cd = (from Commande in dc.Commande
        //                   where Commande.num == txtLibelle.Text
        //                   select Commande).Single();
        //    Article art = (from Article in dc.Article
        //                   where Article.nom == txtArticle.Text
        //                   select Article).Single();

        //    txtDate.Text = cd.num;
        //    txtArticle.Text = art.nom;

        //}

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            int qt = 0;
            bool ok = true;
            string article = DropDownList.Text;


            if (string.IsNullOrWhiteSpace(DropDownList.Text) )
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
                Commande cd = (from Commande in dc.Commande
                               where Commande.num == txtLibelle.Text
                               select Commande).Single();
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



            grd.DataSource = dc.Article_Cmd;
            grd.DataBind();

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        Article_Cmd cmd = (from Article_Cmd in dc.Article_Cmd
        //                           where Article_Cmd.Id == int.Parse(txtId.Text)
        //                           select Article_Cmd).Single();
        //        Commande cd = (from Commande in dc.Commande
        //                       where Commande.num == txtLibelle.Text
        //                       select Commande).Single();
        //        Article arti = (from Article in dc.Article
        //                        where Article.nom == txtArticle.Text
        //                        select Article).Single();
        //        cmd.quantite = int.Parse(txtLibelle.Text);
        //        cmd.cmdId = int.Parse(txtDate.Text);
        //        cmd.articleId = int.Parse(txtArticle.Text);

        //        dc.SubmitChanges();
        //        MessageBox.Show("Row Updated Successfully.");

        //    }
        //    catch (Exception Ex)
        //    {
        //        MessageBox.Show(Ex.Message);
        //        return;
        //    }
        //    grd.DataSource = dc.Commande.ToList();
        //    grd.DataBind();

        //}



        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                Article_Cmd art = (from Article_Cmd in dc.Article_Cmd
                                   where Article_Cmd.Id == e.RowIndex
                                   select Article_Cmd).Single();

                dc.Article_Cmd.DeleteOnSubmit(art);
                dc.SubmitChanges();
                MessageBox.Show("Row Deleted Successfully.");

            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }

        }
    }
}