using System;

namespace Institution
{
    class Program
    {
        static void Main(string[] args)
        {
            StudentA studentA = new StudentA("female", "6", "student", "Аня", "1A" );
            TeacherA teacherA = new TeacherA("female", "25", "teacher", "Светлана Ивановна", "1A" );
            var answer1 = studentA.GetAwayFromTheAnswer(teacherA);
            var answer2 = teacherA.GetAwayFromTheAnswer(studentA);
            Console.WriteLine(answer1);
            Console.WriteLine(answer2);
        }
    }
}