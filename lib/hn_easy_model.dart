
class HNEasyModel {

  /// JSON To Model
  ///
  /// model must callout with @hn_easy_model
  /// ensure you had run `flutter packages pub run build_runner build` created xx.hneasymodel.dart file.
  /// Note: while model change propertys include add、delete、etc.., you need run `flutter packages pub run build_runner build` to recreate xx.hneasymodel.dart
  ///
  dynamic hn_easyInitFromJson(Map jsonObj) {
    if (jsonObj == null) return null;
    if (kAutoCreatedEasyModelMap == null) return null;
    return _initManager._obj(this.runtimeType.toString(), jsonObj);
  }

  /// obj property set finish. If you want do something at this time override this method.
  void hn_easyPropertySetFinish(Map jsonObj) {}

  /// Model To Json
  ///
  /// model must callout with @hn_easy_model
  ///
  Map hn_easyToJson() {
    if (kAutoCreatedEasyModelMap == null) return null;
    return _initManager._json(this);
  }
}

class HNEasyBuilder {
  const HNEasyBuilder();
}
const hn_easy_model = const HNEasyBuilder();

// pravite
Map kAutoCreatedEasyModelMap = null;

class HNModelType {
  static String num = 'num';
  static String str = 'String';
  static String list = 'List';
  static String map = 'Map';
  static String bool = 'bool';
  static String int = 'int';
  static String double = 'double';
  static String _var = 'dynamic';
  static String dynamic = 'dynamic';
}

class _initManager {
  static dynamic _obj(String clsName, dynamic djsonObj) {
    if (djsonObj is Map) {
      Map <String,dynamic>jsonObj = new Map<String, dynamic>.from(djsonObj);
      Map curDataMap = kAutoCreatedEasyModelMap[clsName];
      if (curDataMap != null) {
        var instance = _instanceReflectable._instanceObj(clsName);

        List curPropertyNames = _instanceDataManager._classPropertyNames(clsName, null);
        Map curNameToTypeMap = _instanceDataManager._nameToTypeMap(clsName);
        Map curListInsideTypeMap = _instanceDataManager._listInsideTypeMap(clsName);

        var minNames = curPropertyNames.length > jsonObj.keys.length ? jsonObj.keys : curPropertyNames;
        for (String name in minNames) {
          String typeStr = curNameToTypeMap[name];
          if (typeStr == null) {
            continue;
          }
          else if (_instanceDataManager._isBasicType(typeStr)) {
            var safeValue = _instanceDataManager._safeValue(typeStr, jsonObj[name]);
            _instanceReflectable._invokeSetter(instance, name, safeValue);
          }
          else if (typeStr == HNModelType._var ||
                   typeStr == HNModelType.dynamic) {
            _instanceReflectable._invokeSetter(instance, name, jsonObj[name]);
          }
          else if (typeStr == HNModelType.list) {
            if (jsonObj[name] is List) {
              String insideListType = curListInsideTypeMap[name];
              if (insideListType != null) {
                List objList = _instanceReflectable._instanceList(clsName,name);
                for (var json in jsonObj[name]) {
                  var obj = _obj(insideListType, json);
                  if (obj != null) {
                    var saveObj = _instanceDataManager._safeValue(insideListType, obj);
                    if (saveObj != null) {
                      objList.add(saveObj);
                    }
                  }
                }
                _instanceReflectable._invokeSetter(instance, name, objList);
              }
            }
          }
          else {
            var curValue = jsonObj[name];
            if (curValue is Map) {
              var obj = _obj(typeStr, curValue);
              if (obj != null) {
                _instanceReflectable._invokeSetter(instance, name, obj);
              }
            }
          }
        }

        var propertySetFinish = (dynamic instance, dynamic json) => instance.hn_easyPropertySetFinish(json);
        propertySetFinish(instance,jsonObj);

        return instance;
      }
      return null;
    }
    else {
      return djsonObj;
    }
  }

  static Map _json(dynamic obj) {
    String clsName = obj.runtimeType.toString();
    Map curDataMap = kAutoCreatedEasyModelMap[clsName];
    if (curDataMap != null) {
      Map<String,dynamic> res = Map<String,dynamic>();

      List curPropertyNames = _instanceDataManager._classPropertyNames(clsName,null);
      Map curNameToTypeMap = _instanceDataManager._nameToTypeMap(clsName);
      Map curListInsideTypeMap = _instanceDataManager._listInsideTypeMap(clsName);

      for (String name in curPropertyNames) {
        String typeStr = curNameToTypeMap[name];
        var value = _instanceReflectable._invokeGetter(obj, name);
        if (value == null) {
          continue;
        }
        if (_instanceDataManager._isBasicType(typeStr)) {
          if (value != null) {
            res[name] = value;
          }
        }
        else if (typeStr == HNModelType.list) {
          if (value is List) {
            List objs = List();
            String insideTypeStr = curListInsideTypeMap[name];
            for (var sobj in value) {
              if (insideTypeStr != null) {
                if (_instanceDataManager._isBasicType(insideTypeStr)) {
                  objs.add(sobj);
                }
                else if (typeStr == HNModelType._var ||
                         typeStr == HNModelType.dynamic) {
                  // do nothing
                }
                else {
                  objs.add(_json(sobj));
                }
              }
            }
            res[name] = objs;
          }
        }
        else {
          if (_instanceDataManager._isBasicTypeValue(value)) {// var dynamic
            res[name] = value;
          }
          else {
            res[name] = _json(value);
          }
        }
      }
      return res;
    }
    else {
      return obj;
    }
  }
}

