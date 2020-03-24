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

            StudentI studentI = new StudentI("male", "7", "student", "Вася", "2Б");
            TeacherI teacherI = new TeacherI("male", "26", "teacher", "Петр Сергеевич", "2Б");

            Console.WriteLine(studentI.GetAwayFromTheAnswer(teacherI));
            Console.WriteLine(teacherI.GetAwayFromTheAnswer(studentI));
            Console.WriteLine(studentI.Age);
            // Console.WriteLine(teacherI.Age); // throw an error
            ((IHuman)studentI).Warning();
            ((IHuman)teacherI).Warning();
        }
    }
}