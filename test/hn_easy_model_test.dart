import 'package:flutter_test/flutter_test.dart';
import 'package:hn_easy_model/hn_easy_model.dart';
import 'easy_model_headers.hneasymodel.dart';
import 'easy_model_headers.dart';
import 'group.dart';

void main() {
  test('test easy model', () {
    initializeEasyModel();
    Group temp = Group().hn_easyInitFromJson(testMap);
    expect(temp.students.last.friends.first.name, 'zhnnnnn2');
    expect(temp.hn_easyToJson()['students'][0]['friends'][0]['name'], 'zhnnnnn1');
  });
}

final testMap = {
  "students":[
    {
      "grade" : 1,
      "age" : 12,
      "name" : "zhangsan",
      "mother" : {
        "name" : "lu",
        "age" : 58
      },
      "father" : {
        "name" : "lu",
        "age" : 58
      },
      "friends":[
        {
          "name" : "zhnnnnn1",
          "age" : 11
        },
        {
          "name" : "lufaf",
          "age" : 12
        },
        {
          "name" : "ggsgs",
          "age" : 13
        },
      ]
    },
    {
      "grade" : 121,
      "age" : 112,
      "name" : "zh3131san",
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
          "age" : 121
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