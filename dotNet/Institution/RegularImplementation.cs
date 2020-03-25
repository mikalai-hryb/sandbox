using System;

namespace Institution
{
    class RHuman
    {
        delegate void ThrowAssignErrorMessage(string property);
        ThrowAssignErrorMessage throwAssignErrorMessage = property =>
        {
            throw new ArgumentException($"The property {property} can not be assigned!");
        };

        private string age;
        public string Age
        {
            get => age;
            set => throwAssignErrorMessage("Age");
        }

        private string gender;
        public string Gender {
            get => gender;
            set => throwAssignErrorMessage("Gender");
        }

        private string position;
        public string Position
        {
            get => position;
            set => throwAssignErrorMessage("Position");
        }

        private string fullName;
        public string FullName
        {
            get => fullName;
            set => throwAssignErrorMessage("FullName");
        }

        private string classNumber;
        public string ClassNumber
        {
            get => classNumber;
            set => throwAssignErrorMessage("ClassNumber");
        }

        public RHuman(string gender, string age, string position, string fullName, string classNumber)
        {
            this.gender = gender;
            this.age = age;
            this.position = position;
            this.fullName = fullName;
            this.classNumber = classNumber;
        }

        public void Warning()
        {
            Console.WriteLine($"Headteacher has been spotted by {FullName}");
        }

        public virtual string GetAwayFromTheAnswer(RHuman human)
        {
            throw new Exception("Must be implemented in the inheritors!");
        }
    }

    class StudentR : RHuman
    {
        public StudentR(string gender, string age, string position, string fullName, string classNumber)
            : base(gender, age, position, fullName, classNumber) {}

        public override string GetAwayFromTheAnswer(RHuman teacher)
        {
            return $"Ученик(-ца) {FullName} сделал(-а) невероятное сальто и " +
                   $"отвлек внимание учителя(-ьницы) {teacher.FullName}";
        }
    }

    class TeacherR : RHuman
    {
        public TeacherR(string gender, string age, string position, string fullName, string classNumber)
            : base(gender, age, position, fullName, classNumber) {}

        public new string Age => throw new Exception("Не Ваше дело!!!");

        public override string GetAwayFromTheAnswer(RHuman student)
        {
            return $"Учитель(-ница) {FullName} на вопрос ученика(-цы) {student.FullName} " +
                   $"выбрал(-а) тактику 'Ща два влеплю'";
        }
    }
}
