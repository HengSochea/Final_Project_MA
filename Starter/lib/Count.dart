import 'dart:io';

void main() {
  stdout.write("Enter Words: ");
  String? letter = stdin.readLineSync()!;
  dynamic space = letter.replaceAll(" ", "").toLowerCase();
  countChar(space);
}

dynamic countChar(String space){
  List<String> split = space.split("");
  List<String> count_char = [];
  print("===========================");
  print("Char Count");
  for(var char in split){
    if(!count_char.contains(char)){
      int count =0;
      for(var c in split){
        if(c == char){
          count++;
        }
      }
      print('$char = $count');
      count_char.add(char);
    }
  }
}


