using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Commande_Project
{
    public partial class Login : System.Web.UI.Page
    {
        DCDataContext dc = new DCDataContext();
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lgn_Authenticate(object sender, EventArgs e)
        {
            var adm = (from Admin in dc.Admin
                           select Admin).ToList();
            foreach (Admin a in adm)
            {
                if (a.login.Equals(login_.Text) && a.password.Equals(pass.Text))
                {
                    id = a.Id;
                    Session["a"] = a;
                    Response.Redirect("Ad_item.aspx");
                }
            }
        }

    }
}