
import 'package:cricket_team_management/model/user_model.dart';

class LoginResponseModel {
  int code;
  String message;
  User data;

  LoginResponseModel(this.code, this.message, this.data);

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}