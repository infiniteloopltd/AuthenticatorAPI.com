using System;

namespace AuthenticatorAPI
{
    public partial class qr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Change requested by westermo.com
            var qs = Request.Url.Query;
            Response.Redirect("https://api.qrserver.com/v1/create-qr-code/?" + qs);
        }
    }
}