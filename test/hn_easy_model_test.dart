import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hn_easy_model/hn_easy_model.dart';
import 'easy_model_headers.hneasymodel.dart';
import 'easy_model_headers.dart';
import 'group.dart';
import 'student.dart';

void main() {
  test('test easy model', () {
    initializeEasyModel();
    Group temp = Group().hn_easyInitFromJson(testMap);

    // Json to model
    Student stu = temp.students.first;
    // int
    expect(stu.age, 12);
    // double
    expect(stu.weight, 60.11);
    // String
    expect(stu.name, "zhangsan");
    // bool
    expect(stu.married, false);
    // map
    expect(stu.homework['math'], 1);
    // var
    expect(stu.classes, 4);
    // dynamic
    expect(stu.seat, "1-3-4");
    // list
    expect(temp.students.length, 2);
    expect(temp.students.last.friends.first.name, 'zhnnnnn2');
    expect(temp.students.last.mother.name, 'lu31');

    // model to json
    Map easyMap = temp.hn_easyToJson();
    Map f = easyMap['students'][0];
    // int
    expect(f['age'], 12);
    // double
    expect(f['weight'], 60.11);
    // String
    expect(f['name'], "zhangsan");
    // bool
    expect(f['married'], false);
    // map
    expect(f['homework']['math'], 1);
    // var
    expect(f['classes'], 4);
    // dynamic
    expect(f['seat'], "1-3-4");
    // list
    expect(easyMap['students'].length, 2);
    expect(easyMap['students'][1]['friends'][0]['name'], "zhnnnnn2");
    expect(easyMap['students'][1]['mother']['name'], "lu31");
  });
}

final testMap = {
  "students":[
    {
      "weight" : 60.11,
      "grade" : 1,
      "age" : 12,
      "name" : "zhangsan",
      "homework" : {
        "math" : 1,
        "english" : 2
      },
      "married" : false,
      "classes" : 4,
      "seat" : "1-3-4",
      "mother" : {
        "name" : "lu",
        "age" : 58,
        "married" : true
      },
      "father" : {
        "name" : "lu",
        "age" : 58,
        "married" : true
      },
      "friends":[
        {
          "name" : "zhnnnnn1",
          "age" : 11,
          "married" : false
        },
        {
          "name" : "lufaf",
          "age" : 12,
          "married" : false
        },
        {
          "name" : "ggsgs",
          "age" : 13,
          "married" : false
        },
      ]
    },
    {
      "grade" : 121,
      "age" : 112,
      "name" : "zh3131san",
      "classes" : 2,
      "seat" : "5-3-4",
      "homework" : {
        "math" : 11,
        "english" : 22
      },
      "mother" : {
        "name" : "lu31",
        "age" : 28
      },
      "father" : {
        "name" : "lu",
        "age" : 18
      },
      "friends":[
        {
          "name" : "zhnnnnn2",
          "age" : 121,
          "married" : true
        },
        {
          "name" : "luaf",
          "age" : 132
        },
        {
          "name" : "gs",
          "age" : 153
        },
      ]
    },
  ]
};