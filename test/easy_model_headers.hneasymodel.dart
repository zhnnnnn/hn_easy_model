
/**

██╗  ██╗███╗   ██╗        ███████╗ █████╗ ███████╗██╗   ██╗     ███╗   ███╗ ██████╗ ██████╗ ███████╗██╗     
██║  ██║████╗  ██║        ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝     ████╗ ████║██╔═══██╗██╔══██╗██╔════╝██║     
███████║██╔██╗ ██║        █████╗  ███████║███████╗ ╚████╔╝      ██╔████╔██║██║   ██║██║  ██║█████╗  ██║     
██╔══██║██║╚██╗██║        ██╔══╝  ██╔══██║╚════██║  ╚██╔╝       ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝  ██║     
██║  ██║██║ ╚████║███████╗███████╗██║  ██║███████║   ██║███████╗██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗███████╗
╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                                                                                                                                                                

🔥Automatically created，do not modify manually！

*/
    


import 'dart:core';
import 'package:hn_easy_model/hn_easy_model.dart' as r;
import 'group.dart';
import 'student.dart';
      
final _hnFeflectableMap = {
  'Group' : {'names' : ['students',],'types' : {'students' : 'List',},'listTypes' : {'students' : 'Student',},'listInsImps' : {'students' : () => new List<Student>(),},'setters' : {'students' : (dynamic instance, value) => instance.students = value,},'getters' : {'students' : (dynamic instance) => instance.students,},'instanceIMP' : () => Group()},'Student' : {'extends' : 'Person','names' : ['grade','homework','classes','seat',],'types' : {'grade' : 'int','homework' : 'Map','classes' : 'dynamic','seat' : 'dynamic',},'setters' : {'grade' : (dynamic instance, value) => instance.grade = value,'homework' : (dynamic instance, value) => instance.homework = value,'classes' : (dynamic instance, value) => instance.classes = value,'seat' : (dynamic instance, value) => instance.seat = value,},'getters' : {'grade' : (dynamic instance) => instance.grade,'homework' : (dynamic instance) => instance.homework,'classes' : (dynamic instance) => instance.classes,'seat' : (dynamic instance) => instance.seat,},'instanceIMP' : () => Student()},'Person' : {'names' : ['age','weight','name','married','mother','father','friends',],'types' : {'age' : 'int','weight' : 'double','name' : 'String','married' : 'bool','mother' : 'Person','father' : 'Person','friends' : 'List',},'listTypes' : {'friends' : 'Person',},'listInsImps' : {'friends' : () => new List<Person>(),},'setters' : {'age' : (dynamic instance, value) => instance.age = value,'weight' : (dynamic instance, value) => instance.weight = value,'name' : (dynamic instance, value) => instance.name = value,'married' : (dynamic instance, value) => instance.married = value,'mother' : (dynamic instance, value) => instance.mother = value,'father' : (dynamic instance, value) => instance.father = value,'friends' : (dynamic instance, value) => instance.friends = value,},'getters' : {'age' : (dynamic instance) => instance.age,'weight' : (dynamic instance) => instance.weight,'name' : (dynamic instance) => instance.name,'married' : (dynamic instance) => instance.married,'mother' : (dynamic instance) => instance.mother,'father' : (dynamic instance) => instance.father,'friends' : (dynamic instance) => instance.friends,},'instanceIMP' : () => Person()},
};
void initializeEasyModel() {
  r.kAutoCreatedEasyModelMap = _hnFeflectableMap;
}
