using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Commande_Project
{
    public partial class LoginC : System.Web.UI.Page
    {
        DCDataContext ctx = new DCDataContext();
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lgn_Authenticate(object sender,EventArgs e)
        {
            var clt = (from Client in ctx.Client
                       select Client).ToList();
            foreach (Client c in clt)
            {
                if (c.email.Equals(login_.Text) && c.password.Equals(pass.Text))
                {
                    id = c.Id;
                    Session["c"] = c;
                    Response.Redirect("Passer_Commande.aspx");
                }
            }
        } 
    }
}