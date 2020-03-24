using System;

namespace Institution
{
    class Program
    {
        static void Main(string[] args)
        {
            StudentA studentA = new StudentA("female", "6", "student", "Аня", "1A" );
            TeacherA teacherA = new TeacherA("female", "25", "teacher", "Светлана Ивановна", "1A" );

            Console.WriteLine(studentA.GetAwayFromTheAnswer(teacherA));
            Console.WriteLine(teacherA.GetAwayFromTheAnswer(studentA));
            Console.WriteLine(studentA.Age);
            // Console.WriteLine(teacherA.Age); // throw an error
            studentA.Warning();
            teacherA.Warning();
        }
    }
}