using System;

namespace Institution
{
    // Base Absctract class
    abstract class AHuman
    {
        public string Gender;
        public string Age;
        public string Position;
        public string FullName;
        public string ClassNumber;

        public abstract string GetAwayFromTheAnswer(AHuman human);

        public void Warning()
        {
            Console.WriteLine($"Headteacher has been spotted by {FullName}");
        }

        public AHuman(string gender, string age, string position, string fullName, string classNumber)
        {
            Gender = gender;
            Age = age;
            Position = position;
            FullName = fullName;
            ClassNumber = classNumber;
        }
    }

    class StudentA : AHuman
    {
        public StudentA(string gender, string age, string position, string fullName, string classNumber)
            : base(gender, age, position, fullName, classNumber) {}

        public override string GetAwayFromTheAnswer(AHuman teacher)
        {
            return $"Ученик(-ца) {FullName} сделал(-а) невероятное сальто и " +
                   $"отвлек внимание учителя(-ьницы) {teacher.FullName}";
        }
    }

    class TeacherA : AHuman
    {
        public TeacherA(string gender, string age, string position, string fullName, string classNumber)
            : base(gender, age, position, fullName, classNumber) {}
        
        public override string GetAwayFromTheAnswer(AHuman student)
        {
            return $"Учитель(-ница) {FullName} на вопрос ученика(-цы) {student.FullName} " +
                   $"выбрал(-а) тактику 'Ща два влеплю'";
        }

        public new string Age
        {
            get { throw new Exception("Не Ваше дело!!!"); }
        }

    }

}