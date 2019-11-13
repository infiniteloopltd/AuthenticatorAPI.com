using System;

namespace AuthenticatorAPI
{
    public partial class Validate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var pin = Request.QueryString["Pin"];
            var secretCode = Request.QueryString["SecretCode"];
            if (string.IsNullOrEmpty(pin))
            {
                Response.Write("Pass 'Pin' in QueryString");
                return;
            }
            if (string.IsNullOrEmpty(secretCode))
            {
                Response.Write("Pass 'SecretCode' in QueryString");
                return;
            }
            var api = new AuthenticatorAPI();
            var ok = api.ValidatePin(pin, secretCode);
            Response.Write(ok);
        }
    }
}