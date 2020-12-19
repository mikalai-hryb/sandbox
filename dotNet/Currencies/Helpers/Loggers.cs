using System;

namespace Currencies.Helpers 
{
    public class FileLogger
    {
        private readonly int _logLevel = 1;

        public FileLogger(int logLevel)
        {
            _logLevel = logLevel;
        }
        
        public void Log(string message, int level)
        {
            if (level >= _logLevel && _logLevel != 0)
            {
                Console.WriteLine(message);
            }
        }
    }
    
    public class ConsoleLogger
    {
        private readonly int _logLevel = 1;

        public ConsoleLogger(int logLevel)
        {
            _logLevel = logLevel;
        }
        
        public void Log(string message, int level)
        {
            if (level >= _logLevel && _logLevel != 0)
            {
                Console.WriteLine(message);
            }
        }
    }
}