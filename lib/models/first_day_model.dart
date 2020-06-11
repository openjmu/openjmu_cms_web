///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/11 16:52
///
part of 'response_model.dart';

class FirstDayModel extends DataModel {
  FirstDayModel();

  factory FirstDayModel.fromJson(dynamic json) {
    return FirstDayModel()
        ..id = json['id'] as int
        ..value = json['value'] as String
        ..modifiedByUserId = json['modified_by_user_id'] as int;
  }

  int id;
  String value;
  int modifiedByUserId;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'value': value,
      'modified_by_user_id': modifiedByUserId,
    };
  }

}