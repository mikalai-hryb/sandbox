using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace Currencies.Handlers
{
    public class ConsulGateway
    {
        private readonly HttpClient _client = new HttpClient();
        private string _dataCenterName { get; }
        private string _domain { get; }

        public ConsulGateway(string environment, string domain)
        {
            _dataCenterName = environment.ToLower() == "stage" ? "staging" : environment.ToLower();
            _domain = domain;
        }

        public async Task<string> GetConsulValue(string url)
        {
            var response = await _client.GetAsync(url);
            response.EnsureSuccessStatusCode();

            return response.Content.ReadAsStringAsync().Result;
        }

        public string GetConnectionString()
        {
            var baseURLTemplate = $"http://consul-{_dataCenterName}.smileco.cloud:8500/v1/kv/{_domain}/";
            var consulDBValues= Task.WhenAll(new[]
            {
                GetConsulValue(String.Concat(baseURLTemplate, "db/DBHOST?raw")),
                GetConsulValue(String.Concat(baseURLTemplate, "db/DBPORT?raw")),
                GetConsulValue(String.Concat(baseURLTemplate, "db/DBNAME?raw")),
                GetConsulValue(String.Concat(baseURLTemplate, "db/DBUSER?raw")),
                GetConsulValue(String.Concat(baseURLTemplate, "db/DBPASS?raw"))
            }).Result;
            
            return String.Format("Host={0};Port={1};Database={2};User Id={3};Password={4};", consulDBValues);
        }
    }
}