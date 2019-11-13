using System;

namespace AuthenticatorAPI
{
    public partial class pair : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var appName = Request.QueryString["AppName"];
            var appInfo = Request.QueryString["AppInfo"];
            var secretCode = Request.QueryString["SecretCode"];
            if (string.IsNullOrEmpty(appName)) { 
                Response.Write("Pass 'AppName' in QueryString");
                return;
            }
            if (string.IsNullOrEmpty(appInfo)) { 
                Response.Write("Pass 'AppInfo' in QueryString");
                return;
            }
            if (string.IsNullOrEmpty(secretCode)) { 
                Response.Write("Pass 'SecretCode' in QueryString");
                return;
            }
            var api = new AuthenticatorAPI();
            var setup = api.Pair(appName, appInfo, secretCode);
            Response.Write(setup.Html);
        }
    }
}