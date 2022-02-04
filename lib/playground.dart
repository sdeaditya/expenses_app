import 'dart:io';

run(){
  var name = "Aditya";
}

//DATA TYPES

void dataTyes(){
  //int, String, double, bool, dynamic - var

  const num = 0;
  const str = 'adi';
  const isTrue = true; 

}

//TYPE CASTING

cast(){
  var one = int.parse('1');
  assert(one == 1);

  var two = double.parse('1.2');
  assert(two == 1.2);

  String oneString = 1.toString();
  String pie = 3.14159.toStringAsFixed(2);
}