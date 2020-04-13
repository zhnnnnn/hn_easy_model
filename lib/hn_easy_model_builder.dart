import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'dart:async';

class HNEasyModelBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.hneasymodel.dart');
    var visibleLibraries = await buildStep.resolver.libraries.toList();
    var easyModels = [];
    var imports = [];
    for (LibraryElement curlibraryElement in visibleLibraries) {
      for (CompilationUnitElement unit in curlibraryElement.units) {
        for (ClassElement type in unit.types) {
          if (type.metadata.length > 0) {
            if (type.metadata.first.toString().contains("hn_easy_model")) {
              if (!easyModels.contains(type)) {
                easyModels.add(type);
              }
              String import = _generateImport(curlibraryElement);
              if (!imports.contains(import)) {
                imports.add(import);
              }
            }
          }
        }
      }
    }

    var params = _generateCode(easyModels);
    var res =
'''
${note}

import 'dart:core';
import 'package:hn_easy_model/hn_easy_model.dart' as r;
${imports.join('\n')}
      
final _hnFeflectableMap = {
  ${params}
};
void initializeEasyModel() {
  r.kAutoCreatedEasyModelMap = _hnFeflectableMap;
}
''';

    await buildStep.writeAsString(outputId, res);
  }

  @override
  final buildExtensions = const {
    '.dart': ['.hneasymodel.dart']
  };

  String _generateCode(List elements) {
    String res = '';
    for (Element element in elements) {
      res += _generateNormalParams(element);

      res += _generateInstance(element);
    }
    return res;
  }

  String _generateNormalParams(Element element) {
    var setters = '';
    var getters = '';
    var names = '';
    var types = '';
    var listTypes = '';
    var listInsIMPs = '';
    (element as ClassElement).fields.forEach((FieldElement element){
      if (element.setter == null || element.getter == null) return;
      String paramsString = element.toString();
      List ary = paramsString.split(' ');
      String type = ary.first;
      String name = ary.last;
      names += _generateName(name);
      setters += _generateSetter(name);
      getters += _generateGetter(name);

      if (type.indexOf('<') > 0) {
        int start = type.indexOf('<');
        int end = type.indexOf('>');
        if (start > 0) {
          var maintype = type.substring(0,start);
          types += _generateType(name, maintype);
          if (end > 0) {
            var insideType = type.substring(start + 1,end);
            listTypes += _generateListType(name, insideType);
            listInsIMPs += _generateListInstanceIMP(name, insideType);
          }
        }
      }
      else {
        types += _generateType(name, type);
      }
    });

    var extendsStr = '';
    List classDescAry = element.toString().split(' ');
    if (classDescAry.length == 4) {
      if (classDescAry[2] == 'extends') {
        extendsStr = classDescAry.last;
        extendsStr = extendsStr == 'HNEasyModel' ? '' : extendsStr;
      }
    }

    var res =  "'${element.name}' : {";
    if (extendsStr.length > 0) {
      res += "'extends' : '${extendsStr}',";
    }
    res += "'names' : [${names}],";
    res += "'types' : {${types}},";
    if (listTypes.length > 0) {
      res += "'listTypes' : {${listTypes}},";
      res += "'listInsImps' : {${listInsIMPs}},";
    }
    res += "'setters' : {${setters}},";
    res += "'getters' : {${getters}},";
    return res;
  }

  String _generateName(String name) {
    return "'${name}',";
  }

  String _generateType(String name, String type) {
    return "'${name}' : '${type}',";
  }

  String _generateListType(String name, String type) {
    return "'${name}' : '${type}',";
  }

  String _generateListInstanceIMP(String name, String type) {
    return "'${name}' : () => new List<${type}>(),";
  }

  String _generateSetter(String name) {
    return "'${name}' : (dynamic instance, value) => instance.${name} = value,";
  }

  String _generateGetter(String name) {
    return "'${name}' : (dynamic instance) => instance.${name},";
  }

  String _generateInstance(Element element) {
    return "'instanceIMP' : () => ${element.name}()},";
  }

  String _generateImport(LibraryElement library) {
    var uri = library.source.uri;
    if (uri.scheme == 'asset') {
      return "import '${uri.pathSegments.last}';";
    }
    else {
      String package = uri.pathSegments[0];
      String path = uri.path.substring(package.length + 1);
      return "import 'package:${package}/${path}';";
    }
  }
}

Builder hnEasyModelBuilder(BuilderOptions options) => HNEasyModelBuilder();

final String note =
'''

/**

██╗  ██╗███╗   ██╗        ███████╗ █████╗ ███████╗██╗   ██╗     ███╗   ███╗ ██████╗ ██████╗ ███████╗██╗     
██║  ██║████╗  ██║        ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝     ████╗ ████║██╔═══██╗██╔══██╗██╔════╝██║     
███████║██╔██╗ ██║        █████╗  ███████║███████╗ ╚████╔╝      ██╔████╔██║██║   ██║██║  ██║█████╗  ██║     
██╔══██║██║╚██╗██║        ██╔══╝  ██╔══██║╚════██║  ╚██╔╝       ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝  ██║     
██║  ██║██║ ╚████║███████╗███████╗██║  ██║███████║   ██║███████╗██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗███████╗
╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                                                                                                                                                                

🔥Automatically created，do not modify manually！

*/
    
''';