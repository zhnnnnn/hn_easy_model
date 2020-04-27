import 'dart:ffi';

import 'package:hn_easy_model/hn_easy_model.dart';

@hn_easy_model
class Student extends Person {
  int grade;
  Map homework;
  var classes;
  dynamic seat;
}

@hn_easy_model
class Person extends HNEasyModel {
  int age;
  double weight;
  String name;
  bool married;
  Person mother;
  Person father;
  List<Person>friends;
}