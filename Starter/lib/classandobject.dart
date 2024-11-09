class Game{
  String? _name;

  String? getName(){
    return _name;
  }

  void setName(String name){
    this._name = name;
  }

  void displayGameinfo(){
    print("Name : $_name");

  }
}
void main(){

}

// class Animal {
//   void sound(){
//     print("Animal sound");
//   }
// }
//
// class Dog extends Animal{
//   void sound(){
//     print("Woof Woof");
//   }
// }
//
// void main(){
//   Dog dog = Dog();
//   dog.sound();
//
//   Animal animal = Animal();
//   animal.sound();
// }