class _instanceDataManager {
  static List _classPropertyNames(String clsName, List totalNames) {
    Map curDataMap = kAutoCreatedEasyModelMap[clsName];
    if (totalNames == null) {
      totalNames = List();
    }
    if (curDataMap != null) {
      List curPropertyNames = curDataMap['names'];
      if (curPropertyNames != null) {
        totalNames.addAll(curPropertyNames);
      }
      String extendsClassName = curDataMap['extends'];
      if (extendsClassName != null) {
        _classPropertyNames(extendsClassName, totalNames);
      }
      return totalNames;
    }
    return totalNames;
  }

  static Map _nameToTypeMap(String clsName) {
    return _loadInheritanceChain(clsName, 'types', null);
  }

  static Map _listInsideTypeMap(String clsName) {
    return _loadInheritanceChain(clsName, 'listTypes', null);
  }

  static Map _settersMap(String clsName) {
    return _loadInheritanceChain(clsName, 'setters', null);
  }

  static Map _gettersMap(String clsName) {
    return _loadInheritanceChain(clsName, 'getters', null);
  }

  static Map _listInstanceImps(String clsName) {
    return _loadInheritanceChain(clsName, 'listInsImps', null);
  }

  static Map _loadInheritanceChain(String clsName, String key, Map map) {
    Map curDataMap = kAutoCreatedEasyModelMap[clsName];
    if (map == null) {
      map = Map();
    }
    if (curDataMap != null) {
      Map curMap = curDataMap[key];
      if (curMap != null) {
        map.addAll(curMap);
      }
      String extendsClassName = curDataMap['extends'];
      if (extendsClassName != null) {
        _loadInheritanceChain(extendsClassName, key, map);
      }
      return map;
    }
    return map;
  }

  static dynamic _safeValue(String type, dynamic value) {
    if (type == HNModelType.num) {
      if (value is num) {
        return value;
      }
    }
    else if (type == HNModelType.int) {
      if (value is int) {
        return value;
      }
      if (value is double) {
        return value.toInt();
      }
    }
    else if (type == HNModelType.double) {
      if (value is int) {
        return value.toDouble();
      }
      if (value is double) {
        return value;
      }
    }
    else if (type == HNModelType.str) {
      if (value is String) {
        return value;
      }
    }
    else if (type == HNModelType.map) {
      if (value is Map) {
        return value;
      }
    }
    else if (type == HNModelType.bool) {
      if (value is bool) {
        return value;
      }
      if (value is int) {
        return value == 0 ? false : true;
      }
    }
    else if (type == HNModelType.list) {
      if (value is List) {
        return value;
      }
    }
    else {
      return value;
    }

    return null;
  }

  static bool _isBasicTypeValue(dynamic value) {
    if (value is int ||
        value is double ||
        value is String ||
        value is bool ||
        value is Map) {
      return true;
    }
    else {
      return false;
    }
  }

  static bool _isBasicType(String typeStr) {
    if (typeStr == HNModelType.bool ||
        typeStr == HNModelType.int ||
        typeStr == HNModelType.double ||
        typeStr == HNModelType.str ||
        typeStr == HNModelType.map ||
        typeStr == HNModelType.num) {
      return true;
    }
    else {
      return false;
    }
  }
}

class _instanceReflectable {
  static dynamic _instanceObj(String clsName) {
    if (clsName?.length > 0) {
      Map clsMap = kAutoCreatedEasyModelMap[clsName];
      var instanceIMP = clsMap['instanceIMP'];
      return instanceIMP();
    }
    return null;
  }

  static dynamic _instanceList(String clsName, String listName) {
    if (clsName?.length > 0 && listName?.length > 0) {
      Map listInsImps = _instanceDataManager._listInstanceImps(clsName);
      if (listInsImps != null) {
        var imp = listInsImps[listName];
        if (imp != null) {
          return imp();
        }
      }
      return null;
    }
  }

  static void _invokeSetter(dynamic obj, String name,dynamic value) {
    if (obj == null || name == null) return;
    Map setters = _instanceDataManager._settersMap(obj.runtimeType.toString());
    var curSetter = setters[name];
    if (curSetter != null) {
      curSetter(obj,value);
    }
  }

  static dynamic _invokeGetter(dynamic obj, String name) {
    if (obj == null || name == null) return null;
    Map getters = _instanceDataManager._gettersMap(obj.runtimeType.toString());
    var curGetter = getters[name];
    return curGetter == null ? null : curGetter(obj);
  }
}