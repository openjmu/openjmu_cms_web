///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/12 17:37
///
part of 'response_model.dart';

class UserLoginModel extends DataModel {
  UserLoginModel();

  factory UserLoginModel.fromJson(dynamic json) {
    return UserLoginModel()
      ..id = json['user_id'] as int
      ..username = json['username'] as String
      ..accessToken = json['access_token'] as String;
  }

  int id;
  String username;
  String accessToken;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': id,
      'username': username,
      'access_token': accessToken,
    };
  }
}
