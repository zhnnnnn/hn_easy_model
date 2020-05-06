# hn_easy_model
[中文🇨🇳](https://github.com/zhnnnnn/hn_easy_model/blob/master/README_CN.md)

更简单的Flutter json转模型

## 安装

在工程的`pubspec`文件里添加上`hn_easy_model`

```
dependencies:
    hn_easy_model:
```

## 使用

### 初始化配置 
#### 0x11
创建一个文件来聚合model的头文件。比如j你创建了一个文件命名如下 `easy_model_headers.dart`。
#### 0x12 
在和 `pubspec.yaml`同级的目录下创建一个文件`build.yaml`。内容如下， `lib/easy_model_headers.dart`需要根据正确的路径做一下修改。

```
targets:
  $default:
    builders:
      hn_easy_model:
        generate_for:
          - lib/easy_model_headers.dart 
```
#### 0x13
切到命令行跑一下 `flutter packages pub run build_runner build`。它会自动创建一个文件，文件名如下`easy_model_headers.hneasymodel.dart`。
#### 0x14
在工程初始化入口导入上一步创建的头文件 `import 'easy_model_headers.hneasymodel.dart';` 。执行一下如下方法 `initializeEasyModel();`

### 模型的使用
#### 0x21
模型需要继承 `HNEasyModel` 然后需要在类上方添加注解 `@hn_easy_model`.

```
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
```
#### 0x22 json to model
使用 `hn_easyInitFromJson`方法。 比如 `model().hn_easyInitFromJson(map);`

#### 0x23 model to json
使用`hn_easyToJson`。比如`model.hn_easyToJson();`

#### 0x24
模型只要做了修改你就需要跑一下 `flutter packages pub run build_runner build`.如果报错了你可以试一下这个命令 ` flutter packages pub run build_runner build --delete-conflicting-outputs` 或者直接先删除 `easy_model_headers.hneasymodel.dart` 。

## Supported
* [x] int
* [x] double
* [x] bool
* [x] String
* [x] Custom model（模型必须是加上了注解的）
* [x] Map (不能指定类型)
* [x] List (必须要指定类型，支持加上了注解的自定义的模型)
* [x] var dynamic (只支持 int、double、bool、String)

## Author
zhnnnnn, coderZhangHuiNan@163.com

## License
hn_easy_model is available under the MIT license. See the LICENSE file for more info.
