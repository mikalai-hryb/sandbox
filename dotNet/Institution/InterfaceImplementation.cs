using System;

namespace Institution
{
    interface IHuman
    {
        string Gender { get; set; }
        string Age { get; }
        string Position { get; set; }
        string FullName { get; set; }
        string ClassNumber { get; set; }

        string GetAwayFromTheAnswer(IHuman human);

        void Warning()
        {
            Console.WriteLine($"Headteacher has been spotted");
        }
    }

    class StudentI : IHuman
    {
        public string Gender { get; set; }
        public string Age { get; set; }
        public string Position { get; set; }
        public string FullName { get; set; }
        public string ClassNumber { get; set; }

        public StudentI(string gender, string age, string position, string fullName, string classNumber)
        {
            Gender = gender;
            Age = age;
            Position = position;
            FullName = fullName;
            ClassNumber = classNumber;
        }

        public string GetAwayFromTheAnswer(IHuman teacher)
        {
            return $"Ученик(-ца) {FullName} сделал(-а) невероятное сальто и " +
                   $"отвлек внимание учителя(-ьницы) {teacher.FullName}";
        }
    }

    class TeacherI : IHuman
    {
        public string Gender { get; set; }

        private string age;

        public string Age
        {
            get { throw new Exception("Не Ваше дело!!!"); }

            set { age = value; }
        }

        public string Position { get; set; }
        public string FullName { get; set; }
        public string ClassNumber { get; set; }

        public TeacherI(string gender, string age, string position, string fullName, string classNumber)
        {
            Gender = gender;
            Age = age;
            Position = position;
            FullName = fullName;
            ClassNumber = classNumber;
        }

        public string GetAwayFromTheAnswer(IHuman student)
        {
            return $"Учитель(-ница) {FullName} на вопрос ученика(-цы) {student.FullName} " +
                   $"выбрал(-а) тактику 'Ща два влеплю'";
        }
    }
}