﻿using System;
using System.Diagnostics;

namespace Institution
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("-- Abstract Implementation --");
            StudentA studentA = new StudentA("female", "6", "student", "Аня", "1A" );
            TeacherA teacherA = new TeacherA("female", "25", "teacher", "Светлана Ивановна", "1A" );

            Console.WriteLine(studentA.Gender);
            Console.WriteLine(studentA.Age);
            Console.WriteLine(studentA.Position);
            Console.WriteLine(studentA.FullName);
            Console.WriteLine(studentA.ClassNumber);
            Console.WriteLine(teacherA.Gender);
            // Console.WriteLine(teacherA.Age); // error here
            Console.WriteLine(teacherA.Position);
            Console.WriteLine(teacherA.FullName);
            Console.WriteLine(teacherA.ClassNumber);

            studentA.Warning();
            Console.WriteLine(studentA.GetAwayFromTheAnswer(teacherA));
            teacherA.Warning();
            Console.WriteLine(teacherA.GetAwayFromTheAnswer(studentA));
            Console.WriteLine("");


            Console.WriteLine("-- Interface Implementation --");
            StudentI studentI = new StudentI("male", "7", "student", "Вася", "2Б");
            TeacherI teacherI = new TeacherI("male", "26", "teacher", "Петр Сергеевич", "2Б");

            Console.WriteLine(studentI.Gender);
            Console.WriteLine(studentI.Age);
            Console.WriteLine(studentI.Position);
            Console.WriteLine(studentI.FullName);
            Console.WriteLine(studentI.ClassNumber);
            Console.WriteLine(teacherI.Gender);
            // Console.WriteLine(teacherI.Age); // error here
            Console.WriteLine(teacherI.Position);
            Console.WriteLine(teacherI.FullName);
            Console.WriteLine(teacherI.ClassNumber);
            Console.WriteLine(studentI.Age);

            ((IHuman)studentI).Warning();
            Console.WriteLine(studentI.GetAwayFromTheAnswer(teacherI));
            ((IHuman)teacherI).Warning();
            Console.WriteLine(teacherI.GetAwayFromTheAnswer(studentI));
            Console.WriteLine("");

            Console.WriteLine("-- Regular Implementation --");
            StudentR studentR = new StudentR("female", "8", "student", "Игнат", "3В");
            TeacherR teacherR = new TeacherR("female", "27", "teacher", "Екатерина Антоновна", "3В");

            Console.WriteLine(studentR.Gender);
            Console.WriteLine(studentR.Age);
            Console.WriteLine(studentR.Position);
            Console.WriteLine(studentR.FullName);
            Console.WriteLine(studentR.ClassNumber);
            Console.WriteLine(teacherR.Gender);
            // Console.WriteLine(teacherR.Age); // error here
            Console.WriteLine(teacherR.Position);
            Console.WriteLine(teacherR.FullName);
            Console.WriteLine(teacherR.ClassNumber);

            studentR.Warning();
            Console.WriteLine(studentR.GetAwayFromTheAnswer(teacherR));
            teacherR.Warning();
            Console.WriteLine(teacherR.GetAwayFromTheAnswer(studentR));
            try
            {
                studentR.Gender = "male";
                // studentR.Age = "9";
                // studentR.Position = "teacher";
                // studentR.FullName = "Игорь";
                // studentR.ClassNumber = "4Г";
            }
            catch (ArgumentException exc)
            {
                Console.WriteLine($"It's expected that '{exc.Message}'");
            }
            Console.WriteLine("");
            
            Console.WriteLine("11111111111111111111111111111111111111111111111111111111");
/////////////////////////////////////////////////////////////////////////////////////////////////////
///
            Environment.SetEnvironmentVariable("CONSUL_ENV_DATACENTER", "qa1");
            Environment.SetEnvironmentVariable("DOMAIN", "shipment-service");
            Environment.SetEnvironmentVariable("ENVIRONMENT", "qa1");
            var _environment = "qa1";
            
            string connectionString;
            if (_environment == "local")
            {
                Console.WriteLine("22222222222222222222222222222222222222222222222222222");
                connectionString = Environment.GetEnvironmentVariable("DB_CONTEXT");
            }
            else
            {
                Console.WriteLine("33333333333333333333333333333333333333333333333333333");
                ProcessStartInfo psi = new ProcessStartInfo
                {
                    FileName = "/bin/bash",
                    Arguments = "-c \". /home/mikalai/projects/sandbox/dotNet/Institution/helpers/export_consul_config.sh\"",
                    UseShellExecute = false,
                    RedirectStandardOutput = false,
                    CreateNoWindow = false
                };
                Process p = Process.Start(psi);
                p.WaitForExit();

                connectionString = String.Format("Host={0};Port={1};Database={2};User Id={3};Password={4};",
                    Environment.GetEnvironmentVariable("DBHOST"),
                    Environment.GetEnvironmentVariable("DBPORT"),
                    Environment.GetEnvironmentVariable("DBNAME"),
                    Environment.GetEnvironmentVariable("DBUSER"),
                    Environment.GetEnvironmentVariable("DBPASS")
                );
            }
            Console.WriteLine(connectionString);
        }
    }
}