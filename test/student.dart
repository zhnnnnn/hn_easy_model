import 'package:hn_easy_model/hn_easy_model.dart';

@hn_easy_model
class Student extends Person {
  int grade;
}

@hn_easy_model
class Person extends HNEasyModel {
  int age;
  String name;
  Person mother;
  Person father;
  List<Person>friends;
}