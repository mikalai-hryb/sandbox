using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Currencies
{
    class Program
    {
        static void Main(string[] args)
        {
            HttpClient client = new HttpClient();
            string currenciesURL = "http://www.nbrb.by/API/ExRates/Currencies";
            string textFilePath = "/home/mikalai/projects/sandbox/dotNet/Currencies/CurrencyAbbreviations.txt";
            
            static async Task SendRequest(HttpClient client, string url)
            {
                var response = await client.GetAsync(url);
                Console.WriteLine($"Received response {response.StatusCode} from {url}");
            }
            
            if (File.Exists(textFilePath))
            {
                string text = File.ReadAllText(textFilePath);
                IEnumerable<string> curAbbreviations = text.Split(',').Select(s => s.Trim());
                
                foreach (var curAbbreviation in curAbbreviations)
                {
                    Console.WriteLine(curAbbreviation);
                }
                Console.WriteLine(text);
            }

            var currencies = SendRequest(client, currenciesURL);
            HttpResponseMessage response = client.GetAsync(currenciesURL).Result;
            response.EnsureSuccessStatusCode();
            string result = response.Content.ReadAsStringAsync().Result;
            Console.WriteLine(result);


        }
    }
}
