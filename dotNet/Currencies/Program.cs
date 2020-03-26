using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

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

            var fileCurAbbreviations = new List<string>();
            if (File.Exists(textFilePath))
            {
                var fileCurContent = File.ReadAllText(textFilePath);
                fileCurAbbreviations = fileCurContent.Split(',').Select(s => s.Trim()).ToList();
                
                foreach (var fileCurAbbreviation in fileCurAbbreviations)
                {
                    Console.WriteLine(fileCurAbbreviation);
                }
                Console.WriteLine(fileCurContent);
            }

            var currencies = SendRequest(client, currenciesURL);
            HttpResponseMessage response = client.GetAsync(currenciesURL).Result;
            response.EnsureSuccessStatusCode();
            string result = response.Content.ReadAsStringAsync().Result;
            // Console.WriteLine(result);
            var allCurrencies = JsonConvert.DeserializeObject<List<Currency>>(result);
            var filteredSortedCurrencies = allCurrencies
                .Where(i =>  fileCurAbbreviations.Contains(i.Cur_Abbreviation))
                .OrderBy(i => i.Cur_Abbreviation)
                .ToList();
            foreach (var i in filteredSortedCurrencies)
            {
                Console.WriteLine(i);
            }
            
            
            var filteredSortedCurrenciesSJSON=  JsonConvert.SerializeObject(filteredSortedCurrencies, Formatting.Indented);
            Console.WriteLine(filteredSortedCurrenciesSJSON);
            // using (FileStream fs = new FileStream("/home/mikalai/projects/sandbox/dotNet/Currencies/abc.json", FileMode.OpenOrCreate))
            // {
                // var output=  JsonConvert.DeserializeObject<List<Currency>>(filteredCurrencies);
                // Console.WriteLine("Data has been saved to file");
            // }
            System.IO.File.WriteAllText("/home/mikalai/projects/sandbox/dotNet/Currencies/abc.json", filteredSortedCurrenciesSJSON);

        }
    }
}
