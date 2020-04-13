
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
  'Group' : {'names' : ['students',],'types' : {'students' : 'List',},'listTypes' : {'students' : 'Person',},'listInsImps' : {'students' : () => new List<Person>(),},'setters' : {'students' : (dynamic instance, value) => instance.students = value,},'getters' : {'students' : (dynamic instance) => instance.students,},'instanceIMP' : () => Group()},'Student' : {'extends' : 'Person','names' : ['grade',],'types' : {'grade' : 'int',},'setters' : {'grade' : (dynamic instance, value) => instance.grade = value,},'getters' : {'grade' : (dynamic instance) => instance.grade,},'instanceIMP' : () => Student()},'Person' : {'names' : ['age','name','mother','father','friends',],'types' : {'age' : 'int','name' : 'String','mother' : 'Person','father' : 'Person','friends' : 'List',},'listTypes' : {'friends' : 'Person',},'listInsImps' : {'friends' : () => new List<Person>(),},'setters' : {'age' : (dynamic instance, value) => instance.age = value,'name' : (dynamic instance, value) => instance.name = value,'mother' : (dynamic instance, value) => instance.mother = value,'father' : (dynamic instance, value) => instance.father = value,'friends' : (dynamic instance, value) => instance.friends = value,},'getters' : {'age' : (dynamic instance) => instance.age,'name' : (dynamic instance) => instance.name,'mother' : (dynamic instance) => instance.mother,'father' : (dynamic instance) => instance.father,'friends' : (dynamic instance) => instance.friends,},'instanceIMP' : () => Person()},
};
void initializeEasyModel() {
  r.kAutoCreatedEasyModelMap = _hnFeflectableMap;
}
