using System.Web.Services;
using Google.Authenticator;

namespace AuthenticatorAPI
{
    /// <summary>
    /// API to generate and validate google authenticator
    /// </summary>
    [WebService(Namespace = "http://authenticatorapi.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class AuthenticatorAPI : WebService
    {

        [WebMethod]
        public PairingInfo Pair(string appName, string appInfo, string secretCode)
        {
            var tfa = new TwoFactorAuthenticator();
            var setupInfo = tfa.GenerateSetupCode(appName, appInfo, secretCode, 300, 300);

            var newQrUrl = ConvertToNewUrl(setupInfo.QrCodeSetupImageUrl);
               
            var html = "<a title='Manually pair with " + setupInfo.ManualEntryKey +
                       "' href='https://www.authenticatorapi.com'><img src='" + newQrUrl.Replace("http://","https://") +
                       "' border=0></a>";
            return new PairingInfo { ManualSetupCode = setupInfo.ManualEntryKey, Html = html };
        }


        static string ConvertToNewUrl(string originalUrl)
        {
            // Replace the necessary parts of the original URL
            var convertedUrl = originalUrl.Replace("https://chart.googleapis.com/chart?cht=qr&chs=", "https://api.qrserver.com/v1/create-qr-code/?size=");
            convertedUrl = convertedUrl.Replace("&chl=", "&data=");

            return convertedUrl;
        }
        
        [WebMethod]
        public bool ValidatePin(string pin, string secretCode)
        {
            var tfa = new TwoFactorAuthenticator();
            var isCorrectPin = tfa.ValidateTwoFactorPIN(secretCode, pin);
            return isCorrectPin;
        }
    }

    public class PairingInfo
    {
        public string ManualSetupCode { get; set; }
        public string Html { get; set; } 
    }
}
