///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 00:02
///
import 'data_model.dart';

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
}

typedef DataFactory<T extends DataModel> = T Function(dynamic json);

final Map<Type, Function> dataModelFactories = <Type, DataFactory>{};

T makeModel<T extends DataModel>(dynamic json) {
  return dataModelFactories[T](json) as T;
}
