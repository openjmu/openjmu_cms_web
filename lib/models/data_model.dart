///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 00:02
///
import 'dart:convert';

abstract class DataModel extends Object {
  const DataModel();

  // ignore: avoid_unused_constructor_parameters
  DataModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert(toJson());
}