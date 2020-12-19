using System;
using System.Collections;
using System.IO;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Currencies.Handlers;
using Newtonsoft.Json;
using Currencies.Helpers;

namespace Currencies
{
    class Program
    {
        static void Main(string[] args)
        {
            var Handlers = new List<IBaseHandler>()
            {
                new FileInputHandler()
            };
            while (true) {
                var message = new System.Text.StringBuilder("Make your chose:\n");
                for (int i = 0; i < Handlers.Count; i++)
                {
                    message.AppendLine($"  {i + 1}: {Handlers[i].OptionText}");
                }
                message.AppendLine("  0: Exit.");
                Console.WriteLine(message);
            
                // var userOption = Console.ReadLine();
                var userOption = "1";
                if (userOption == "0")
                {
                    Console.WriteLine("Exit!");
                    break;
                }
                
                if (Int32.TryParse(userOption, out var option))
                {
                    try
                    {
                        Handlers[option - 1].Handle();
                        break;
                    }
                    catch (ArgumentOutOfRangeException)
                    {
                        Console.WriteLine("There is no such implementation!");
                        continue;
                    }
                }
                else
                {
                    Console.WriteLine("This is a bad option");
                }
            }
            Thread.Sleep(8000);
        }
}
}
// private delegate void AppLogging(string message, int logLevel = 1);
            // AppLogging Log;
            // var fileLogger = new FileLogger(3);
            // // var consoleLogger = new ConsoleLogger(1);
            // Log = fileLogger.Log;
            // // Log += consoleLogger.Log;
            //
            // Log("abc", 5);
            // var a = DriveInfo.GetDrives();
            // for (var i = 0; i <= a.Length; i ++)
            // {
            //     var drive = a[i];
            //     
            //     Console.WriteLine(i);
            //     Console.WriteLine(drive);
            //     Console.WriteLine(drive.Name);
            //     Console.WriteLine(drive.DriveFormat);
            //     Console.WriteLine(drive.DriveType);
            //     Console.WriteLine("---------------");
            //
            // }
            //
            // HttpClient client = new HttpClient();
            // string currenciesURL = "http://www.nbrb.by/API/ExRates/Currencies";
            // string textFilePath = "/home/mikalai/projects/sandbox/dotNet/Currencies/CurrencyAbbreviations.txt";
            //
            // static async Task SendRequest(HttpClient client, string url)
            // {
            //     var response = await client.GetAsync(url);
            //     Console.WriteLine($"Received response {response.StatusCode} from {url}");
            // }
            //
            // var fileCurAbbreviations = new List<string>();
            // if (File.Exists(textFilePath))
            // {
            //     var fileCurContent = File.ReadAllText(textFilePath);
            //     fileCurAbbreviations = fileCurContent.Split(',').Select(s => s.Trim()).ToList();
            //     
            //     foreach (var fileCurAbbreviation in fileCurAbbreviations)
            //     {
            //         Console.WriteLine(fileCurAbbreviation);
            //     }
            //     Console.WriteLine(fileCurContent);
            // }
            //
            // var currencies = SendRequest(client, currenciesURL);
            // HttpResponseMessage response = client.GetAsync(currenciesURL).Result;
            // response.EnsureSuccessStatusCode();
            // string result = response.Content.ReadAsStringAsync().Result;
            // // Console.WriteLine(result);
            // var allCurrencies = JsonConvert.DeserializeObject<List<Currency>>(result);
            // var filteredSortedCurrencies = allCurrencies
            //     .Where(i =>  fileCurAbbreviations.Contains(i.Cur_Abbreviation))
            //     .OrderBy(i => i.Cur_Abbreviation)
            //     .ToList();
            // foreach (var i in filteredSortedCurrencies)
            // {
            //     // Console.WriteLine(i);
            // }
            //
            //
            // var filteredSortedCurrenciesSJSON=  JsonConvert.SerializeObject(filteredSortedCurrencies, Formatting.Indented);
            // // Console.WriteLine(filteredSortedCurrenciesSJSON);
            // // using (FileStream fs = new FileStream("/home/mikalai/projects/sandbox/dotNet/Currencies/abc.json", FileMode.OpenOrCreate))
            // // {
            //     // var output=  JsonConvert.DeserializeObject<List<Currency>>(filteredCurrencies);
            //     // Console.WriteLine("Data has been saved to file");
            // // }
            // System.IO.File.WriteAllText("/home/mikalai/projects/sandbox/dotNet/Currencies/abc.json", filteredSortedCurrenciesSJSON);