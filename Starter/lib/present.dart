class Person{
  String? name;
  int? age;
}

class Student extends Person{
  String? school;
  String? major;

  void displayStuInfo(){
    print("Name : $name");
    print("Age : $age");
    print("School : $school");
    print("Major : $major");

  }
}
void main(){
  Student stu1 = Student();
  stu1.name = "kakda";
  stu1.age = 21;
  stu1.school = "Setec";
  stu1.major = "MIS";

  stu1.displayStuInfo();
}

