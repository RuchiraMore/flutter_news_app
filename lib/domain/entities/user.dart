import 'package:flutter_base_architecture/dto/base_dto.dart';

class User extends BaseDto {
  String access_token = "";
  String expires_at = "";

  User({this.access_token,this.expires_at}) : super();

  factory User.fromJson(dynamic json) {
    return User(
      access_token: json['access_token'],
      expires_at: json['expires_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }

  @override
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = this.access_token;
    data['expires_at'] = this.expires_at;

    return data;
  }

}