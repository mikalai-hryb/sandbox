using System;
using System;
using System.Net.Http;
using System.Collections.Generic;
using System.Net.Http.Headers;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Microsoft.VisualBasic.CompilerServices;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.IO;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Currencies.Handlers
{
    public class FileInputHandler : IBaseHandler
    {
        public string OptionText => "Get information about the currencies from the provided file.";
        public static HttpClient client = new HttpClient();
        private const string _separator = ","; 
        
        public void Handle()
        {
            try
            {
                var currencies = GetCurrenciesAsync();
                var inputFilePathDefault = Directory.GetCurrentDirectory();
                Console.WriteLine(new ConsulGateway("qa1", "shipment-service").GetConnectionString());

                
                while (true)
                {
                    Console.WriteLine("Input the path to the file with currency abbreviations. " +
                                      $"The \"{_separator}\" separator must be used.");
                    
                    Console.WriteLine(inputFilePathDefault);
                    
                    const string filePathDefault = "/home/mikalai/projects/sandbox/dotNet/Currencies/CurrencyAbbreviations.txt";
                    var filePath = Console.ReadLine();
                    if (filePath == "")
                    {
                        filePath = filePathDefault;
                    }

                    

                    if (File.Exists(filePath))
                    {
                        var fileContent = File.ReadAllText(filePath);
                        var fileCurAbbreviations = fileContent.Split(_separator).Select(s => s.Trim()).ToList();
                        var filteredSortedCurrencies = currencies.Result
                            .Where(i =>  fileCurAbbreviations.Contains(i.Cur_Abbreviation))
                            .OrderBy(i => i.Cur_Abbreviation)
                            .ToList();
                        
                        Console.WriteLine("Input the output file path.");
                        // var filePathOut = Console.ReadLine();
                        const string filePathOut = "/home/mikalai/projects/sandbox/dotNet/Currencies/CurrencyAbbreviationsResult.json";
                        // var filePath = Console.ReadLine();
                        var filteredSortedCurrenciesJSON=  JsonConvert.SerializeObject(filteredSortedCurrencies, Formatting.Indented);
                        File.WriteAllText(filePathOut, filteredSortedCurrenciesJSON);
                    }
                    else
                    {
                        Console.WriteLine($"WARNING: There is no such a file under this path \"{filePath}\". Try again.");
                        continue;
                    }




                    
                }


            }
            catch (HttpRequestException)
            {
                Console.WriteLine("We are sorry. This option is not working for now. NBRB is not available.");
            }

            
            
            Console.WriteLine("");
            // var userOption = Console.ReadLine();


        }

        private static async Task<List<Currency>> GetCurrenciesAsync()
        {
            const string url = "http://www.nbrb.by/API/ExRates/Currencies";
            
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadAsStringAsync();
            var currencies = JsonConvert.DeserializeObject<List<Currency>>(result);
            return  currencies;
        }


    }
}
