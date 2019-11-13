using System;

namespace AuthenticatorAPI
{
    public partial class Default : System.Web.UI.Page
    {
        public string PairingHtml = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            var api = new AuthenticatorAPI();
            var result = api.Pair("Authenticator API demo", "demo", "1234");
            PairingHtml = result.Html;
        }
    }
}