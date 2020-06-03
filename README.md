# hn_easy_model

[中文🇨🇳](https://github.com/zhnnnnn/hn_easy_model/blob/master/README_CN.md)

A more easy way to do Flutter JSON serialization and deserialization.

## Installation

Add a dependency on hn_easy_model in your pubspec.

```
dependencies:
    hn_easy_model: any
    build_runner: any
```

## Usage

### Initialization 
#### 0x11
Create a dart file to aggregate headers. For example you created a dart file named `easy_model_headers.dart`.
#### 0x12 
Create a file named `build.yaml`，in the same path with `pubspec.yaml`. The content is as follows. `lib/easy_model_headers.dart` replace with right path.

```
targets:
  $default:
    builders:
      hn_easy_model:
        generate_for:
          - lib/easy_model_headers.dart 
```
#### 0x13
Switch to the command line run `flutter packages pub run build_runner build`. It will create a file named `easy_model_headers.hneasymodel.dart`.
#### 0x14
At the beginning of the program import previous file `import 'easy_model_headers.hneasymodel.dart';`. Execute code `initializeEasyModel();`

### Use model
#### 0x21
Model must extends `HNEasyModel` and annotation model with `@hn_easy_model`.

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
Use `hn_easyInitFromJson` method, example `model().hn_easyInitFromJson(map);`

#### 0x23 model to json
Use `hn_easyToJson` method, example `model.hn_easyToJson();`

#### 0x24
While model change you need run `flutter packages pub run build_runner build`. If there is an error you can run ` flutter packages pub run build_runner build --delete-conflicting-outputs` or just delete `easy_model_headers.hneasymodel.dart` file.

## Supported
* [x] int
* [x] double
* [x] bool
* [x] String
* [x] Custom model (need annotation with@hn_easy_model)
* [x] Map (cannot specify type)
* [x] List (you need specify type，support  custom model annotation with @hn_easy_model)
* [x] var dynamic (only support int、double、bool、String)

## Author
zhnnnnn, coderZhangHuiNan@163.com

## License
hn_easy_model is available under the MIT license. See the LICENSE file for more info.
