using System.Web.Services;
using System.Configuration;
using Google.Authenticator;

namespace AuthenticatorAPI
{
    /// <summary>
    /// API to generate and validate google authenticator
    /// </summary>
    [WebService(Namespace = "otpAuthApi")]
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
            var html = "<a title='Manually pair with " + setupInfo.ManualEntryKey +
                       "' href='" + ConfigurationManager.AppSettings["host"] + "'><img src='" + setupInfo.QrCodeSetupImageUrl.Replace("http://","https://") +
                       "' border=0></a>";
            return new PairingInfo { ManualSetupCode = setupInfo.ManualEntryKey, Html = html };
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
