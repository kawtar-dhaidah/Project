using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Net;
using MySql.Data.MySqlClient;
using System.Web;





namespace emailling.Controllers
{
    [ApiController]
    [Route("[controller]")]






    public class WeatherForecastController : ControllerBase
    {
        public IActionResult emailSender()
        {

            string cs = @"server=localhost;userid=root;password=*;database=sys";

            var con = new MySqlConnection(cs);
            con.Open();

            Console.WriteLine($"MySQL version : {con.ServerVersion}");
            Console.WriteLine("connection validate");

            string targetDate = DateTime.Now.Date.AddDays(5).ToString("yyyy-MM-dd");
            Console.WriteLine(targetDate);

            var stm = "SELECT email,date_nextVersement,idcommandes,clientName from commandes c ,products p where c.produit=p.product_name and p.etat like 'Retard'";
            var cmd = new MySqlCommand(stm, con);
            
            var version = cmd.ExecuteScalar().ToString();
            Console.WriteLine($"MySQL version: {version}");

            MySqlDataReader rdr = cmd.ExecuteReader();
            var a= "Une erreur s'est produite lors de l'envoi de l'e-mail : ";
            while (rdr.Read())
            {
                 Console.WriteLine(DateTime.Now.Date);
                Console.WriteLine(rdr.GetDateTime(1).Date);

                if (DateTime.Now.Date == rdr.GetDateTime(1).Date)
                {
                    // Console.WriteLine("{0} {1}", rdr.GetString(0), rdr.GetDateTime(1).Date);
                    // SendEmailToClient(rdr.GetString(0), rdr.GetInt32(2), rdr.GetDateTime(1).Date);

                    string emailFrom = "123@gmail.com";
                    string emailPassword = "yysryg";

                    MailMessage message = new MailMessage(emailFrom, rdr.GetString(0));
                    message.Subject = "Rappel de paiement - Date de versement aujourd'hui";
                    // message.Body = $"Cher client,\n\nVotre commande (ID: {rdr.GetInt32(2)}) passée le {rdr.GetDateTime(1).Date} est prête à être expédiée. Merci de votre confiance !\n\nCordialement,\nVotre entreprise";
                    message.Body = $"cher {rdr.GetString(3)},\n Nous espérons que vous allez bien. Nous souhaitons vous rappeler que la date de paiement de votre versement est aujourd'hui, {DateTime.Now.Date}. Nous apprécions grandement votre coopération et votre engagement envers notre entreprise.\n \n Merci de votre confiance !\n\nCordialement,\n\n .";
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); 
                    smtpClient.Credentials = new NetworkCredential(emailFrom, emailPassword);
                    smtpClient.EnableSsl = true;
                   
                    try
                    {
                       smtpClient.Send(message);
                       Console.WriteLine("E-mail envoyé avec succès !");
                    
                        a = "Les e-mails ont été envoyés avec succès !";                        
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Une erreur s'est produite lors de l'envoi de l'e-mail : " + ex.Message);
                    }
                         

                }

            }


            return Ok(a);

        }


    }
}