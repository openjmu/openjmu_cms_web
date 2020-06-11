///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 00:02
///
import 'dart:convert';

part 'first_day_model.dart';

class ResponseModel<T extends DataModel> {
  ResponseModel({this.code, this.msg, this.data, this.models});

  factory ResponseModel.fromJson(
    Map<String, dynamic> json, {
    bool isModels = false,
  }) {
    return ResponseModel<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data:
          !isModels && json['data'] != null ? makeModel<T>(json['data']) : null,
      models: isModels && json['data'] != null && json['data'] is List
          ? (json['data'] as List<dynamic>)
              .map((dynamic item) => makeModel<T>(item))
              .toList()
          : null,
    );
  }

  final int code;
  final String msg;
  final T data;
  final List<T> models;

  bool get isSucceed => code == 1;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'data': models ?? data,
    };
  }

  @override
  String toString() {
    return const JsonEncoder().convert(toJson());
  }
}

typedef DataFactory<T extends DataModel> = T Function(dynamic json);

final Map<Type, Function> dataModelFactories = <Type, DataFactory>{
  FirstDayModel: (dynamic json) => FirstDayModel.fromJson(json),
};

T makeModel<T extends DataModel>(dynamic json) {
  return dataModelFactories[T](json) as T;
}

abstract class DataModel extends Object {
  const DataModel();

  // ignore: avoid_unused_constructor_parameters
  DataModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  @override
  String toString() => const JsonEncoder().convert(toJson());
}